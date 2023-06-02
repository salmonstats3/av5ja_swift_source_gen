//
//  CoopStageBannerId.swift
//
//  Created by tkgstrator on 2023/06/03
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopStageBannerId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Unknown
    public var id: Int { rawValue }

    /// ？？？
    case Unknown = -999
    /// アラマキ砦
    case Tutorial = 0
    /// シェケナダム
    case Shakeup = 1
    /// アラマキ砦
    case Shakespiral = 2
    /// 難破船ドン・ブラコ
    case Shakeship = 6
    /// ムニ・エール海洋発電所
    case Shakedent = 7
    /// すじこジャンクション跡
    case Shakehighway = 8
    /// スメーシーワールド
    case Carousel = 100
    /// 海女美術大学
    case Upland = 102
    /// マテガイ放水路
    case Temple = 103
}
