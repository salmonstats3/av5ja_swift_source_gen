//
//  VsRuleType.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/25.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

/// バンカラマッチのモード
public enum VsRuleType: Int, UnsafeRawRepresentable {
    public var id: Int { rawValue }
    public static var defaultValue: VsRuleType = .TURF_WAR

    case TURF_WAR = 0
    case SPLATZONES = 1
    case TOWER_CONTROL = 2
    case RAINMAKER = 3
    case CLAM_BLITZ = 4
}
