//
//  CoopWaterLevelId.swift
//  SplatNet3
//
//  Created by devonly on 2023/01/30.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopWaterLevelId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .NormalTide
    public var id: Int { rawValue }

    case LowTide = 0
    case NormalTide = 1
    case HighTide = 2
}
