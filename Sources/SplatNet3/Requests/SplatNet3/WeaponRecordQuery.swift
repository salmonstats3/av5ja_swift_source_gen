//
//  WeaponRecordQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class WeaponRecordQuery: GraphQL {
    typealias ResponseType = WeaponRecordQuery.Response

    var hash: SHA256Hash = .WeaponRecordQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?

    init() {}

     struct Response: Codable {
         let data: DataClass
    }

     struct DataClass: Codable {
         let weaponRecords: Common.Node<WeaponStats>
    }

     struct URLComponent: Codable {
         let url: URL
    }

     struct WeaponStats: Codable {
         let id: String
         let image2d: URLComponent
         let image2dThumbnail: URLComponent
         let image3d: URLComponent
         let image3dThumbnail: URLComponent
         let name: String
         let weaponId: Int
         let specialWeapon: SpecialWeapon
    }

     struct SpecialWeapon: Codable {
         let specialWeaponId: Int
         let image: URLComponent
    }
}

extension WeaponRecordQuery.Response {
    /// 1. WeaponInfoMainId
    /// 2. WeaponInfoSpecialId
    var assetURLs: Set<URL> {
        Set(data.weaponRecords.nodes.flatMap { node -> [URL] in
            [
                node.image2d.url,
                node.specialWeapon.image.url
            ]
        })
    }
}
