//
//  SPSession.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// SP3用のセッションクラス
open class SP3Session: Session {
    public typealias Credential = UserInfo
    public typealias Completion = (Float, Float) -> Void

    @Published var requests: [SPProgress] = []

    override public init() {
        super.init()
    }

    override func request(_ request: IksmSession) async -> [String: String]? {
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
    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType where T: RequestType {
        let endpoint = SPEndpoint(request: request)
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
        } catch {
            DispatchQueue.main.async(execute: {
                if endpoint != .UNKNOWN {
                    self.requests.failure()
                }
            })
            throw error
        }
    }

    override open func request<T>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String where T: RequestType {
        do {
            DispatchQueue.main.async(execute: {
                self.requests.append(SPProgress(request))
            })
            let response: String = try await super.request(request)
            DispatchQueue.main.async(execute: {
                self.requests.success()
            })
            return response
        } catch {
            DispatchQueue.main.async(execute: {
                self.requests.failure()
            })
            throw error
        }
    }

    @discardableResult
    public func getAllCoopStageScheduleQuery() async throws -> [CoopSchedule] {
        try await request(CoopStageScheduleQuery())
    }

    @discardableResult
    open func getCoopStageScheduleQuery() async throws -> [CoopSchedule] {
        try await request(StageScheduleQuery()).data.coopGroupingSchedule.schedules.map({ CoopSchedule(schedule: $0) })
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
            if let playTime {
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
                            try await getCoopHistoryDetailQuery(schedule: node.asSchedule(), result: result)
                        })
                    }
                })
            })
            return try await task.reduce(into: [CoopResult]()) { results, result in
                results.append(result)
                completion(Float(results.count), Float(resultIds.count))
            }
        })

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

    public func getAssetsFromHashServer(url: URL) async throws {
        guard let document: URL = FileManager.default.document
        else {
            return
        }
        SwiftyLogger.info("HashServer: \(url)")
        let resource: ResourceType = try await session.download(url)
            .serializingDecodable(ResourceType.self, decoder: decoder)
            .value
        let assetURLs: [URL] = resource.urls + (try await getAssetURLs())
        let assets: [ResourceType.Response] = try await withThrowingTaskGroup(of: ResourceType.Response?.self, body: { task in
            assetURLs.forEach({ url in
                task.addTask(operation: { [self] in
                    ResourceType.Response(url: url, data: try? await download(url))
                })
            })
            return try await task.reduce(into: [ResourceType.Response]()) { results, result in
                results.append(result)
            }
        }).compactMap({ $0 })
        print("Resources", resource.urls.count, assets.count)
        assets.forEach({ asset in
            let documentPath: URL = document.appendingPathComponent(asset.type.rawValue)
            do {
                try FileManager.default.createDirectory(atPath: documentPath.path, withIntermediateDirectories: true, attributes: nil)
                let destination: URL = documentPath
                    .appendingPathComponent("\(asset.rawValue)", conformingTo: .png)
                try asset.data.write(to: destination, options: .noFileProtection)
            } catch {
                print(error)
            }
        })
    }
//
//    public func getAssetsFromSplatNet3() async throws -> Void {
//        do {
//            /// 一般的なアセットの取得
//            try await getCoopAssetsFromSplatNet3()
//            /// 通常ブキ画像
//            let weaponURLs: [SPAssetType<WeaponInfoMainId>] = try await request(WeaponRecordQuery()).assets.weapons
//            try await getAssetsFromSplatNet3(assetURLs: weaponURLs)
//            /// スペシャル画像
//            let specialURLs: [SPAssetType<WeaponInfoSpecialId>] = try await request(WeaponRecordQuery()).assets.specials
//            try await getAssetsFromSplatNet3(assetURLs: specialURLs)
//            /// ステージ画像
//            let stageURLs: [SPAssetType<CoopStageId>] = (try await request(StageScheduleQuery()).assets) + (try await request(CoopRecordQuery()).assets)
//            try await getAssetsFromSplatNet3(assetURLs: stageURLs)
//            /// バッジ画像
//            let badgeURLs: [SPAssetType<BadgeInfoId>] = try await request(HistoryRecordQuery()).assets
//            try await getAssetsFromSplatNet3(assetURLs: badgeURLs)
//        } catch (let error) {
//            print(error)
//        }
//    }
}

extension SP3Session: Authenticator {
    public func dumpURLs() async throws {
        let weaponURLs: [URL] = try await request(WeaponRecordQuery()).assets.weapons.map({ $0.url })
        let specialURLs: [URL] = try await request(WeaponRecordQuery()).assets.specials.map({ $0.url })
        let stageURLs: [URL] = (try await request(StageScheduleQuery()).assets).map({ $0.url }) + (try await request(CoopRecordQuery()).assets).map({ $0.url })
        let badgeURLs: [URL] = try await request(HistoryRecordQuery()).assets.map({ $0.url })

        let assetURLs: [URL] = weaponURLs + specialURLs + stageURLs + badgeURLs

        do {
            guard let documentPath: URL = FileManager.default.document?.appendingPathComponent("resource.txt")
            else {
                return
            }

            let text: String = assetURLs.map({ $0.absoluteString }).joined(separator: "\n")
//            try FileManager.default.createDirectory(atPath: documentPath.path, withIntermediateDirectories: true, attributes: nil)
            try text.write(toFile: documentPath.path, atomically: true, encoding: .utf8)
        } catch {
            print(error)
        }
    }

