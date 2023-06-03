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

    /// スメーシーワールド
    case Carousel = "37219fbc65a817db2321d93196d4df8af15fe1e3170287c3070ed8ed57e70987"
    /// ムニ・エール海洋発電所
    case Shakedent = "8fe373c92b524b39cbae4d90aabdc718e705ef11bbfb2fab46c8fb88c735a401"
    /// すじこジャンクション跡
    case Shakehighway = "b71566c33621016a315868e0ddbe40a8ccde1902048265fbfe17b0be06e723a1"
    /// 難破船ドン・ブラコ
    case Shakeship = "03b4f02f9fbd8e0979139c8911f5413b3cc60b836035f382f476c0db255401fa"
    /// アラマキ砦
    case Shakespiral = "c60554392a0da8bde91b6bd61a43f346041e9482d324808bd5a5d167196ed0b8"
    /// シェケナダム
    case Shakeup = "c746835556967c7c22178163baa18db46375eb31322627626006392f23457aa7"
    /// マテガイ放水路
    case Temple = "67848024a5ed82f510d269198fa65b5bcd14bcf2ddc7637430bc865b8c03dd43"
    /// アラマキ砦
    case Tutorial = "c26982b1425da26a9637dd69da684a036c8b67a1ddf2c3d09b915a96e4b58037"
    /// ？？？
    case Unknown = "b764cdc0eab7137467211272fa539f1260d1bf2e71bcf6ff3bdc960f5c16aa14"
    /// 海女美術大学
    case Upland = "9e56987432e8a734a342b7d1f38973de1807023569a337dd766392fff6409f71"
}