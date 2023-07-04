//
//  SP3Session+SalmonStats.swift
//  SplatNet3
//
//  Created by devonly on 2023/04/02.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public extension SP3Session {
    /// 指定されたスケジュールの統計情報を返す
    func getScheduleStatsQuery(startTime: Date) async throws -> ScheduleStatsQuery.Response {
        try await request(ScheduleStatsQuery(startTime: startTime))
    }
}
