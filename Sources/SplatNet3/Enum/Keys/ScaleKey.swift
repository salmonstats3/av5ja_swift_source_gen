//
//  ScaleKey.swift
//  SplatNet3
//
//  Created by devonly on 2023/06/02.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum ScaleKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Gold
    public var id: Int { ScaleId.allCases[ScaleKey.allCases.firstIndex(of: self) ?? 0].rawValue }

    case Gold = "8d749e1c38c7dd43ef78988bca6dc4578bad0b2ffb3fce8045b09c7240911ea9"
    case Silver = "96806fb0ea6b6fbc489cd8360de832ca22026b1b70821e7d4b534d00ba9c7adf"
    case Bronze = "d6d78a989b540fa45f0b305c016b7cfae14ed09fd3de1865b337e08919ac1a95"

    public static var allCases: [ScaleKey] = [
        .Bronze,
        .Silver,
        .Gold
    ]
}
