//
//  DetailVotingStatusQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation
import Alamofire


final class DetailVotingStatusQuery: GraphQL {
	public typealias ResponseType = DetailVotingStatusQuery.Response
	var hash: SHA256Hash = .DetailVotingStatusQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
