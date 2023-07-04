//
//  BulletToken.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// BulletToken
internal class BulletToken: RequestType {
    typealias ResponseType = BulletToken.Response

    var method: HTTPMethod = .post
    var baseURL = URL(unsafeString: "https://api.lp1.av5ja.srv.nintendo.net/")
    var path: String = "api/bullet_tokens"
    var parameters: Parameters?
    var headers: HTTPHeaders?

    init(accessToken: String, version: String) {
        headers = [
            "X-Web-View-Ver": version,
            "X-NaCountry": "US",
            "X-GameWebToken": accessToken,
        ]
    }

    convenience init(accessToken: String, version: WebRevision.Response) {
        self.init(accessToken: accessToken, version: version.description)
    }

    internal struct Response: Codable {
        let bulletToken: String
        let lang: String
        let isNoeCountry: Bool

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            bulletToken = try container.decode(String.self, forKey: BulletToken.Response.CodingKeys.bulletToken)
            lang = try container.decode(String.self, forKey: BulletToken.Response.CodingKeys.lang)
            isNoeCountry = try Bool(container.decode(String.self, forKey: BulletToken.Response.CodingKeys.isNoeCountry)) ?? false
        }
    }
}
