//
//  WebRevision.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

/// Revision
public class WebRevision: RequestType {
    public typealias ResponseType = WebVersion.Response

    public var method: HTTPMethod = .get
    public var baseURL = URL(unsafeString: "https://api.lp1.av5ja.srv.nintendo.net/")
    public var path: String
    public var parameters: Parameters?
    public var headers: HTTPHeaders?

    public init(hash: String) {
        path = "static/js/main.\(hash).js"
    }

    public struct Response: Codable, CustomStringConvertible {
        /// バージョン
        private let version: String
        /// リビジョン
        private let revision: String

        public var description: String {
            "\(version)-\(revision)"
        }

        init(context: String) {
            if let version: String = context.capture(pattern: #"`(\d{1}\.\d{1}\.\d{1})-"#, group: 1),
               let revision: String = context.capture(pattern: #"REACT_APP_REVISION:"([a-f0-9]{8})"#, group: 1)
            {
                self.version = version
                self.revision = revision
            } else {
                version = "2.0.0"
                revision = "bd36a652"
            }
        }
    }
}
