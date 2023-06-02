//
//  CoopGradeKey.swift
//
//  Created by tkgstrator on 2023/06/03
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
    /// かけだし アルバイター
    case GradeArbeiter00 = "964c8f17803119b4aeeac69680e07de5f98a6a1729b256e62453fbcd9ab76ae6"
    /// はんにんまえ アルバイター
    case GradeArbeiter01 = "e2788fec80db2a24cdec147445ab06d56d7c9d0e74fcdea0b37c0f250404ce5c"
    /// いちにんまえ アルバイター
    case GradeArbeiter02 = "fd12bd7197e7b8b68bf7f816337f764ca65563d84da07185b284666ec221c672"
    /// じゅくれん アルバイター
    case GradeArbeiter03 = "8b24a3bb25b38f418381b46d557bf331a8c9ce7d57ddbd3a1775086f4c677213"
    /// たつじん アルバイター
    case GradeArbeiter04 = "1bace486c17f8533514e6566c8954d945041e5c456d4f21725591dbf68fbf863"
    /// たつじん＋１ アルバイター
    case GradeArbeiter05 = "6844588f7c8bcc9344daedd93cc4ac7d657e928b1c9fea0c29cbc8e6434454c4"
    /// たつじん＋２ アルバイター
    case GradeArbeiter06 = "a3d6cf43d6e3866778c7db7836c316b63e269ca209cf2b5c8199d2964c90c9da"
    /// たつじん＋３ アルバイター
    case GradeArbeiter07 = "b4b150ab7addb3281db723372902472c65a673a61d1750d1f729e427aaeebc08"
    /// でんせつ アルバイター
    case GradeArbeiter08 = "cabe998b30dcace3cf7206a06733ea84e3e070fbc3289db72c6929f43cc752e0"
}