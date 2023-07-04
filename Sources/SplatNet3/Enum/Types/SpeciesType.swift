//
//  SpeciesType.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/24.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum SpeciesType: String, UnsafeRawRepresentable {
    public var id: String { rawValue }
    public static var defaultValue: SpeciesType = .UNKNOWN

    case UNKNOWN
    case INKLING
    case OCTOLING
}
