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
    case Grade00 = "07374aaf4d8cab4c9e122820ebf0d4316429fa300ba027420f0cd1167769ed3c"
    /// はんにんまえ
    case Grade01 = "81ba00a5dd568487a3c6538a7d3bbc45e669712e78c6060f380e2d5cff75e69a"
    /// いちにんまえ
    case Grade02 = "7c6cbac10750b6358c7ccb7596cc157c34ae278834809d541f03895a3bc62cf4"
    /// じゅくれん
    case Grade03 = "61b9febece9115cedaa7e9596bf41bdda346600234bf1e87de048924d76b5e68"
    /// たつじん
    case Grade04 = "fe55976d62c78d94d6930d0f1584909d8fb3a0d1ceb02ce01e99319d3eb17962"
    /// たつじん＋１
    case Grade05 = "db37cedb5c4841cddc85656c27172ee28f162aafc16bcda2ed4fa21f8b321569"
    /// たつじん＋２
    case Grade06 = "6982753e7664f9c8f188eeda40fd79a4535ec667b9ee196adb68c2ca0d972df5"
    /// たつじん＋３
    case Grade07 = "ba73831f2277704e1a67dac8fdd31caf8cb1c99d6a69809feb8e6b3c80a47212"
    /// でんせつ
    case Grade08 = "95a7255b939bd4d6e9094bf0f13d762729f7ef9773eeaa0bc77e3f1201ffe8f4"
}