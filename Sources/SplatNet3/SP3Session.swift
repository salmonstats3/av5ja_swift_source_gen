//
//  SPSession.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

/// SP3用のセッションクラス
open class SP3Session: Session {
    public typealias Credential = UserInfo
    public typealias Completion = (Float, Float) -> Void

    @Published var requests: [SPProgress] = []

    public override init() {
        super.init()
    }

    override func request(_ request: IksmSession) async -> [String : String]? {
        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(request))
        })
        let response: [String: String]? = await super.request(request)
        DispatchQueue.main.async(execute: {
            self.requests.success()
        })
        return response
    }

    /// 通常のリクエスト
    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType where T : RequestType {
        let endpoint: SPEndpoint = SPEndpoint(request: request)
        do {
            DispatchQueue.main.async(execute: {
                if endpoint != .UNKNOWN && endpoint != .STATS {
                    self.requests.append(SPProgress(request))
                }
            })
            let response: T.ResponseType = try await super.request(request)
            DispatchQueue.main.async(execute: {
                if endpoint != .UNKNOWN && endpoint != .STATS {
                    self.requests.success()
                }
            })
            return response
        } catch(let error) {
            DispatchQueue.main.async(execute: {
                if endpoint != .UNKNOWN {
                    self.requests.failure()
                }
            })
            throw error
        }
    }

    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String where T : RequestType {
        do {
            DispatchQueue.main.async(execute: {
                self.requests.append(SPProgress(request))
            })
            let response: String = try await super.request(request)
            DispatchQueue.main.async(execute: {
                self.requests.success()
            })
            return response
        } catch(let error) {
            DispatchQueue.main.async(execute: {
                self.requests.failure()
            })
            throw error
        }
    }

    @discardableResult
    public func getAllCoopStageScheduleQuery() async throws -> [CoopSchedule] {
        return try await request(CoopStageScheduleQuery())
    }

    @discardableResult
    open func getCoopStageScheduleQuery() async throws -> [CoopSchedule] {
        let schedules: [StageScheduleQuery.CoopSchedule] = try await request(StageScheduleQuery()).data.coopGroupingSchedule.schedules
        let weaponURLs: [SPAssetType<WeaponId>] = Array(Set(schedules.flatMap({ $0.setting.weapons.map({ SPAssetType(key: $0.image.hash.asWeaponId(), url: $0.image.url) }) })))
        try await getAssetsFromSplatNet3(assetURLs: weaponURLs)
        return schedules.map({ CoopSchedule(schedule: $0) })
    }

    open func getCoopHistoryQuery() async throws -> CoopHistoryQuery.CoopResult {
        try await request(CoopHistoryQuery()).data.coopResult
    }

    @discardableResult
    open func getAllCoopHistoryDetailQuery(playTime: Date? = nil, upload: Bool = false, completion: Completion) async throws -> [CoopResult] {
        completion(0, 1)
        let coopResult: CoopHistoryQuery.CoopResult = try await getCoopHistoryQuery()
        /// ノード
        let nodes: [CoopHistoryQuery.HistoryGroup] = coopResult.historyGroups.nodes
        /// 取得すべきリザルトのID
        let resultIds: [Common.ResultId] = {
            if let playTime = playTime {
                return nodes.flatMap({ $0.historyDetails.nodes.map({ $0.id }) }).filter({ $0.playTime > playTime })
            }
            return nodes.flatMap({ $0.historyDetails.nodes.map({ $0.id }) })
        }()
        /// 取得するIDがないなら何もせずに返す
        if resultIds.isEmpty {
            completion(1, 1)
            return []
        }
        /// 進捗を更新
        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(.COOP_RESULT))
        })
        /// 並列ダウンロード
        let response: [CoopResult] = try await withThrowingTaskGroup(of: CoopResult.self, body: { task in
            nodes.forEach({ node in
                node.historyDetails.nodes.forEach({ result in
                    if resultIds.contains(result.id) {
                        task.addTask(operation: { [self] in
                            return try await getCoopHistoryDetailQuery(schedule: node.asSchedule(), result: result)
                        })
                    }
                })
            })
            return try await task.reduce(into: [CoopResult]()) { results, result in
                results.append(result)
                completion(Float(results.count), Float(resultIds.count))
            }
        })

        // 所持しているブキのIDが返る
        let weaponURLs: [SPAssetType<WeaponId>] = Array(Set(response.flatMap({ $0.weaponURLs })))
        try await getAssetsFromSplatNet3(assetURLs: weaponURLs)
        // 出現したオオモノのIDが返る
        let enemyURLs: [SPAssetType<EnemyId>] = Array(Set(response.flatMap({ $0.enemyURLs })))
        try await getAssetsFromSplatNet3(assetURLs: enemyURLs)

        /// 一括アップロード
        if upload {
            try await uploadAllCoopHistoryDetailQuery(response)
        }
        /// 進捗を更新
        DispatchQueue.main.async(execute: {
            self.requests.success()
        })
        return response
    }

    @discardableResult
    open func uploadAllCoopResultDetailQuery(results: [CoopResult] = [], completion: Completion) async throws -> [CoopStatsResultsQuery.Response] {
        var count: Int = 0
        completion(Float(count), Float(results.count))

        DispatchQueue.main.async(execute: {
            self.requests.append(SPProgress(.STATS))
        })

        let response: [CoopStatsResultsQuery.Response] = try await results.chunked(by: 200).asyncFlatMap({ result in
            count += result.count
            completion(Float(count), Float(results.count))
            return try await uploadAllCoopHistoryDetailQuery(result)
        })

        DispatchQueue.main.async(execute: {
            self.requests.success()
        })
        
        return response
    }

    public func getAssetsFromSplatNet3() async throws -> Void {
        do {
            /// 通常ブキ画像
            let weaponURLs: [SPAssetType<WeaponId>] = try await request(WeaponRecordQuery()).assets.weapons
            try await getAssetsFromSplatNet3(assetURLs: weaponURLs)
            /// スペシャル画像
            let specialURLs: [SPAssetType<SpecialId>] = try await request(WeaponRecordQuery()).assets.specials
            try await getAssetsFromSplatNet3(assetURLs: specialURLs)
            /// ステージ画像
            let stageURLs: [SPAssetType<CoopStageId>] = (try await request(StageScheduleQuery()).data.coopGroupingSchedule.assets) + (try await request(CoopRecordQuery()).assets)
            try await getAssetsFromSplatNet3(assetURLs: stageURLs)
            /// バッジ画像
            let badgeURLs: [SPAssetType<BadgeInfoId>] = try await request(HistoryRecordQuery()).assets
            try await getAssetsFromSplatNet3(assetURLs: badgeURLs)
        } catch (let error) {
            print(error)
        }
    }
}

