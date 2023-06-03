//
//  CoopWaterLevelId.swift
//
//  Created by tkgstrator on 2023/01/30
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopWaterLevelId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .NormalTide
    public var id: Int { rawValue }

    case LOW_TIDE       = 0
    case NORMAL_TIDE    = 1
    case HIGH_TIDE      = 2
}
