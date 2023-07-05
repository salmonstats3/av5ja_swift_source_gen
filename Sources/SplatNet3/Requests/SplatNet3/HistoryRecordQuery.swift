//
//  HistoryRecordQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class HistoryRecordQuery: GraphQL {
    typealias ResponseType = HistoryRecordQuery.Response

    var hash: SHA256Hash = .HistoryRecordQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?

    init() {}

     struct Response: Codable {
         let data: ResponseData

         var assets: [SPAssetType<BadgeInfoId>] {
            data.playHistory.allBadges.map { SPAssetType(key: $0.id, url: $0.image.url) }
        }
    }

     struct ResponseData: Codable {
         let playHistory: PlayerHistory
    }

     struct PlayerHistory: Codable {
        let allBadges: [Badge]
    }

     struct Badge: Codable {
        @UnsafeRawValue  var id: BadgeInfoId
         let image: URLComponent
    }

     struct URLComponent: Codable {
         let url: URL
    }
}
