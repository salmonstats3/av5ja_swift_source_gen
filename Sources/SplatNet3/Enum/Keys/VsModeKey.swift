//
//  VsModeKey.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/25.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum VsModeKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .UNKNOWN
    public var id: String { rawValue }

    case UNKNOWN
    case REGULAR
    case BANKARA
    case PRIVATE
}