    public func refresh(_ credential: UserInfo, for session: Alamofire.Session, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        Task {
            let session = SP3Session()
            do {
                let account: UserInfo = try await session.refreshIfNeeded(contentId: .SP3)
                completion(.success(account))
            } catch {
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
        response.statusCode == 401
    }

    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: UserInfo) -> Bool {
        false
    }

    /// GraphQLを利用したリクエスト
    private func request<T>(_ request: T) async throws -> T.ResponseType where T: GraphQL {
        let interceptor: AuthenticationInterceptor<SP3Session>? = {
            guard let account else {
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
        } catch {
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
    private func getAssetsFromSplatNet3<T>(assetURLs: [SPAssetType<T>]) async throws where T.RawValue == Int {
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
        if urls.count == 0 {
            return
        }
        let assets: [SPAssetData<T>] = try await withThrowingTaskGroup(of: SPAssetData<T>.self, body: { task in
            urls.forEach({ asset in
                task.addTask(operation: { [self] in
                    SPAssetData(key: asset.key, data: try await download(asset.url))
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
            } catch {
                print(error)
            }
        })
    }

    private func getAssetURLs() async throws -> [URL] {
        return (try await request(WeaponRecordQuery()).data.weaponRecords.nodes.map({ $0.specialWeapon.image.url }))
        + (try await request(CoopRecordQuery()).data.coopRecord.bigRunRecord.records.edges.map({ $0.node.coopStage.image.url }))
    }

    /// 利用していないQRコードをリクエストする
    @discardableResult
    public func getCheckInWithQRCode() async throws -> [CheckinWithQRCodeMutation.CreateCheckinHistory] {
        let eventIdHistories: Set<CheckinWithQRCodeMutation.CheckInEventId> = Set(try await getCheckInHistory())
        let eventIds: Set<CheckinWithQRCodeMutation.CheckInEventId> = Set(CheckinWithQRCodeMutation.CheckInEventId.allCases).subtracting(Set(eventIdHistories))
        /// 並列ダウンロード
        return try await withThrowingTaskGroup(of: CheckinWithQRCodeMutation.CreateCheckinHistory.self, body: { task in
            eventIds.forEach({ eventId in
                task.addTask(operation: { [self] in
                    try await getCheckInWithQRCodeMutation(eventId: eventId)
                })
            })
            return try await task.reduce(into: [CheckinWithQRCodeMutation.CreateCheckinHistory]()) { results, result in
                results.append(result)
            }
        }) as [CheckinWithQRCodeMutation.CreateCheckinHistory]
    }

    func getCheckInWithQRCodeMutation(eventId: String) async throws -> CheckinWithQRCodeMutation.CreateCheckinHistory {
        try await request(CheckinWithQRCodeMutation(eventId: eventId)).data.createCheckinHistory
    }

    private func getCheckInWithQRCodeMutation(eventId: CheckinWithQRCodeMutation.CheckInEventId) async throws -> CheckinWithQRCodeMutation.CreateCheckinHistory {
        try await request(CheckinWithQRCodeMutation(eventId: eventId)).data.createCheckinHistory
    }

    private func getCoopHistoryDetailQuery(resultId: Common.ResultId) async throws -> CoopHistoryDetailQuery.CoopHistoryDetail {
        try await request(CoopHistoryDetailQuery(resultId: resultId)).data.coopHistoryDetail
    }

    @discardableResult
    private func uploadAllCoopHistoryDetailQuery(_ results: [CoopResult]) async throws -> [CoopStatsResultsQuery.Response] {
        try await request(CoopStatsResultsQuery(results: results))
    }

    @discardableResult
    private func uploadResult(_ result: CoopResult) async throws -> [CoopStatsResultsQuery.Response] {
        try await request(CoopStatsResultsQuery(result: result))
    }

    /// ハッシュなしで取得できる
    private func getCoopAssetsFromSplatNet3() async throws {
        guard let document: URL = FileManager.default.document
        else {
            return
        }

        // ドキュメントパス
        let documentPath: URL = document.appendingPathComponent("Assets")
        #if DEBUG
        let url = URL(unsafeString: "http://localhost:3000/v3/authorize/assets")
        #else
        let url = URL(unsafeString: "https://api.splatnet3.com/v3/authorize/assets")
        #endif
        try FileManager.default.createDirectory(atPath: documentPath.path, withIntermediateDirectories: true, attributes: nil)

        if let assetURLs: [URL] = await session.download(url)
            .serializingDecodable([URL].self)
            .response
            .value {
            let assetURLs: [URL] = (assetURLs) + (try await getAssetURLs())
            let assets: [AssetData?] = try await withThrowingTaskGroup(of: AssetData?.self, body: { task in
                assetURLs.forEach({ assetURL in
                    task.addTask(operation: { [self] in
                        AssetData(url: assetURL, data: try await download(assetURL))
                    })
                })
                return try await task.reduce(into: [AssetData?]()) { results, result in
                    results.append(result)
                }
            })
            try assets.compactMap({ $0 }).forEach({ asset in
                let destination: URL = documentPath
                    .appendingPathComponent(asset.key)
                try asset.data.write(to: destination, options: .noFileProtection)
            })
        }
    }

    private func getCoopHistoryDetailQuery(
        schedule: CoopHistoryQuery.CoopSchedule,
        result: CoopHistoryQuery.HistoryDetail
    ) async throws -> CoopResult {
        CoopResult(
            history: schedule,
            content: try await request(CoopHistoryDetailQuery(resultId: result.id)).data.coopHistoryDetail
        )
    }
}
