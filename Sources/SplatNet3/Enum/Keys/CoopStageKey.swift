//
//  CoopStageKey.swift
//
//  Created by tkgstrator on 2023/06/04
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopStageKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Carousel
    public var id: Int { CoopStageId.allCases[CoopStageKey.allCases.firstIndex(of: self) ?? 0].rawValue }

    /// ？？？
    case Unknown = "ffa84f05a6437395a0a128cad1a99e8dd0f303ce4fd687fa648617a0075d7ad9"
    /// アラマキ砦
    case Tutorial = "744f65e62b538b63128469805c23592429f9830de7a1c12fdc910941fbeedfc4"
    /// シェケナダム
    case Shakeup = "be584c7c7f547b8cbac318617f646680541f88071bc71db73cd461eb3ea6326e"
    /// アラマキ砦
    case Shakespiral = "3418d2d89ef84288c78915b9acb63b4ad48df7bfcb48c27d6597920787e147ec"
    /// 難破船ドン・ブラコ
    case Shakeship = "1a29476c1ab5fdbc813e2df99cd290ce56dfe29755b97f671a7250e5f77f4961"
    /// ムニ・エール海洋発電所
    case Shakedent = "f1e4df4cff1dc5e0acc66a9654fecf949224f7e4f6bd36305d4600ac3fa3db7b"
    /// すじこジャンクション跡
    case Shakehighway = "0e05d4caa34089a447535708370286f4ee6068661359b4d7cf6c319863424f84"
    /// スメーシーワールド
    case Carousel = "2276a46e42a11637776ebc15cf2d46a589f1dba34a76d5c940c418ed7371d071"
    /// 海女美術大学
    case Upland = "3598b7f54248b84c47cde6b99aa45ff296a41d3d5f38eaccfe2327b2874fff0b"
    /// マテガイ放水路
    case Temple = "71c7076fc2d23f1833c923747e8582e29eb275bed96d8360aa5d0ed6ae069230"
}