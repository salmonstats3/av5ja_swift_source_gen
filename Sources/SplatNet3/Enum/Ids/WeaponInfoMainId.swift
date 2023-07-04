//
//  WeaponInfoMainId.swift
//  SplatNet3
//
//  Created by devonly on 2023/06/02.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum WeaponInfoMainId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Dummy
    public var id: Int { rawValue }

    ///  はてな
    case Dummy = -999
    ///  金ランダム
    case RandomGold = -2
    ///  緑ランダム
    case RandomGreen = -1
    ///  ボールドマーカー
    case ShooterShort = 0
    ///  わかばシューター
    case ShooterFirst = 10
    ///  シャープマーカー
    case ShooterPrecision = 20
    ///  プロモデラー
    case ShooterBlaze = 30
    ///  スプラシューター
    case ShooterNormal = 40
    ///  .52ガロン
    case ShooterGravity = 50
    ///  N-ZAP
    case ShooterQuickMiddle = 60
    ///  プライムシューター
    case ShooterExpert = 70
    ///  .96ガロン
    case ShooterHeavy = 80
    ///  ジェットスイーパー
    case ShooterLong = 90
    ///  スペースシューター
    case ShooterQuickLong = 100
    ///  ノヴァブラスター
    case BlasterShort = 200
    ///  ホットブラスター
    case BlasterMiddle = 210
    ///  ロングブラスター
    case BlasterLong = 220
    ///  クラッシュブラスター
    case BlasterLightShort = 230
    ///  ラピッドブラスター
    case BlasterLight = 240
    ///  Rブラスターエリート
    case BlasterLightLong = 250
    ///  S-BLAST
    case BlasterPrecision = 260
    ///  L3リールガン
    case ShooterTripleQuick = 300
    ///  H3リールガン
    case ShooterTripleMiddle = 310
    ///  ボトルガイザー
    case ShooterFlash = 400
    ///  カーボンローラー
    case RollerCompact = 1000
    ///  スプラローラー
    case RollerNormal = 1010
    ///  ダイナモローラー
    case RollerHeavy = 1020
    ///  ヴァルアブルローラー
    case RollerHunter = 1030
    ///  ワイドローラー
    case RollerWide = 1040
    ///  パブロ
    case BrushMini = 1100
    ///  ホクサイ
    case BrushNormal = 1110
    ///  フィンセント
    case BrushHeavy = 1120
    ///  スクイックリン
    case ChargerQuick = 2000
    ///  スプラチャージャー
    case ChargerNormal = 2010
    ///  リッター4K
    case ChargerLong = 2030
    ///  14式竹筒銃
    case ChargerLight = 2050
    ///  ソイチューバー
    case ChargerKeeper = 2060
    ///  R-PEN
    case ChargerPencil = 2070
    ///  バケットスロッシャー
    case SlosherStrong = 3000
    ///  ヒッセン
    case SlosherDiffusion = 3010
    ///  スクリュースロッシャー
    case SlosherLauncher = 3020
    ///  オーバーフロッシャー
    case SlosherBathtub = 3030
    ///  エクスプロッシャー
    case SlosherWashtub = 3040
    ///  スプラスピナー
    case SpinnerQuick = 4000
    ///  バレルスピナー
    case SpinnerStandard = 4010
    ///  ハイドラント
    case SpinnerHyper = 4020
    ///  クーゲルシュライバー
    case SpinnerDownpour = 4030
    ///  ノーチラス
    case SpinnerSerein = 4040
    ///  スパッタリー
    case ManeuverShort = 5000
    ///  スプラマニューバー
    case ManeuverNormal = 5010
    ///  ケルビン525
    case ManeuverGallon = 5020
    ///  デュアルスイーパー
    case ManeuverDual = 5030
    ///  クアッドホッパー
    case ManeuverStepper = 5040
    ///  パラシェルター
    case ShelterNormal = 6000
    ///  キャンピングシェルター
    case ShelterWide = 6010
    ///  スパイガジェット
    case ShelterCompact = 6020
    ///  ストリンガー
    case StringerNormal = 7010
    ///  LACT-450
    case StringerShort = 7020
    ///  ジムワイパー
    case SaberNormal = 8000
    ///  ドライブワイパー
    case SaberLite = 8010
    ///  クマサン印のブラスター
    case BlasterBear = 20900
    ///  クマサン印のチャージャー
    case ChargerBear = 22900
    ///  クマサン印のスロッシャー
    case SlosherBear = 23900
    ///  クマサン印のシェルター
    case ShelterBear = 26900
    ///  クマサン印のストリンガー
    case StringerBear = 27900
    ///  クマサン印のワイパー
    case SaberBear = 28900
}
