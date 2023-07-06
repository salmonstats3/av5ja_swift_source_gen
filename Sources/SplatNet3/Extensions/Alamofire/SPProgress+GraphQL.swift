//
//  SPProgress+GraphQL.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/26.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

extension SPProgress {
    init(_ request: some GraphQL) {
        let path: SPEndpoint = {
            switch request.hash {
            case .StageScheduleQuery:
                return .COOP_SCHEDULE
            case .CoopHistoryQuery:
                return .COOP_SUMMARY
            case .CoopHistoryDetailQuery:
                return .COOP_RESULT
            default:
                return .UNKNOWN
            }
        }()
        self.init(path)
    }
}
