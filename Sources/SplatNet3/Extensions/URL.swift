//
//  URL.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

extension URL {
    /// 文字列からUnsafeにURLを作成するイニシャライザ
    public init(unsafeString: String) {
        // swiftlint:disable:next force_unwrapping
        self.init(string: unsafeString)!
    }

    init(state: String, verifier: String) {
        let parameters: [String: String] = [
            "state": state,
            "redirect_uri": "npf71b963c1b7b6d119://auth",
            "client_id": "71b963c1b7b6d119",
            "scope": "openid+user+user.birthday+user.mii+user.screenName",
            "response_type": "session_token_code",
            "session_token_code_challenge": verifier.codeChallenge,
            "session_token_code_challenge_method": "S256",
            "theme": "login_form",
        ]
        let queryItems: [URLQueryItem] = parameters.map({ URLQueryItem(name: $0.key, value: $0.value) })
        let baseURL: URL = URL(unsafeString: "https://accounts.nintendo.com/connect/1.0.0/authorize")
        // swiftlint:disable:next force_unwrapping
        var components: URLComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = queryItems
        // swiftlint:disable:next force_unwrapping
        self = components.url!
    }

    mutating func queryItems(_ items: [URLQueryItem])  {
        guard var request: URLComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return
        }
        request.queryItems = items
        guard let url: URL = request.url else {
            return
        }
        self = url
    }
}

