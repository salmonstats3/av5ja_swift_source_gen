//
//  BattleHistoryCurrentPlayerQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class BattleHistoryCurrentPlayerQuery: GraphQL {
    typealias ResponseType = BattleHistoryCurrentPlayerQuery.Response

    var hash: SHA256Hash = .BattleHistoryCurrentPlayerQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?
    var headers: HTTPHeaders?

    init() {}

    public struct Response: Codable {}
}
