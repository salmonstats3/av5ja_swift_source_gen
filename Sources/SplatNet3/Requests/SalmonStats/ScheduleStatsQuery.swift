//
//  ScheduleStatsQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public protocol SalmonStats: RequestType {}

public extension SalmonStats {
    #if DEBUG
        var baseURL: URL {
            #if targetEnvironment(simulator)
                URL(unsafeString: "https://api.splatnet3.com")
            #else
                URL(unsafeString: "https://api.splatnet3.com")
            #endif
        }
    #else
        var baseURL: URL {
            URL(unsafeString: "https://api.splatnet3.com")
        }
    #endif
}

public final class ScheduleStatsQuery: SalmonStats {
    public var method: Alamofire.HTTPMethod = .get
    public var parameters: Alamofire.Parameters?
    public var path: String
    public var headers: HTTPHeaders?

    public typealias ResponseType = ScheduleStatsQuery.Response

    init(startTime: Date) {
        path = "v1/schedules/\(Int(startTime.timeIntervalSince1970))"
    }

    public struct Response: Codable {
        public let jobResults: JobResult
        public let enemyResults: [EnemyResult]
        public let waveResults: [WaveResult]
        public let failureResults: [FailureResult]
    }

    public struct JobResult: Codable {
        public let shiftsWorked: Int
        public let isClear: Int
        public let isFailure: Int
        public let ikuraNum: Int
        public let goldenIkuraNum: Int
        public let goldenIkuraAssistNum: Int
        public let bossKillCount: Int
        public let bossCount: Int
    }

    public struct FailureResult: Codable, Identifiable {
        public var id: Int { waveId }
        public let count: Int
        public let isClear: Int
        public let isFailure: Int
        public let waveId: Int
    }

    public struct EnemyResult: Codable, Identifiable {
        public var id: CoopEnemyInfoId { enemyId }
        public let count: Int
        public let killCount: Int
        public let enemyId: CoopEnemyInfoId
    }

    public struct WaveResult: Codable, Identifiable {
        public var id: Int { waterLevel.rawValue * 10 + eventType.rawValue }
        public let goldenIkuraNum: Int
        public let waterLevel: CoopWaterLevelId
        public let eventType: CoopEventId
        public let count: Int
    }
}
