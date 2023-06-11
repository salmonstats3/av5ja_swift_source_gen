//
//  WeaponRecordQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

final class WeaponRecordQuery: GraphQL {
	typealias ResponseType = WeaponRecordQuery.Response
	var hash: SHA256Hash = .WeaponRecordQuery
	var variables: [String: String] = [:]
	var parameters: Parameters?

	init() {}

    public struct Response: Codable {
        public let data: DataClass
    }

    public struct Asset: Codable {
        var weapons: [SPAssetType<WeaponInfoMainId>]

        var specials: [SPAssetType<WeaponInfoSpecialId>]
    }

    public struct DataClass: Codable {
        public let weaponRecords: Common.Node<WeaponStats>
    }

    public struct URLComponent: Codable {
        public let url: URL
    }

    public struct WeaponStats: Codable {
        public let id: String
        public let image2d: URLComponent
        public let image2dThumbnail: URLComponent
        public let image3d: URLComponent
        public let image3dThumbnail: URLComponent
        public let name: String
        public let weaponId: Int
        public let specialWeapon: SpecialWeapon
    }

    public struct SpecialWeapon: Codable {
        public let specialWeaponId: Int
        public let image: URLComponent
    }
}

extension WeaponRecordQuery.Response {
    /// 1. WeaponInfoMainId
    /// 2. WeaponInfoSpecialId
    var assetURLs: Set<URL> {
        Set(data.weaponRecords.nodes.flatMap({ node -> [URL] in
            [
                node.image2d.url,
                node.specialWeapon.image.url
            ]
        }))
    }
}
