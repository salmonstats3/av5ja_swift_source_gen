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

        public var assets: Asset {
            Asset(
                weapons: data.weaponRecords.nodes.compactMap({ node in
                    guard let weaponId = WeaponInfoMainId(rawValue: node.weaponId)
                    else {
                        return nil
                    }
                    return SPAssetType(key: weaponId, url: node.image2d.url)
                }),
                specials: Array(Set(data.weaponRecords.nodes.compactMap({ node in
                    guard let specialId = WeaponInfoSpecialId(rawValue: node.specialWeapon.specialWeaponInfoMainId + 20_000)
                    else {
                        return nil
                    }
                    return SPAssetType(key: specialId, url: node.specialWeapon.image.url)
                })))
            )
        }
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
        public let specialWeaponInfoMainId: Int
        public let image: URLComponent
    }
}
