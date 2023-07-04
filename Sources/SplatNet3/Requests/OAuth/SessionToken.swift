//
//  SessionToken.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// SessionToken
internal class SessionToken: RequestType {
    typealias ResponseType = SessionToken.Response

    var method: HTTPMethod = .post
    var baseURL = URL(unsafeString: "https://accounts.nintendo.com/")
    var path: String = "connect/1.0.0/api/session_token"
    var parameters: Parameters?

    /// トークンコードとベリファイアから初期化
    init(code: String, verifier: String) {
        parameters = [
            "client_id": "71b963c1b7b6d119",
            "session_token_code": code,
            "session_token_code_verifier": verifier
        ]
    }

    struct Response: Codable {
        let code: String
        let sessionToken: String
    }
}
