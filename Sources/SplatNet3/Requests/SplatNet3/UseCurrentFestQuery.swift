//
//  UseCurrentFestQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class UseCurrentFestQuery: GraphQL {
	typealias ResponseType = UseCurrentFestQuery.Response
	var hash: SHA256Hash = .UseCurrentFestQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
	}
}
