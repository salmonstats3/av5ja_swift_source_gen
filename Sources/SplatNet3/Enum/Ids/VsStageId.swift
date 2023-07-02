//
//  VsStageId.swift
//
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum VsStageId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Dummy
    public var id: Int { rawValue }

    case Yunohana = 1
    case Distinct = 2
    case Yagara = 3
    case Temple = 4
    case Factory = 5
    case Scrap = 6
    case BigSlope = 7
    case Section = 8
    case Jyoheki = 9
    case Kaisou = 10
    case Pivot = 11
    case Hiagari = 12
    case Upland = 13
    case Nagasaki = 14
    case Line = 15
    case Carousel = 16
    case Wave = 17
    case Piller = 18
    case Dummy = -999
}
