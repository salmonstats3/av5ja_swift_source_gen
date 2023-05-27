//
//  GradeKey.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum GradeKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Apprentice
    public var id: String { rawValue }

    case Apprentice             = "b4f1e5a491aa8f1952352fb4831a4e6a82817bc1179b51739928c6c5a1deb484"
    case Part_Timer             = "a7d6f7f0e87585179ae1e746afef2b67af4eddabd90cb06e1fe9761aef1cce07"
    case Go_Getter              = "8ced40cefb44e796793d62be1647ee6dd8b16ff92dec956aaebc96efdae9f112"
    case Overachiever           = "8de95a5c09c429d4a508124c1792240b1559224e21f5450fa6c0776939b85287"
    case Profreshional          = "ac6997f9bc8f0852d0df6f70137d09f3154dc271c1b9f670dbd1570d69dc8e3a"
    case Profreshional_1        = "533d5cce4a7efad282acfbbf2188e92653cc91232dfd55d1b0053d9c1aaa51da"
    case Profreshional_2        = "97aef457a99b051b0ec454e0e44f038d4acce212f82fd6a968f4206e949bbed2"
    case Profreshional_3        = "ee9651050a08fe058782eea37b988dfe7466760ca4dbb84acb45b19bc1c8476e"
    case Eggsecutive_VP         = "0c80649527617f716da3ce8142a0924c37cfe598b43da69c2721b7899487b5fc"
}
