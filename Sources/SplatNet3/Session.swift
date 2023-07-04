//
//  Session.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation
import KeychainAccess
import SwiftUI

/// 基本となるリクエストなどが定義されたクラス
open class Session: ObservableObject {
    /// 通信用のセッション
    public let session: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.httpCookieAcceptPolicy = .never
        configuration.allowsCellularAccess = true
        return Alamofire.Session(configuration: configuration)
    }()

    /// キーチェイン
    private let keychain = Keychain(service: Bundle.module.bundleIdentifier ?? "work.tkgstrator.salmonia3plus")

    /// X-Web-View-Ver
    public var version: String {
        keychain.version
    }

    /// X-ProductVersion
    public var xVersion: String {
        keychain.xVersion
    }

    /// デコーダー
    public let decoder = SPDecoder()

    /// Salmon Stats
    public var useSalmonStats: Bool {
        get {
            keychain.useSalmonStats
        }
        set {
            keychain.useSalmonStats = newValue
        }
    }

    /// Safari Session
    public var useEphmeralSession: Bool {
        get {
            keychain.useEphemeralSession
        }
        set {
            keychain.useEphemeralSession = newValue
        }
    }

    /// アカウント情報
    @Published public var account: UserInfo?

    @AppStorage("APP_PRIMARY_F_SERVER") public var primaryServer: ServerType = .Imink

    init() {
        // インスタンス生成時にアカウントを読み込み
        account = keychain.get()
    }

    /// 一般的に使うリクエスト
    open func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> T.ResponseType {
        try await withSwiftyLogger(execute: {
            try await session.request(request, interceptor: interceptor)
                .validationWithNXError()
                .serializingDecodable(T.ResponseType.self, decoder: decoder)
                .value
        })
    }

    /// 文字列を取得するためのリクエスト
    open func request(_ request: some RequestType, interceptor: RequestInterceptor? = nil) async throws -> String {
        try await withSwiftyLogger(execute: {
            try await session.request(request, interceptor: interceptor)
                .validationWithNXError()
                .serializingString(encoding: .utf8)
                .value
        })
    }

    public func download(_ url: URL) async throws -> Data {
        try await session.download(url)
            .validate()
            .serializingData()
            .value
    }

    /// イカスミセッション専用のリクエスト
    func request(_ request: IksmSession) async -> HTTPHeaders? {
        try? await withSwiftyLogger(execute: {
            await session.request(request)
                .validationWithNXError()
                .serializingString()
                .response
                .response?.allHeaderFields as? HTTPHeaders
        })
    }

    /// SP2/3: URLSchemeを使って認証情報を取得
    @discardableResult
    public func getCookie(code: String, verifier: String, contentId: ContentId) async throws -> UserInfo {
        let sessionToken: SessionToken.Response = try await getSessionToken(code: code, verifier: verifier)
        return try await refresh(sessionToken: sessionToken.sessionToken, contentId: contentId)
    }

    /// SP3: GameWebTokenを使って認証情報を取得
    public func refresh(gameWebToken: String) async throws -> UserInfo {
        let bulletToken: BulletToken.Response = try await getBulletToken(gameWebToken: gameWebToken)
        let account: UserInfo = try keychain.update(bulletToken)
        /// アップデートしたアカウントで上書き
        self.account = account
        return account
    }

    /// SP2/3: トークンが切れたときにリフレッシュする
    @discardableResult
    public func refreshIfNeeded(contentId: ContentId) async throws -> UserInfo {
        guard let account = keychain.get() else {
            throw DecodingError.valueNotFound(UserInfo.self, .init(codingPath: [], debugDescription: "Account Not Found"))
        }
        if account.requiresGameWebTokenRefresh {
            return try await refresh(sessionToken: account.sessionToken, contentId: contentId)
        }
        if account.requiresRefresh {
            return try await refresh(gameWebToken: account.gameWebToken)
        }
        return account
    }

    /// SP2/3: SessionTokenを使って認証情報を取得
    @discardableResult
    public func refresh(sessionToken: String, contentId: ContentId) async throws -> UserInfo {
        let accessToken: AccessToken.Response = try await getAccessToken(sessionToken: sessionToken)
        let version: AppVersion.Response = try await getAppVersion()
        let gameServiceToken: GameServiceToken.Response = try await getGameServiceToken(accessToken: accessToken, version: version)
        let gameWebToken: GameWebToken.Response = try await getGameWebToken(accessToken: gameServiceToken, version: version, contentId: contentId)
        switch contentId {
        case .SP2:
            let iksmSession: IksmSession.Response = try await getIksmSession(gameWebToken: gameWebToken)
            let account = UserInfo(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken, iksmSession: iksmSession)
            /// ログイン時はアカウントを上書き
            self.account = keychain.set(account)
            return account
        case .SP3:
            let bulletToken: BulletToken.Response = try await getBulletToken(gameWebToken: gameWebToken)
            let account = UserInfo(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken.result.accessToken, bulletToken: bulletToken)
            /// ログイン時はアカウントを上書き
            self.account = keychain.set(account)
            return account
        }
    }

    /// 保存されているアカウント全削除
    public func removeAll() {
        account = nil
        try? keychain.removeAll()
    }
}

