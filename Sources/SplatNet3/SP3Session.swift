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

    override func request(_ request: IksmSession) async -> HTTPHeaders? {
        DispatchQueue.main.async {
            self.requests.append(SPProgress(request))
        }
        let response: HTTPHeaders? = await super.request(request)
        DispatchQueue.main.async {
            self.requests.success()
        }
        return response
    }

    /// 通常のリクエスト
    override open func request<T>(_ request: T, interceptor _: RequestInterceptor? = nil) async throws -> T.ResponseType where T: RequestType {
        let endpoint = SPEndpoint(request: request)
        do {
            DispatchQueue.main.async {
                if endpoint != .UNKNOWN, endpoint != .STATS {
                    self.requests.append(SPProgress(request))
                }
            }
            let response: T.ResponseType = try await super.request(request)
            DispatchQueue.main.async {
                if endpoint != .UNKNOWN, endpoint != .STATS {
                    self.requests.success()
                }
            }
            return response
        } catch {
            DispatchQueue.main.async {
                if endpoint != .UNKNOWN {
                    self.requests.failure()
                }
            }
            throw error
        }
    }

    override open func request(_ request: some RequestType, interceptor _: RequestInterceptor? = nil) async throws -> String {
        do {
            DispatchQueue.main.async {
                self.requests.append(SPProgress(request))
            }
            let response: String = try await super.request(request)
            DispatchQueue.main.async {
                self.requests.success()
            }
            return response
        } catch {
            DispatchQueue.main.async {
                self.requests.failure()
            }
            throw error
        }
    }

    @discardableResult
    public func getAllCoopStageScheduleQuery() async throws -> [CoopSchedule] {
        try await request(CoopStageScheduleQuery())
    }

    @discardableResult
    open func getCoopStageScheduleQuery() async throws -> [CoopSchedule] {
        try await request(StageScheduleQuery()).data.coopGroupingSchedule.schedules.map { CoopSchedule(schedule: $0) }
    }

    open func getCoopHistoryQuery() async throws -> CoopHistoryQuery.CoopResult {
        try await request(CoopHistoryQuery()).data.coopResult
    }

    // swiftlint:disable function_default_parameter_at_end
    @discardableResult
    open func getAllCoopHistoryDetailQuery(
        playTime: Date? = nil,
        upload: Bool = false,
        completion: Completion
    ) async throws -> [CoopResult] {
        completion(0, 1)
        let coopResult: CoopHistoryQuery.CoopResult = try await getCoopHistoryQuery()
        /// ノード
        let nodes: [CoopHistoryQuery.HistoryGroup] = coopResult.historyGroups.nodes
        /// 取得すべきリザルトのID
        let resultIds: [Common.ResultId] = {
            if let playTime {
                return nodes.flatMap { $0.historyDetails.nodes.map(\.id) }.filter { $0.playTime > playTime }
            }
            return nodes.flatMap { $0.historyDetails.nodes.map(\.id) }
        }()
        /// 取得するIDがないなら何もせずに返す
        if resultIds.isEmpty {
            completion(1, 1)
            return []
        }
        /// 進捗を更新
        DispatchQueue.main.async {
            self.requests.append(SPProgress(.COOP_RESULT))
        }
        /// 並列ダウンロード
        let response: [CoopResult] = try await withThrowingTaskGroup(of: CoopResult.self, body: { task in
            nodes.forEach { node in
                node.historyDetails.nodes.forEach { result in
                    if resultIds.contains(result.id) {
                        task.addTask(operation: { [self] in
                            try await getCoopHistoryDetailQuery(schedule: node.asSchedule(), result: result)
                        })
                    }
                }
            }
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
        DispatchQueue.main.async {
            self.requests.success()
        }
        return response
    }

    // swiftlint:enable function_default_parameter_at_end

    // swiftlint:disable function_default_parameter_at_end
    @discardableResult
    open func uploadAllCoopResultDetailQuery(
        results: [CoopResult] = [],
        completion: Completion
    ) async throws -> [CoopStatsResultsQuery.Response] {
        var count = 0
        completion(Float(count), Float(results.count))

        DispatchQueue.main.async {
            self.requests.append(SPProgress(.STATS))
        }

        let response: [CoopStatsResultsQuery.Response] = try await results.chunked(by: 200).asyncFlatMap { result in
            count += result.count
            completion(Float(count), Float(results.count))
            return try await uploadAllCoopHistoryDetailQuery(result)
        }

        DispatchQueue.main.async {
            self.requests.success()
        }

        return response
    }
    // swiftlint:enable function_default_parameter_at_end
}
