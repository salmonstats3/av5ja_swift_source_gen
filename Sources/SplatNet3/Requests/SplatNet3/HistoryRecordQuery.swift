//
//  HistoryRecordQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

final class HistoryRecordQuery: GraphQL {
	typealias ResponseType = HistoryRecordQuery.Response
	var hash: SHA256Hash = .HistoryRecordQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

	public struct Response: Codable {
        public let data: ResponseData

        public var assets: [SPAssetType<BadgeInfoId>] {
            data.playHistory.allBadges.map({ SPAssetType(key: $0.id, url: $0.image.url) })
        }
    }

    public struct ResponseData: Codable {
        public let playHistory: PlayerHistory
    }

    public struct PlayerHistory: Codable {
        let allBadges: [Badge]
    }

    public struct Badge: Codable {
        @UnsafeRawValue public var id: BadgeInfoId
        public let image: URLComponent
    }

    public struct URLComponent: Codable {
        public let url: URL
    }
}
