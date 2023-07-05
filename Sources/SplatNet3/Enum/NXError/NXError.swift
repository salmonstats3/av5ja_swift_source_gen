//
//  NXError.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

internal enum NXError: String, CaseIterable, Codable {
    /// リクエストの内容が誤っている
    case INVALID_REQUEST = "invalid_request"
    /// 権限が誤っている
    case INVALID_GRANT = "invalid_grant"
    /// クライアントIDが誤っている
    case INVALID_CLIENT = "invalid_client"
}

