//
//  NXErrorDescription.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//


import Foundation

internal enum NXErrorDescription: String, CaseIterable, Codable {
    /// リクエストの内容が誤っている
    case BAD_REQUEST = "The request does not satisfy the schema"
    /// トークンコードが有効期限切れ
    case TOKEN_EXPIRED = "The provided session_token_code is expired"
    /// トークンコードが誤っている
    case TOKEN_INVALID = "The provided session_token_code is invalid"
    /// 正しい権限が与えられていない
    case INVALID_GRANT = "The provided grant is invalid"
    /// クライアントIDが誤っている
    case OAUTH_FAILED = "Client authentication failed"
}
