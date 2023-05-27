//
//  Session.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import KeychainAccess

/// 基本となるリクエストなどが定義されたクラス
open class Session: ObservableObject {
    /// 通信用のセッション
    public let session: Alamofire.Session = {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.httpCookieAcceptPolicy = .never
        configuration.allowsCellularAccess = true
        return Alamofire.Session(configuration: configuration)
    }()

    /// キーチェイン
    private let keychain: Keychain = Keychain(service: Bundle.module.bundleIdentifier!)

    /// X-Web-View-Ver
    public var version: String {
        keychain.version
    }

    /// X-ProductVersion
    public var xVersion: String {
        keychain.xVersion
    }

    /// デコーダー
    public let decoder: SPDecoder = SPDecoder()

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

    /// 優先サーバー
    @Published public var server: ServerType = .Imink {
        willSet {
            keychain.primaryServer = newValue
        }
    }

    init() {
        // インスタンス生成時にアカウントを読み込み
        self.account = keychain.get()
        self.server = keychain.primaryServer
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
    open func request<T: RequestType>(_ request: T, interceptor: RequestInterceptor? = nil) async throws -> String {
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
    func request(_ request: IksmSession) async -> [String: String]? {
        try? await withSwiftyLogger(execute: {
            await session.request(request)
                .validationWithNXError()
                .serializingString()
                .response
                .response?.allHeaderFields as? [String: String]
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
            SwiftyLogger.info("GameWebToken is expired.")
            return try await refresh(sessionToken: account.sessionToken, contentId: contentId)
        }
        if account.requiresRefresh {
            SwiftyLogger.info("Bullet token is expired.")
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
            let account: UserInfo = UserInfo(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken, iksmSession: iksmSession)
            /// ログイン時はアカウントを上書き
            self.account = keychain.set(account)
            return account
        case .SP3:
            let bulletToken: BulletToken.Response = try await getBulletToken(gameWebToken: gameWebToken)
            let account: UserInfo = UserInfo(sessionToken: sessionToken, gameServiceToken: gameServiceToken, gameWebToken: gameWebToken.result.accessToken, bulletToken: bulletToken)
            /// ログイン時はアカウントを上書き
            self.account = keychain.set(account)
            return account
        }
    }

    /// 保存されているアカウント全削除
    public func removeAll() {
        self.account = nil
        try? self.keychain.removeAll()
    }
}

/// 秘匿したい関数を定義したExtension
extension Session: RequestInterceptor {
    /// エラー発生時に自動でログを出力するリクエスト
    private func withSwiftyLogger<T>(execute: () async throws -> T) async throws -> T {
        do {
            return try await execute()
        } catch(let error) {
            SwiftyLogger.error(error)
            throw error
        }
    }

    /// 通信失敗した場合のリトライ
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
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
        let timestamp: UInt64 = UInt64(Date().timeIntervalSince1970 * 1000)
        let requestId: String = UUID().uuidString

        do {
            let response: Imink.ServerResponse = try await request(try Imink(accessToken: accessToken, server: server, requestId: requestId, timestamp: timestamp))
            return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
        } catch(let error) {
            do {
                if server == .Imink {
                    throw error
                }
                let response: Imink.ServerResponse = try await request(try Imink(accessToken: accessToken, server: .Imink, requestId: requestId, timestamp: timestamp))
                return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
            } catch(let error) {
                do {
                    if server == .Flapg {
                        throw error
                    }
                    let response: Imink.ServerResponse = try await request(try Imink(accessToken: accessToken, server: .Flapg, requestId: requestId, timestamp: timestamp))
                    return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
                } catch(let error) {
                    if server == .Nxapi {
                        throw error
                    }
                    let response: Imink.ServerResponse = try await request(try Imink(accessToken: accessToken, server: .Nxapi, requestId: requestId, timestamp: timestamp))
                    return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
                }
            }
        }
    }

    /// ハッシュ取得
    func getHash(accessToken: GameServiceToken.Response) async throws -> Imink.Response {
        let timestamp: UInt64 = UInt64(Date().timeIntervalSince1970 * 1000)
        let requestId: String = UUID().uuidString

        do {
            let response: Imink.ServerResponse = try await request(try Imink(accessToken: accessToken, server: server, requestId: requestId, timestamp: timestamp))
            return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
        } catch(let error) {
            do {
                if server == .Imink {
                    throw error
                }
                let response: Imink.ServerResponse = try await request(try Imink(accessToken: accessToken, server: .Imink, requestId: requestId, timestamp: timestamp))
                return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
            } catch(let error) {
                do {
                    if server == .Flapg {
                        throw error
                    }
                    let response: Imink.ServerResponse = try await request(try Imink(accessToken: accessToken, server: .Flapg, requestId: requestId, timestamp: timestamp))
                    return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
                } catch(let error) {
                    if server == .Nxapi {
                        throw error
                    }
                    let response: Imink.ServerResponse = try await request(try Imink(accessToken: accessToken, server: .Nxapi, requestId: requestId, timestamp: timestamp))
                    return Imink.Response(f: response.f, requsetId: requestId, timestamp: timestamp)
                }
            }
        }
    }

    /// AppVersion
    func getAppVersion() async throws -> AppVersion.Response {
        let response: AppVersion.Response = try await request(AppVersion())
        self.keychain.xVersion = response.version
        self.keychain.version = response.webVersion
        return response
    }

    /// X-ProductVersion取得
    func getXVersion() async throws -> XVersion.Response {
        let response: XVersion.Response = XVersion.Response(context: try await request(XVersion()))
        self.keychain.xVersion = response.version
        return response
    }

    /// WebVersion取得
    func getWebVersion() async throws -> WebVersion.Response {
        let response: String = try await request(WebVersion())
        return WebVersion.Response(context: response)
    }

    func getWebRevision(hash: String) async throws -> WebRevision.Response {
        let response: WebRevision.Response = WebRevision.Response(context: try await request(WebRevision(hash: hash)))
        self.keychain.version = response.description
        return response
    }

    /// GameServiceToken取得
    func getGameServiceToken(accessToken: AccessToken.Response, version: AppVersion.Response) async throws -> GameServiceToken.Response {
        let response : Imink.Response = try await getHash(accessToken: accessToken)
        return try await request(GameServiceToken(imink: response, accessToken: accessToken, version: version))
    }

    /// GameWebToken取得
    func getGameWebToken(accessToken: GameServiceToken.Response, version: AppVersion.Response, contentId: ContentId) async throws -> GameWebToken.Response {
        let response : Imink.Response = try await getHash(accessToken: accessToken)
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
        let headers: [String: String]? = await request(IksmSession(accessToken: gameWebToken.result.accessToken))
        return try IksmSession.Response(headers: headers)
    }
}
