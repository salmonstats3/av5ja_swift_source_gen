//
//  RankingHoldersFestTeamRankingHoldersPaginationQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

// swiftlint:disable:next type_name
internal final class RankingHoldersFestTeamRankingHoldersPaginationQuery: GraphQL {
    typealias ResponseType = RankingHoldersFestTeamRankingHoldersPaginationQuery.Response

    var hash: SHA256Hash = .RankingHoldersFestTeamRankingHoldersPaginationQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?

    init() {}

    internal struct Response: Codable {}
}
