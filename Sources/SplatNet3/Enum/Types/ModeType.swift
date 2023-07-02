//
//  ModeType.swift
//
//
//  Created by devonly on 2022/11/24.
//

import Foundation

/// サーモンランにおけるバイトモード
public enum ModeType: String, UnsafeRawRepresentable {
    public var id: String { rawValue }
    public static var defaultValue: ModeType = .UNKNOWN

    case UNKNOWN
    case REGULAR
    case LIMITED
    case PRIVATE_CUSTOM
    case PRIVATE_SCENARIO
}
