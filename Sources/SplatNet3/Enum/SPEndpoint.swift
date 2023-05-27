//
//  SPEndpoint.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI

/// エンドポイント
public enum SPEndpoint: String, CaseIterable, Identifiable {
    public var id: String { rawValue }
    /// SessionToken
    case SESSION_TOKEN          = "api/session_token"
    /// AccessToken
    case ACCESS_TOKEN           = "api/token"
    /// IMINK
    case F                      = "f"
    /// FLAPG
    case FLAPG                  = "ika/api/login-main"
    /// Results
    case NXAPI                  = "api/znca/f"
    /// GameServiceToken
    case GAME_SERVICE_TOKEN     = "v3/Account/Login"
    /// GameWebToken
    case GAME_WEB_TOKEN         = "v2/Game/GetWebServiceToken"
    /// X-Product-Version
    case VERSION                = "v3/version"
    /// BulletToken
    case BULLET_TOKEN           = "api/bullet_tokens"
    /// Schedule
    case COOP_SCHEDULE          = "api/schedules"
    /// Summary
    case COOP_SUMMARY           = "api/summary"
    /// Results
    case COOP_RESULT            = "api/results"
    /// Unknown
    case UNKNOWN                = "unknown"
    /// Salmon Stats
    case STATS                  = "api/salmonstats"
    /// Salmon Stats
    case COOP_SCHEDULES         = "v1/schedules"

    init<T: RequestType>(request: T) {
        let path: String = request.path.replacingOccurrences(of: "connect/1.0.0/", with: "")
        if let value: SPEndpoint = SPEndpoint(rawValue: path) {
            self = value
            return
        }
        /// Salmon Stats
        if path.contains("v2/results") {
            self = .STATS
            return
        }
        /// App Version
        if path.contains("v3/authorize/version") {
            self = .VERSION
            return
        }
        /// Others
        self = .UNKNOWN
    }

    var type: ProgressAPIType {
        switch self {
        case .SESSION_TOKEN, .ACCESS_TOKEN:
            return .NSO
        case .GAME_WEB_TOKEN, .GAME_SERVICE_TOKEN, .BULLET_TOKEN:
            return .APP
        case .VERSION:
            return .API
        case .F:
            return .IMINK
        case .FLAPG:
            return .FLAPG
        case .NXAPI:
            return .NXAPI
        default:
            return .API
        }
    }

    var color: Color {
        switch self {
        case .SESSION_TOKEN, .ACCESS_TOKEN:
            return SPColor.SplatNet3.SPSalmonGreen
        case .GAME_WEB_TOKEN, .GAME_SERVICE_TOKEN, .BULLET_TOKEN:
            return SPColor.SplatNet3.SPRed
        case .VERSION, .STATS, .COOP_SCHEDULES:
            return SPColor.SplatNet3.SPBlue
        case .F, .FLAPG, .NXAPI:
            return SPColor.SplatNet3.SPPink
        default:
            return SPColor.SplatNet3.SPPurple
        }
    }
}
