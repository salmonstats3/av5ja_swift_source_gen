//
//  SP3Session+Method.swift
//
//
//  Created by devonly on 2023/06/11.
//

import Alamofire
import Foundation

extension SP3Session {
    /// GraphQLを利用したリクエスト
    internal func request<T>(_ request: T) async throws -> T.ResponseType where T: GraphQL {
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
    internal func getCheckInHistory() async throws -> [CheckinWithQRCodeMutation.CheckInEventId] {
        try await request(CheckinQuery()).data.checkinHistories.map({ $0.id })
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

    internal func getCheckInWithQRCodeMutation(eventId: String) async throws -> CheckinWithQRCodeMutation.CreateCheckinHistory {
        try await request(CheckinWithQRCodeMutation(eventId: eventId)).data.createCheckinHistory
    }

    internal func getCheckInWithQRCodeMutation(eventId: CheckinWithQRCodeMutation.CheckInEventId) async throws -> CheckinWithQRCodeMutation.CreateCheckinHistory {
        try await request(CheckinWithQRCodeMutation(eventId: eventId)).data.createCheckinHistory
    }

    internal func getCoopHistoryDetailQuery(resultId: Common.ResultId) async throws -> CoopHistoryDetailQuery.CoopHistoryDetail {
        try await request(CoopHistoryDetailQuery(resultId: resultId)).data.coopHistoryDetail
    }

    @discardableResult
    internal func uploadAllCoopHistoryDetailQuery(_ results: [CoopResult]) async throws -> [CoopStatsResultsQuery.Response] {
        try await request(CoopStatsResultsQuery(results: results))
    }

    @discardableResult
    internal func uploadResult(_ result: CoopResult) async throws -> [CoopStatsResultsQuery.Response] {
        try await request(CoopStatsResultsQuery(result: result))
    }

    internal func getCoopHistoryDetailQuery(
        schedule: CoopHistoryQuery.CoopSchedule,
        result: CoopHistoryQuery.HistoryDetail
    ) async throws -> CoopResult {
        CoopResult(
            history: schedule,
            content: try await request(CoopHistoryDetailQuery(resultId: result.id)).data.coopHistoryDetail
        )
    }
}
