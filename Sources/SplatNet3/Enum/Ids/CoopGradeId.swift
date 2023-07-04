//
//  CoopGradeId.swift
//  SplatNet3
//
//  Created by devonly on 2023/06/02.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopGradeId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Grade00
    public var id: Int { rawValue }

    case Grade00 = 0
    case Grade01 = 1
    case Grade02 = 2
    case Grade03 = 3
    case Grade04 = 4
    case Grade05 = 5
    case Grade06 = 6
    case Grade07 = 7
    case Grade08 = 8
}
