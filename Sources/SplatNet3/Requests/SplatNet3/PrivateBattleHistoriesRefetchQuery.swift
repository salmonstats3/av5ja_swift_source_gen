//
//  PrivateBattleHistoriesRefetchQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class PrivateBattleHistoriesRefetchQuery: GraphQL {
	typealias ResponseType = PrivateBattleHistoriesRefetchQuery.Response

    var hash: SHA256Hash = .PrivateBattleHistoriesRefetchQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
