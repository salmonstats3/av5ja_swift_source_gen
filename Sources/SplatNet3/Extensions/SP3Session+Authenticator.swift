//
//  SP3Session+Authenticator.swift
//  SplatNet3
//
//  Created by devonly on 2023/06/11.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

extension SP3Session: Authenticator {
    public func refresh(_: UserInfo, for _: Alamofire.Session, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        Task {
            let session = SP3Session()
            do {
                let account: UserInfo = try await session.refreshIfNeeded(contentId: .SP3)
                completion(.success(account))
            } catch {
                completion(.failure(error))
            }
        }
    }

    public func apply(_ credential: UserInfo, to urlRequest: inout URLRequest) {
        if let bulletToken: String = credential.bulletToken {
            #if DEBUG
                urlRequest.headers.add(.authorization(bearerToken: bulletToken))
            #else
                urlRequest.headers.add(.authorization(bearerToken: bulletToken))
            #endif
            urlRequest.headers.add(name: "X-Web-View-Ver", value: version)
        }
    }

    public func didRequest(_: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError _: Error) -> Bool {
        response.statusCode == 401
    }

    public func isRequest(_: URLRequest, authenticatedWith _: UserInfo) -> Bool {
        false
    }
}
