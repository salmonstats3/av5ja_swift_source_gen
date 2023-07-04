//
//  DetailTabViewXRankingLfRefetchQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class DetailTabViewXRankingLfRefetchQuery: GraphQL {
    typealias ResponseType = DetailTabViewXRankingLfRefetchQuery.Response

    var hash: SHA256Hash = .DetailTabViewXRankingLfRefetchQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?

    init() {}

    public struct Response: Codable {}
}
