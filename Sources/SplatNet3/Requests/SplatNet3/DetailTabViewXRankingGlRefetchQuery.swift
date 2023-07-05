//
//  DetailTabViewXRankingGlRefetchQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class DetailTabViewXRankingGlRefetchQuery: GraphQL {
    typealias ResponseType = DetailTabViewXRankingGlRefetchQuery.Response

    var hash: SHA256Hash = .DetailTabViewXRankingGlRefetchQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?

    init() {}

    internal struct Response: Codable {}
}
