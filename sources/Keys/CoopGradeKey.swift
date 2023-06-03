//
//  CoopGradeKey.swift
//
//  Created by tkgstrator on 2023/06/04
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopGradeKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Grade00
    public var id: Int { CoopGradeId.allCases[CoopGradeKey.allCases.firstIndex(of: self) ?? 0].rawValue }

    /// かけだし
    case Grade00 = "b4f1e5a491aa8f1952352fb4831a4e6a82817bc1179b51739928c6c5a1deb484"
    /// はんにんまえ
    case Grade01 = "a7d6f7f0e87585179ae1e746afef2b67af4eddabd90cb06e1fe9761aef1cce07"
    /// いちにんまえ
    case Grade02 = "8ced40cefb44e796793d62be1647ee6dd8b16ff92dec956aaebc96efdae9f112"
    /// じゅくれん
    case Grade03 = "8de95a5c09c429d4a508124c1792240b1559224e21f5450fa6c0776939b85287"
    /// たつじん
    case Grade04 = "ac6997f9bc8f0852d0df6f70137d09f3154dc271c1b9f670dbd1570d69dc8e3a"
    /// たつじん＋１
    case Grade05 = "533d5cce4a7efad282acfbbf2188e92653cc91232dfd55d1b0053d9c1aaa51da"
    /// たつじん＋２
    case Grade06 = "97aef457a99b051b0ec454e0e44f038d4acce212f82fd6a968f4206e949bbed2"
    /// たつじん＋３
    case Grade07 = "ee9651050a08fe058782eea37b988dfe7466760ca4dbb84acb45b19bc1c8476e"
    /// でんせつ
    case Grade08 = "0c80649527617f716da3ce8142a0924c37cfe598b43da69c2721b7899487b5fc"
}