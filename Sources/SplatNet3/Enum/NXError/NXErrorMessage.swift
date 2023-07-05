//
//  NXErrorMessage.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

internal enum NXErrorMessage: String, CaseIterable, Codable {
    /// リクエストが誤っている
    case BAD_REQUEST = "Bad request."
    /// 要求されているバージョンよりも低い
    case UPGRADE_REQUIRED = "Upgrade required."
    /// 有効でないトークンが使われている
    case INVALID_TOKEN = "Invalid token."
    /// トークンの有効期限が切れている
    case TOKEN_EXPIRED = "Token expired."
    /// 認証されていないトークンが使われている
    case UNAUTHORIZED = "Unauthorized."
    /// パラメータfのタイムスタンプがズレている
    case UNEXPECTED = "Unexpected Error."
    /// ニンテンドースイッチオンラインに加入していない
    case MEMBERSHIP = "Membership required error."
}
