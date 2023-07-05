//
//  CatalogRefetchQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class CatalogRefetchQuery: GraphQL {
    typealias ResponseType = CatalogRefetchQuery.Response

    var hash: SHA256Hash = .CatalogRefetchQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?

    init() {}

    internal struct Response: Codable {}
}
