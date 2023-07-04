//
//  ModeType.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/24.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
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