extension SP3Session: Authenticator {
    public func refresh(_ credential: UserInfo, for session: Alamofire.Session, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        Task {
            let session: SP3Session = SP3Session()
            do {
                let account: UserInfo = try await session.refreshIfNeeded(contentId: .SP3)
                completion(.success(account))
            } catch (let error) {
                completion(.failure(error))
            }
        }
    }

    public func apply(_ credential: UserInfo, to urlRequest: inout URLRequest) {
        if let bulletToken: String = credential.bulletToken {
            #if DEBUG
            urlRequest.headers.add(.authorization(bearerToken: bulletToken))
            #else
            urlRequest.headers.add(.authorization(bearerToken: bulletToken))
            #endif
            urlRequest.headers.add(name: "X-Web-View-Ver", value: version)
        }
    }

    public func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        return response.statusCode == 401
    }

    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: UserInfo) -> Bool {
        return false
    }

    /// GraphQLを利用したリクエスト
    private func request<T>(_ request: T) async throws -> T.ResponseType where T : GraphQL {
        let interceptor: AuthenticationInterceptor<SP3Session>? = {
            guard let account = account else {
                return nil
            }
            return AuthenticationInterceptor(authenticator: self, credential: account)
        }()
        do {
            /// リザルト取得時はプログレスバーを非表示にする
            DispatchQueue.main.async(execute: {
                if request.hash != .CoopHistoryDetailQuery {
                    self.requests.append(SPProgress(request))
                }
            })
            let response: T.ResponseType = try await session.request(request, interceptor: interceptor)
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
            /// リザルト取得時はプログレスバーを非表示にする
            DispatchQueue.main.async(execute: {
                if request.hash != .CoopHistoryDetailQuery {
                    self.requests.success()
                }
            })
            return response
        } catch(let error) {
            DispatchQueue.main.async(execute: {
                if request.hash != .CoopHistoryDetailQuery {
                    self.requests.failure()
                }
            })
            throw error
        }
    }

    /// 利用したことがあるQRコードを取得する
    private func getCheckInHistory() async throws -> [CheckinWithQRCodeMutation.CheckInEventId] {
        try await request(CheckinQuery()).data.checkinHistories.map({ $0.id })
    }

    /// アセット取得
    private func getAssetsFromSplatNet3<T>(assetURLs: [SPAssetType<T>]) async throws -> Void where T.RawValue == Int {
        guard let document: URL = FileManager.default.document
        else {
            return
        }

        // ドキュメントパス
        let documentPath: URL = document.appendingPathComponent(String(describing: T.self))
        try FileManager.default.createDirectory(atPath: documentPath.path, withIntermediateDirectories: true, attributes: nil)

        // 差分を取得する
        let caches: Set<T> = Set((try FileManager.default.contentsOfDirectory(atPath: documentPath.path)).compactMap({ Int($0.dropLast(4)) }).compactMap({ T(rawValue: $0) }))
        let urls: [SPAssetType<T>] = assetURLs.filter({ !caches.contains($0.key) })
        SwiftyLogger.info("\(T.self): Caches: \(caches.count), Assets: \(assetURLs.count), Gets: \(urls.count)")
        // 取得するものがなければスキップする
        if (urls.count == 0) {
            return
        }
        let assets: [SPAssetData<T>] = try await withThrowingTaskGroup(of: SPAssetData<T>.self, body: { task in
            urls.forEach({ asset in
                task.addTask(operation: { [self] in
                    SwiftyLogger.info("Downloading \(asset.key.rawValue): \(asset.hash)")
                    return SPAssetData(key: asset.key, data: try await download(asset.url))
                })
            })
            return try await task.reduce(into: [SPAssetData<T>]()) { results, result in
                results.append(result)
            }
        })
        assets.forEach({ asset in
            let destination: URL = documentPath
                .appendingPathComponent(asset.key.rawValue.description)
                .appendingPathExtension("png")
            do {
                try asset.data.write(to: destination, options: .noFileProtection)
            } catch (let error) {
                print(error)
            }
        })
    }

    /// 利用していないQRコードをリクエストする
    @discardableResult
    public func getCheckInWithQRCode() async throws -> [CheckinWithQRCodeMutation.CreateCheckinHistory] {
        let eventIdHistories: Set<CheckinWithQRCodeMutation.CheckInEventId> = Set(try await getCheckInHistory())
        let eventIds: Set<CheckinWithQRCodeMutation.CheckInEventId> = Set(CheckinWithQRCodeMutation.CheckInEventId.allCases).subtracting(Set(eventIdHistories))
        /// 並列ダウンロード
        let response: [CheckinWithQRCodeMutation.CreateCheckinHistory] = try await withThrowingTaskGroup(of: CheckinWithQRCodeMutation.CreateCheckinHistory.self, body: { task in
            eventIds.forEach({ eventId in
                task.addTask(operation: { [self] in
                    return try await getCheckInWithQRCodeMutation(eventId: eventId)
                })
            })
            return try await task.reduce(into: [CheckinWithQRCodeMutation.CreateCheckinHistory]()) { results, result in
                results.append(result)
            }
        })
        return response
    }

    func getCheckInWithQRCodeMutation(eventId: String) async throws -> CheckinWithQRCodeMutation.CreateCheckinHistory {
        return try await request(CheckinWithQRCodeMutation(eventId: eventId)).data.createCheckinHistory
    }

    private func getCheckInWithQRCodeMutation(eventId: CheckinWithQRCodeMutation.CheckInEventId) async throws -> CheckinWithQRCodeMutation.CreateCheckinHistory {
        return try await request(CheckinWithQRCodeMutation(eventId: eventId)).data.createCheckinHistory
    }

    private func getCoopHistoryDetailQuery(resultId: Common.ResultId) async throws -> CoopHistoryDetailQuery.CoopHistoryDetail {
        return try await request(CoopHistoryDetailQuery(resultId: resultId)).data.coopHistoryDetail
    }

    @discardableResult
    private func uploadAllCoopHistoryDetailQuery(_ results: [CoopResult]) async throws -> [CoopStatsResultsQuery.Response] {
        return try await request(CoopStatsResultsQuery(results: results))
    }

    @discardableResult
    private func uploadResult(_ result: CoopResult) async throws -> [CoopStatsResultsQuery.Response] {
        return try await request(CoopStatsResultsQuery(result: result))
    }

    private func getCoopHistoryDetailQuery(
        schedule: CoopHistoryQuery.CoopSchedule,
        result: CoopHistoryQuery.HistoryDetail
    ) async throws -> CoopResult {
        return CoopResult(
            history: schedule,
            content: try await request(CoopHistoryDetailQuery(resultId: result.id)).data.coopHistoryDetail
        )
    }
}
