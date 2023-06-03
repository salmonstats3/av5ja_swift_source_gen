//
//  GearInfoShoes.swift
//
//  Created by tkgstrator on 2023/06/03
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum GearInfoShoesId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .ShsSLO000
    public var id: Int { rawValue }

    ///  グリッチョ ブルー
    case ShsSLO000 = 1_000
    ///  キャンバス バナナ
    case ShsSLO001 = 1_001
    ///  グリッチョ グリーン 限定版
    case ShsSLO002 = 1_002
    ///  シーホース ホワイト
    case ShsSLO003 = 1_003
    ///  グリッチョ オレンジ
    case ShsSLO004 = 1_004
    ///  シーホース ブラックレザー
    case ShsSLO005 = 1_005
    ///  キャンバス クマノミ
    case ShsSLO006 = 1_006
    ///  シーホース イエロー
    case ShsSLO007 = 1_007
    ///  ベリベリホワイト
    case ShsSLO008 = 1_008
    ///  ベリベリレッド
    case ShsSLO009 = 1_009
    ///  ユデスパイカ
    case ShsSLO010 = 1_010
    ///  レアスパイカ
    case ShsSLO011 = 1_011
    ///  ボルダーシューズ タイノエ
    case ShsSLO012 = 1_012
    ///  NNJグリーン
    case ShsSLO021 = 1_021
    ///  ザ・ベース ルーキー
    case ShsSLO022 = 1_022
    ///  クラム600 カンロ
    case ShsSLO023 = 1_023
    ///  ザ・ベース ボス
    case ShsSLO024 = 1_024
    ///  クラム600 コハク
    case ShsSLO025 = 1_025
    ///  シーホースHi レッド
    case ShsSHI000 = 2_000
    ///  シーホースHi ゾンビ
    case ShsSHI001 = 2_001
    ///  キャンバスHi マッシュルーム
    case ShsSHI002 = 2_002
    ///  シーホースHi パープル
    case ShsSHI003 = 2_003
    ///  キャンバスHi モロヘイヤ
    case ShsSHI004 = 2_004
    ///  キャンバスHi トマト
    case ShsSHI005 = 2_005
    ///  シーホースHi ゴールド
    case ShsSHI006 = 2_006
    ///  シャークモカシン
    case ShsSHI008 = 2_008
    ///  ジョーズモカシン
    case ShsSHI009 = 2_009
    ///  デカロニックチョコレート
    case ShsSHI010 = 2_010
    ///  デカロニックミント
    case ShsSHI011 = 2_011
    ///  オルカHi サンセット
    case ShsSHI016 = 2_016
    ///  エギング4 アカクロ
    case ShsSHI017 = 2_017
    ///  エギング4 アオクロ
    case ShsSHI018 = 2_018
    ///  エギング5 シロアカ
    case ShsSHI025 = 2_025
    ///  パワーリセットHi
    case ShsSHI042 = 2_042
    ///  テンヤ8 レッド
    case ShsSHI043 = 2_043
    ///  テンヤ8 パープル
    case ShsSHI044 = 2_044
    ///  01STER コハク
    case ShsSHI045 = 2_045
    ///  ウノアシHi
    case ShsSHI046 = 2_046
    ///  カモスニーカー ドトン
    case ShsSHI047 = 2_047
    ///  カモスニーカー スイトン
    case ShsSHI048 = 2_048
    ///  パーチHi ホワイト
    case ShsSHI049 = 2_049
    ///  01STER カンロ
    case ShsSHI052 = 2_052
    ///  ピンクビーンズ
    case ShsSHT000 = 3_000
    ///  オレンジアローズ
    case ShsSHT001 = 3_001
    ///  ウミウシイエロー
    case ShsSHT002 = 3_002
    ///  ホワイトアローズ
    case ShsSHT003 = 3_003
    ///  シアンビーンズ
    case ShsSHT004 = 3_004
    ///  ウミウシブルー
    case ShsSHT005 = 3_005
    ///  ウミウシレッド
    case ShsSHT006 = 3_006
    ///  ウミウシパープル
    case ShsSHT007 = 3_007
    ///  クレイジーアローズ
    case ShsSHT008 = 3_008
    ///  ブラックビーンズ
    case ShsSHT009 = 3_009
    ///  アロメッシュイエロー
    case ShsSHT012 = 3_012
    ///  アローズ タタキベッチュー
    case ShsSHT013 = 3_013
    ///  イカサシ スクランブル
    case ShsSHT020 = 3_020
    ///  グッピーフラミンゴ
    case ShsSHT021 = 3_021
    ///  MOVEレッド
    case ShsSHT022 = 3_022
    ///  MODZ-9
    case ShsSHT023 = 3_023
    ///  シェルバシラWO
    case ShsSHT024 = 3_024
    ///  フカヒレニマイバ
    case ShsSHT025 = 3_025
    ///  シャコナックル
    case ShsSHT026 = 3_026
    ///  オイスタークロッグ
    case ShsSDL000 = 4_000
    ///  チョコクロッグ
    case ShsSDL001 = 4_001
    ///  ブルーベリーコンフォート
    case ShsCFS000 = 4_002
    ///  アケビコンフォート
    case ShsCFS001 = 4_003
    ///  デルタストラップ ネオン
    case ShsSDL003 = 4_007
    ///  BBサンダル
    case ShsSDL004 = 4_008
    ///  デルタストラップ スノー
    case ShsSDL005 = 4_009
    ///  デルタストラップ ルミナス
    case ShsSDL006 = 4_010
    ///  ヤキフグシャワサン アカ
    case ShsSDL007 = 4_011
    ///  ヤキフグシャワサン キ
    case ShsSDL008 = 4_012
    ///  フィッシュボーンワラチ
    case ShsSDL010 = 4_014
    ///  アローズサンダル アオキ
    case ShsSDL011 = 4_015
    ///  BSサンダル
    case ShsSDL012 = 4_016
    ///  べリべリサン オレンジ
    case ShsSDL013 = 4_017
    ///  アローズサンダル ムラキ
    case ShsSDL014 = 4_018
    ///  アナアキストラップ レザー
    case ShsSDL015 = 4_019
    ///  べリべリサン マゼンタ
    case ShsSDL017 = 4_021
    ///  べリべリサン シアン
    case ShsSDL018 = 4_022
    ///  エゾックロッグ ネイビー
    case ShsSDL019 = 4_023
    ///  エゾックロッグ レッド
    case ShsSDL020 = 4_024
    ///  エゾックロッグ イエロー
    case ShsSDL021 = 4_025
    ///  エゾックロッグ グリーン
    case ShsSDL022 = 4_026
    ///  トレッキングライト
    case ShsTRS000 = 5_000
    ///  トレッキングカスタム
    case ShsTRS001 = 5_001
    ///  トレッキングプロ
    case ShsTRS002 = 5_002
    ///  モトクロスブーツ
    case ShsBOT000 = 6_000
    ///  ヌバックブーツ イエロー
    case ShsBOT001 = 6_001
    ///  ヌバックブーツ レッド
    case ShsBOT002 = 6_002
    ///  モトクロス ソリッドブルー
    case ShsBOT003 = 6_003
    ///  レイニーモスグリーン
    case ShsBOT004 = 6_004
    ///  レイニーアセロラ
    case ShsBOT005 = 6_005
    ///  ロッキンホワイト
    case ShsBOT006 = 6_006
    ///  ロッキンチェリー
    case ShsBOT007 = 6_007
    ///  ロッキンイエロー
    case ShsBOT008 = 6_008
    ///  レイニーシャボン
    case ShsBOT009 = 6_009
    ///  ミルキーダウンブーツ
    case ShsBOT010 = 6_010
    ///  アイスダウンブーツ
    case ShsBOT011 = 6_011
    ///  ハンティングブーツ
    case ShsBOT012 = 6_012
    ///  ロッキンブラック
    case ShsBOT013 = 6_013
    ///  モトクロスM-DCB
    case ShsBOT019 = 6_019
    ///  ヌバックブーツxSJ
    case ShsBOT020 = 6_020
    ///  ダックブーツ スノウ
    case ShsBOT021 = 6_021
    ///  カセブカブーツ レッド
    case ShsBOT023 = 6_023
    ///  カセブカブーツ ダップル
    case ShsBOT024 = 6_024
    ///  ロッキンピンク
    case ShsBOT025 = 6_025
    ///  ウォームブーツ
    case ShsBOT026 = 6_026
    ///  カモチャームブーツ
    case ShsBOT027 = 6_027
    ///  スリッポン ブルー
    case ShsSLP000 = 7_000
    ///  スリッポン レッド
    case ShsSLP001 = 7_001
    ///  スリッポン チドリ
    case ShsSLP002 = 7_002
    ///  チゴフグスリッポン
    case ShsSLP004 = 7_004
    ///  ラバーソール ホワイト
    case ShsLTS000 = 8_000
    ///  ラバーソール チェリー
    case ShsLTS001 = 8_001
    ///  ラバーソール ターコイズ
    case ShsLTS002 = 8_002
    ///  イカスミチップ
    case ShsLTS003 = 8_003
    ///  イカヤキチップ
    case ShsLTS004 = 8_004
    ///  イカボウズキャメル
    case ShsLTS005 = 8_005
    ///  ネイビーチップ レッドソール
    case ShsLTS007 = 8_007
    ///  アナアキラバー ハバネロ
    case ShsLTS010 = 8_010
    ///  アナアキラバー フェイク
    case ShsLTS011 = 8_011
    ///  チャッカブーツ サンド
    case ShsLTS013 = 8_013
    ///  デッキシューズ フカイリ
    case ShsLTS014 = 8_014
    ///  マッドラバー
    case ShsCOP101 = 21_001
    ///  スクールローファー ハイソ
    case ShsAMB000 = 25_000
    ///  サムライシューズ
    case ShsAMB001 = 25_001
    ///  パワードレッグス
    case ShsAMB002 = 25_002
    ///  キルトローファー ルーズ
    case ShsAMB003 = 25_003
    ///  シノビアシ
    case ShsAMB004 = 25_004
    ///  パワードレッグス オリジン
    case ShsAMB005 = 25_005
    ///  ヒメイトスニーカー
    case ShsAMB006 = 25_006
    ///  イイダチスリッポン
    case ShsAMB007 = 25_007
    ///  エンチャントブーツ
    case ShsAMB008 = 25_008
    ///  タコティカルなすねあて
    case ShsAMB009 = 25_009
    ///  ひれおくんのあし
    case ShsAMB010 = 25_010
    ///  イダテンヒモサン
    case ShsAMB011 = 25_011
    ///  アンクルサポーター
    case ShsAMB012 = 25_012
    ///  バーサークグリーブ
    case ShsAMB013 = 25_013
    ///  スクールローファー スゲソ
    case ShsAMB014 = 25_014
    ///  キルトローファー スゲソ
    case ShsAMB015 = 25_015
    ///  ヒーローキックス レプリカ
    case ShsMSN000 = 27_000
    ///  アーマーブーツ レプリカ
    case ShsMSN004 = 27_004
    ///  ケタコゾネスブーツ
    case ShsMSN110 = 27_110
    ///  タコ・ブーツ
    case ShsMSN200 = 27_200
    ///  サバイバルフット
    case ShsMSN301 = 27_301
    ///  ヒーローブーツLv1
    case ShsMSN302 = 27_302
    ///  ヒーローブーツLv2
    case ShsMSN303 = 27_303
    ///  ヒーローブーツLv3
    case ShsMSN304 = 27_304
    ///  ヒーローブーツST
    case ShsMSN305 = 27_305
    ///  ヒーローブーツ レプリカ
    case ShsMSN306 = 27_306
    ///  でんせつのゾーリ
    case ShsMSN310 = 27_310
    ///  AGE262
    case ShsTRG000 = 28_000
}
