//
//  ScaleId.swift
//
//  Created by tkgstrator on 2023/06/02
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum ScaleId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Gold
    public var id: Int { rawValue }

    case Gold = 0
    case Silver = 1
    case Bronze = 2

    public static var allCases: [ScaleId] = [
        .Bronze,
        .Silver,
        .Gold,
    ]
}
