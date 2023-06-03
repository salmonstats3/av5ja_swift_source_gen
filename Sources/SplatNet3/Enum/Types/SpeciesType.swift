//
//  SpeciesType.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

public enum SpeciesType: String, UnsafeRawRepresentable {
    public var id: String { rawValue }
    public static var defaultValue: SpeciesType = .UNKNOWN

    case UNKNOWN
    case INKLING
    case OCTOLING
}
