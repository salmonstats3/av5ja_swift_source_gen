//
//  WeaponInfoMainIdnfoSpecial.swift
//
//  Created by tkgstrator on 2023/06/02
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
    case SpNiceBall = 20_006
    ///  ホップソナー
    case SpShockSonar = 20_007
    ///  メガホンレーザー5.1ch
    case SpMicroLaser = 20_009
    ///  ジェットパック
    case SpJetpack = 20_010
    ///  カニタンク
    case SpChariot = 20_012
    ///  サメライド
    case SpSkewer = 20_013
    ///  トリプルトルネード
    case SpTripleTornado = 20_014
    ///  スーパーチャクチ
    case SpSuperLanding = 20_101
}
