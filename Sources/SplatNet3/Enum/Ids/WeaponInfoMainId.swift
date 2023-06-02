//
//  WeaponInfoMainId.swift
//
//  Created by tkgstrator on 2023/06/02
//  Copyright @2023 Magi, Corporation. All rights reserved.
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
    case RollerCompact = 1_000
    ///  スプラローラー
    case RollerNormal = 1_010
    ///  ダイナモローラー
    case RollerHeavy = 1_020
    ///  ヴァルアブルローラー
    case RollerHunter = 1_030
    ///  ワイドローラー
    case RollerWide = 1_040
    ///  パブロ
    case BrushMini = 1_100
    ///  ホクサイ
    case BrushNormal = 1_110
    ///  フィンセント
    case BrushHeavy = 1_120
    ///  スクイックリン
    case ChargerQuick = 2_000
    ///  スプラチャージャー
    case ChargerNormal = 2_010
    ///  リッター4K
    case ChargerLong = 2_030
    ///  14式竹筒銃
    case ChargerLight = 2_050
    ///  ソイチューバー
    case ChargerKeeper = 2_060
    ///  R-PEN
    case ChargerPencil = 2_070
    ///  バケットスロッシャー
    case SlosherStrong = 3_000
    ///  ヒッセン
    case SlosherDiffusion = 3_010
    ///  スクリュースロッシャー
    case SlosherLauncher = 3_020
    ///  オーバーフロッシャー
    case SlosherBathtub = 3_030
    ///  エクスプロッシャー
    case SlosherWashtub = 3_040
    ///  スプラスピナー
    case SpinnerQuick = 4_000
    ///  バレルスピナー
    case SpinnerStandard = 4_010
    ///  ハイドラント
    case SpinnerHyper = 4_020
    ///  クーゲルシュライバー
    case SpinnerDownpour = 4_030
    ///  ノーチラス
    case SpinnerSerein = 4_040
    ///  スパッタリー
    case ManeuverShort = 5_000
    ///  スプラマニューバー
    case ManeuverNormal = 5_010
    ///  ケルビン525
    case ManeuverGallon = 5_020
    ///  デュアルスイーパー
    case ManeuverDual = 5_030
    ///  クアッドホッパー
    case ManeuverStepper = 5_040
    ///  パラシェルター
    case ShelterNormal = 6_000
    ///  キャンピングシェルター
    case ShelterWide = 6_010
    ///  スパイガジェット
    case ShelterCompact = 6_020
    ///  ストリンガー
    case StringerNormal = 7_010
    ///  LACT-450
    case StringerShort = 7_020
    ///  ジムワイパー
    case SaberNormal = 8_000
    ///  ドライブワイパー
    case SaberLite = 8_010
    ///  クマサン印のブラスター
    case BlasterBear = 20_900
    ///  クマサン印のチャージャー
    case ChargerBear = 22_900
    ///  クマサン印のスロッシャー
    case SlosherBear = 23_900
    ///  クマサン印のシェルター
    case ShelterBear = 26_900
    ///  クマサン印のストリンガー
    case StringerBear = 27_900
    ///  クマサン印のワイパー
    case SaberBear = 28_900
}
