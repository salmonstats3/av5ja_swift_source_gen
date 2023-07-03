//
//  BankaraBattleHistoriesQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class BankaraBattleHistoriesQuery: GraphQL {
    typealias ResponseType = BankaraBattleHistoriesQuery.Response

    var hash: SHA256Hash = .BankaraBattleHistoriesQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?
    var headers: HTTPHeaders?

    init() {}

    public struct Response: Codable {}
}