/// 秘匿したい関数を定義したExtension
extension Session: RequestInterceptor {
    /// エラー発生時に自動でログを出力するリクエスト
    private func withSwiftyLogger<T>(execute: () async throws -> T) async throws -> T {
        do {
            return try await execute()
        } catch {
            SwiftyLogger.error(error)
            throw error
        }
    }

    /// 通信失敗した場合のリトライ
    public func retry(_ request: Request, for _: Session, dueTo _: Error, completion: @escaping (RetryResult) -> Void) {
        completion(request.retryCount == 0 ? .retryWithDelay(0.5) : .doNotRetry)
    }

    /// セッショントークン取得
    func getSessionToken(code: String, verifier: String) async throws -> SessionToken.Response {
        try await request(SessionToken(code: code, verifier: verifier))
    }

    /// アクセストークン取得
    func getAccessToken(sessionToken: String) async throws -> AccessToken.Response {
        try await request(AccessToken(sessionToken: sessionToken))
    }

    /// ハッシュ取得
    func getHash(accessToken: AccessToken.Response) async throws -> Imink.Response {
        let timestamp = UInt64(Date().timeIntervalSince1970 * 1_000)
        let requestId: String = UUID().uuidString

        let response: Imink.ServerResponse = try await request(Imink(
            accessToken: accessToken,
            requestId: requestId,
            timestamp: timestamp,
            server: primaryServer
        ))
        return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
    }

    /// ハッシュ取得
    func getHash(accessToken: GameServiceToken.Response) async throws -> Imink.Response {
        let timestamp = UInt64(Date().timeIntervalSince1970 * 1_000)
        let requestId: String = UUID().uuidString

        let response: Imink.ServerResponse = try await request(Imink(
            accessToken: accessToken,
            requestId: requestId,
            timestamp: timestamp,
            server: primaryServer
        ))
        return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
    }

    /// AppVersion
    func getAppVersion() async throws -> AppVersion.Response {
        let response: AppVersion.Response = try await request(AppVersion())
        keychain.xVersion = response.version
        keychain.version = response.webVersion
        return response
    }

    /// X-ProductVersion取得
    func getXVersion() async throws -> XVersion.Response {
        let response: XVersion.Response = try await XVersion.Response(context: request(XVersion()))
        keychain.xVersion = response.version
        return response
    }

    /// WebVersion取得
    func getWebVersion() async throws -> WebVersion.Response {
        let response: String = try await request(WebVersion())
        return WebVersion.Response(context: response)
    }

    func getWebRevision(hash: String) async throws -> WebRevision.Response {
        let response: WebRevision.Response = try await WebRevision.Response(context: request(WebRevision(hash: hash)))
        keychain.version = response.description
        return response
    }

    /// GameServiceToken取得
    func getGameServiceToken(accessToken: AccessToken.Response, version: AppVersion.Response) async throws -> GameServiceToken.Response {
        let response: Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameServiceToken(imink: response, accessToken: accessToken, version: version))
    }

    /// GameWebToken取得
    func getGameWebToken(accessToken: GameServiceToken.Response, version: AppVersion.Response, contentId: ContentId) async throws -> GameWebToken.Response {
        let response: Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameWebToken(imink: response, accessToken: accessToken, contentId: contentId, version: version))
    }

    /// BulletToken取得
    func getBulletToken(gameWebToken: GameWebToken.Response) async throws -> BulletToken.Response {
        let revision: String = keychain.version
        return try await request(BulletToken(accessToken: gameWebToken.result.accessToken, version: revision))
    }

    /// BulletToken取得
    func getBulletToken(gameWebToken: String) async throws -> BulletToken.Response {
        let revision: String = keychain.version
        return try await request(BulletToken(accessToken: gameWebToken, version: revision))
    }

    /// IksmSession取得
    func getIksmSession(gameWebToken: GameWebToken.Response) async throws -> IksmSession.Response {
        let headers: HTTPHeaders? = await request(IksmSession(accessToken: gameWebToken.result.accessToken))
        return try IksmSession.Response(headers: headers)
    }
}
