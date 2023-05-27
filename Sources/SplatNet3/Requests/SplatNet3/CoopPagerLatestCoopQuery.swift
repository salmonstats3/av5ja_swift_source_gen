//
//  CoopPagerLatestCoopQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire


final class CoopPagerLatestCoopQuery: GraphQL {
	public typealias ResponseType = CoopPagerLatestCoopQuery.Response
	var hash: SHA256Hash = .CoopPagerLatestCoopQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
