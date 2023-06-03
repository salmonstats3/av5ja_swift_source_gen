//
//  ScaleType.swift
//
//
//  Created by devonly on 2022/11/24.
//

import Foundation

public enum ScaleType: Int, UnsafeRawRepresentable {
    public var id: Int { rawValue }
    public static var defaultValue: ScaleType = .BRONZE

    case BRONZE = 0
    case SILVER = 1
    case GOLD   = 2
}
