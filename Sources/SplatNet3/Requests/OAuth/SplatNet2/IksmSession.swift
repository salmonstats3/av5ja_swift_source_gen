//
//  IksmSession.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// IksmSession
internal class IksmSession: RequestType {
    typealias ResponseType = IksmSession.Response

    var method: HTTPMethod = .get
    var baseURL = URL(unsafeString: "https://app.splatoon2.nintendo.net/")
    var path: String = ""
    var parameters: Parameters?
    var headers: HTTPHeaders?

    init(accessToken: String) {
        headers = [
            "Cookie": "iksm_session=",
            "X-GameWebToken": accessToken,
        ]
    }

    internal struct Response: Codable {
        let iksmSession: String

        init(headers: HTTPHeaders?) throws {
            let url = URL(unsafeString: "https://app.splatoon2.nintendo.net/")
            guard let headers,
                  let iksmSession = HTTPCookie.cookies(withResponseHeaderFields: headers.dictionary, for: url).first?.value
            else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "No iksm session is included."))
            }
            self.iksmSession = iksmSession
        }
    }
}
