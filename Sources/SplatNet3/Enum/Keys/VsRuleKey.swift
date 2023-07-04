//
//  VsRuleKey.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/25.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum VsRuleKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .TURFWAR
    public var id: String { rawValue }

    case TURFWAR = "TURF_WAR"
    case SPLATZONES = "AREA"
    case TOWERCONTROL = "LOFT"
    case RAINMAKER = "GOAL"
    case CLAMBLITZ = "CLAM"
}
