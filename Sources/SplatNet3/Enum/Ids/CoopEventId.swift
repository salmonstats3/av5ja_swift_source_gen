//
//  CoopEventId.swift
//
//  Created by tkgstrator on 2023/06/02
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

public enum CoopEventId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .WaterLevels
    public var id: Int { rawValue }

    case WaterLevels    = 0
    case Rush           = 1
    case GoldieSeeking  = 2
    case Griller        = 3
    case TheMothership  = 4
    case Fog            = 5
    case CohockCharge   = 6
    case Giant          = 7
    case Mudmouth       = 8
}
