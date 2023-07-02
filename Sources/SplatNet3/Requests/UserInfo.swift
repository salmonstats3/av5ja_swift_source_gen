//
//  UserInfo.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public struct UserInfo: SPCredential {
    /// ニックネーム
    public let nickname: String
    /// メンバーシップ加入しているか
    let membership: Bool
    /// フレンドコード
    public let friendCode: String
    /// 画像URL
    public let thumbnailURL: URL
    /// ID
    var nsaid: String
    /// イカスミセッション
    public internal(set) var iksmSession: String?
    /// イカリング3トークン
    public internal(set) var bulletToken: String?
    /// セッショントークン
    var sessionToken: String
    /// GameServiceToken
    var gameServiceToken: String
    /// GameWebToken
    var gameWebToken: String
    /// 有効期限
    var expiration: Date
    /// リフレッシュが必要かどうか
    public var requiresRefresh: Bool {
        expiration <= Date(timeIntervalSinceNow: 0)
    }

    var requiresGameWebTokenRefresh: Bool {
        guard let token: JSONWebToken = try? JSONWebToken(gameWebToken: gameWebToken) else {
            return true
        }
        return Date(timeIntervalSince1970: TimeInterval(token.payload.exp)) <= Date()
    }

    init(sessionToken: String, gameServiceToken: GameServiceToken.Response, gameWebToken: String) {
        nickname = gameServiceToken.result.user.name
        membership = gameServiceToken.result.user.links.nintendoAccount.membership.active
        friendCode = gameServiceToken.result.user.links.friendCode.id
        thumbnailURL = URL(unsafeString: gameServiceToken.result.user.imageUri)
        nsaid = gameServiceToken.result.user.nsaId
        self.sessionToken = sessionToken
        self.gameServiceToken = gameServiceToken.result.webApiServerCredential.accessToken
        self.gameWebToken = gameWebToken
        expiration = Date(timeIntervalSinceNow: 60 * 60 * 2)
    }

    init(sessionToken: String, gameServiceToken: GameServiceToken.Response, gameWebToken: GameWebToken.Response, iksmSession: IksmSession.Response) {
        self.init(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken.result.accessToken)
        self.iksmSession = iksmSession.iksmSession
        expiration = Date(timeIntervalSinceNow: 60 * 60 * 2)
    }

    init(sessionToken: String, gameServiceToken: GameServiceToken.Response, gameWebToken: String, bulletToken: BulletToken.Response) {
        self.init(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken)
        self.bulletToken = bulletToken.bulletToken
        expiration = Date(timeIntervalSinceNow: 60 * 60 * 2)
    }
}

extension UserInfo: Identifiable, Hashable, Equatable {
    public static func == (lhs: UserInfo, rhs: UserInfo) -> Bool {
        lhs.id == rhs.id
    }

    public static func != (lhs: UserInfo, rhs: UserInfo) -> Bool {
        lhs.id != rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public var id: String { nsaid }
}
