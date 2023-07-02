//
//  RequestHeader.swift
//
//
//  Created by tkgstrator on 2023/04/04.
//
//

import Alamofire
import Foundation

internal enum RequestHeader: CustomStringConvertible {
    case AUTHORIZATION(String)
    case X_GAME_WEB_TOKEN(String)
    case DEFAULT(String, String)

    var description: String {
        switch self {
        case let .AUTHORIZATION(secret):
            return "\(RequestHeaderKey.AUTHORIZATION.rawValue): Bearer \(secret)"
        case let .X_GAME_WEB_TOKEN(secret):
            return "\(RequestHeaderKey.X_GAME_WEB_TOKEN.rawValue): \(secret)"
        case let .DEFAULT(name, value):
            return "\(name): \(value)"
        }
    }

    init(header: HTTPHeader) {
        let headerKey: RequestHeaderKey? = RequestHeaderKey(rawValue: header.name)

        switch headerKey {
        case let .some(key):
            switch key {
            case .AUTHORIZATION:
                let secret: String = Array(repeating: "*", count: header.value.count - 7).joined()
                self = .AUTHORIZATION(secret)
            case .X_GAME_WEB_TOKEN:
                let secret: String = Array(repeating: "*", count: header.value.count).joined()
                self = .X_GAME_WEB_TOKEN(secret)
            }
        case .none:
            self = .DEFAULT(header.name, header.value)
        }
    }
}

internal enum RequestHeaderKey: String, CaseIterable {
    case AUTHORIZATION = "Authorization"
    case X_GAME_WEB_TOKEN = "X-GameWebToken"
}
