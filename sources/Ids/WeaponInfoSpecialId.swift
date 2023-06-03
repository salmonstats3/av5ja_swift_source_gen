//
//  WeaponInfoSpecial.swift
//
//  Created by tkgstrator on 2023/06/04
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum WeaponInfoSpecialId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .RandomGreen
    public var id: Int { rawValue }

    ///  緑ランダム
    case RandomGreen = -1
    ///  ウルトラショット
    case SpUltraShot = 1
    ///  ナイスダマ
    case SpNiceBall = 20006
    ///  ホップソナー
    case SpShockSonar = 20007
    ///  メガホンレーザー5.1ch
    case SpMicroLaser = 20009
    ///  ジェットパック
    case SpJetpack = 20010
    ///  カニタンク
    case SpChariot = 20012
    ///  サメライド
    case SpSkewer = 20013
    ///  トリプルトルネード
    case SpTripleTornado = 20014
    ///  スーパーチャクチ
    case SpSuperLanding = 20101
}