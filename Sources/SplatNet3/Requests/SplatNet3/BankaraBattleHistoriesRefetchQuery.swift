//
//  BankaraBattleHistoriesRefetchQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class BankaraBattleHistoriesRefetchQuery: GraphQL {
    typealias ResponseType = BankaraBattleHistoriesRefetchQuery.Response

    var hash: SHA256Hash = .BankaraBattleHistoriesRefetchQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?
    var headers: HTTPHeaders?

    init() {}

    internal struct Response: Codable {}
}
