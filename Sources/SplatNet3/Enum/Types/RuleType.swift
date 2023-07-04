//
//  RuleType.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/24.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

/// サーモンランにおけるルールモード
public enum RuleType: String, UnsafeRawRepresentable {
    public var id: String { rawValue }
    public static var defaultValue: RuleType = .UNKNOWN

    case UNKNOWN
    case REGULAR
    case BIG_RUN
    case TEAM_CONTEST
}
