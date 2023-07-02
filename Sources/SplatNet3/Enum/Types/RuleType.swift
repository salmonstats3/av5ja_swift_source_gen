//
//  RuleType.swift
//
//
//  Created by devonly on 2022/11/24.
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
