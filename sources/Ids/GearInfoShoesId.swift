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
    case ShsSLO000 = 1000
    ///  キャンバス バナナ
    case ShsSLO001 = 1001
    ///  グリッチョ グリーン 限定版
    case ShsSLO002 = 1002
    ///  シーホース ホワイト
    case ShsSLO003 = 1003
    ///  グリッチョ オレンジ
    case ShsSLO004 = 1004
    ///  シーホース ブラックレザー
    case ShsSLO005 = 1005
    ///  キャンバス クマノミ
    case ShsSLO006 = 1006
    ///  シーホース イエロー
    case ShsSLO007 = 1007
    ///  ベリベリホワイト
    case ShsSLO008 = 1008
    ///  ベリベリレッド
    case ShsSLO009 = 1009
    ///  ユデスパイカ
    case ShsSLO010 = 1010
    ///  レアスパイカ
    case ShsSLO011 = 1011
    ///  ボルダーシューズ タイノエ
    case ShsSLO012 = 1012
    ///  NNJグリーン
    case ShsSLO021 = 1021
    ///  ザ・ベース ルーキー
    case ShsSLO022 = 1022
    ///  クラム600 カンロ
    case ShsSLO023 = 1023
    ///  ザ・ベース ボス
    case ShsSLO024 = 1024
    ///  クラム600 コハク
    case ShsSLO025 = 1025
    ///  シーホースHi レッド
    case ShsSHI000 = 2000
    ///  シーホースHi ゾンビ
    case ShsSHI001 = 2001
    ///  キャンバスHi マッシュルーム
    case ShsSHI002 = 2002
    ///  シーホースHi パープル
    case ShsSHI003 = 2003
    ///  キャンバスHi モロヘイヤ
    case ShsSHI004 = 2004
    ///  キャンバスHi トマト
    case ShsSHI005 = 2005
    ///  シーホースHi ゴールド
    case ShsSHI006 = 2006
    ///  シャークモカシン
    case ShsSHI008 = 2008
    ///  ジョーズモカシン
    case ShsSHI009 = 2009
    ///  デカロニックチョコレート
    case ShsSHI010 = 2010
    ///  デカロニックミント
    case ShsSHI011 = 2011
    ///  オルカHi サンセット
    case ShsSHI016 = 2016
    ///  エギング4 アカクロ
    case ShsSHI017 = 2017
    ///  エギング4 アオクロ
    case ShsSHI018 = 2018
    ///  エギング5 シロアカ
    case ShsSHI025 = 2025
    ///  パワーリセットHi
    case ShsSHI042 = 2042
    ///  テンヤ8 レッド
    case ShsSHI043 = 2043
    ///  テンヤ8 パープル
    case ShsSHI044 = 2044
    ///  01STER コハク
    case ShsSHI045 = 2045
    ///  ウノアシHi
    case ShsSHI046 = 2046
    ///  カモスニーカー ドトン
    case ShsSHI047 = 2047
    ///  カモスニーカー スイトン
    case ShsSHI048 = 2048
    ///  パーチHi ホワイト
    case ShsSHI049 = 2049
    ///  01STER カンロ
    case ShsSHI052 = 2052
    ///  ピンクビーンズ
    case ShsSHT000 = 3000
    ///  オレンジアローズ
    case ShsSHT001 = 3001
    ///  ウミウシイエロー
    case ShsSHT002 = 3002
    ///  ホワイトアローズ
    case ShsSHT003 = 3003
    ///  シアンビーンズ
    case ShsSHT004 = 3004
    ///  ウミウシブルー
    case ShsSHT005 = 3005
    ///  ウミウシレッド
    case ShsSHT006 = 3006
    ///  ウミウシパープル
    case ShsSHT007 = 3007
    ///  クレイジーアローズ
    case ShsSHT008 = 3008
    ///  ブラックビーンズ
    case ShsSHT009 = 3009
    ///  アロメッシュイエロー
    case ShsSHT012 = 3012
    ///  アローズ タタキベッチュー
    case ShsSHT013 = 3013
    ///  イカサシ スクランブル
    case ShsSHT020 = 3020
    ///  グッピーフラミンゴ
    case ShsSHT021 = 3021
    ///  MOVEレッド
    case ShsSHT022 = 3022
    ///  MODZ-9
    case ShsSHT023 = 3023
    ///  シェルバシラWO
    case ShsSHT024 = 3024
    ///  フカヒレニマイバ
    case ShsSHT025 = 3025
    ///  シャコナックル
    case ShsSHT026 = 3026
    ///  オイスタークロッグ
    case ShsSDL000 = 4000
    ///  チョコクロッグ
    case ShsSDL001 = 4001
    ///  ブルーベリーコンフォート
    case ShsCFS000 = 4002
    ///  アケビコンフォート
    case ShsCFS001 = 4003
    ///  デルタストラップ ネオン
    case ShsSDL003 = 4007
    ///  BBサンダル
    case ShsSDL004 = 4008
    ///  デルタストラップ スノー
    case ShsSDL005 = 4009
    ///  デルタストラップ ルミナス
    case ShsSDL006 = 4010
    ///  ヤキフグシャワサン アカ
    case ShsSDL007 = 4011
    ///  ヤキフグシャワサン キ
    case ShsSDL008 = 4012
    ///  フィッシュボーンワラチ
    case ShsSDL010 = 4014
    ///  アローズサンダル アオキ
    case ShsSDL011 = 4015
    ///  BSサンダル
    case ShsSDL012 = 4016
    ///  べリべリサン オレンジ
    case ShsSDL013 = 4017
    ///  アローズサンダル ムラキ
    case ShsSDL014 = 4018
    ///  アナアキストラップ レザー
    case ShsSDL015 = 4019
    ///  べリべリサン マゼンタ
    case ShsSDL017 = 4021
    ///  べリべリサン シアン
    case ShsSDL018 = 4022
    ///  エゾックロッグ ネイビー
    case ShsSDL019 = 4023
    ///  エゾックロッグ レッド
    case ShsSDL020 = 4024
    ///  エゾックロッグ イエロー
    case ShsSDL021 = 4025
    ///  エゾックロッグ グリーン
    case ShsSDL022 = 4026
    ///  トレッキングライト
    case ShsTRS000 = 5000
    ///  トレッキングカスタム
    case ShsTRS001 = 5001
    ///  トレッキングプロ
    case ShsTRS002 = 5002
    ///  モトクロスブーツ
    case ShsBOT000 = 6000
    ///  ヌバックブーツ イエロー
    case ShsBOT001 = 6001
    ///  ヌバックブーツ レッド
    case ShsBOT002 = 6002
    ///  モトクロス ソリッドブルー
    case ShsBOT003 = 6003
    ///  レイニーモスグリーン
    case ShsBOT004 = 6004
    ///  レイニーアセロラ
    case ShsBOT005 = 6005
    ///  ロッキンホワイト
    case ShsBOT006 = 6006
    ///  ロッキンチェリー
    case ShsBOT007 = 6007
    ///  ロッキンイエロー
    case ShsBOT008 = 6008
    ///  レイニーシャボン
    case ShsBOT009 = 6009
    ///  ミルキーダウンブーツ
    case ShsBOT010 = 6010
    ///  アイスダウンブーツ
    case ShsBOT011 = 6011
    ///  ハンティングブーツ
    case ShsBOT012 = 6012
    ///  ロッキンブラック
    case ShsBOT013 = 6013
    ///  モトクロスM-DCB
    case ShsBOT019 = 6019
    ///  ヌバックブーツxSJ
    case ShsBOT020 = 6020
    ///  ダックブーツ スノウ
    case ShsBOT021 = 6021
    ///  カセブカブーツ レッド
    case ShsBOT023 = 6023
    ///  カセブカブーツ ダップル
    case ShsBOT024 = 6024
    ///  ロッキンピンク
    case ShsBOT025 = 6025
    ///  ウォームブーツ
    case ShsBOT026 = 6026
    ///  カモチャームブーツ
    case ShsBOT027 = 6027
    ///  スリッポン ブルー
    case ShsSLP000 = 7000
    ///  スリッポン レッド
    case ShsSLP001 = 7001
    ///  スリッポン チドリ
    case ShsSLP002 = 7002
    ///  チゴフグスリッポン
    case ShsSLP004 = 7004
    ///  ラバーソール ホワイト
    case ShsLTS000 = 8000
    ///  ラバーソール チェリー
    case ShsLTS001 = 8001
    ///  ラバーソール ターコイズ
    case ShsLTS002 = 8002
    ///  イカスミチップ
    case ShsLTS003 = 8003
    ///  イカヤキチップ
    case ShsLTS004 = 8004
    ///  イカボウズキャメル
    case ShsLTS005 = 8005
    ///  ネイビーチップ レッドソール
    case ShsLTS007 = 8007
    ///  アナアキラバー ハバネロ
    case ShsLTS010 = 8010
    ///  アナアキラバー フェイク
    case ShsLTS011 = 8011
    ///  チャッカブーツ サンド
    case ShsLTS013 = 8013
    ///  デッキシューズ フカイリ
    case ShsLTS014 = 8014
    ///  マッドラバー
    case ShsCOP101 = 21001
    ///  スクールローファー ハイソ
    case ShsAMB000 = 25000
    ///  サムライシューズ
    case ShsAMB001 = 25001
    ///  パワードレッグス
    case ShsAMB002 = 25002
    ///  キルトローファー ルーズ
    case ShsAMB003 = 25003
    ///  シノビアシ
    case ShsAMB004 = 25004
    ///  パワードレッグス オリジン
    case ShsAMB005 = 25005
    ///  ヒメイトスニーカー
    case ShsAMB006 = 25006
    ///  イイダチスリッポン
    case ShsAMB007 = 25007
    ///  エンチャントブーツ
    case ShsAMB008 = 25008
    ///  タコティカルなすねあて
    case ShsAMB009 = 25009
    ///  ひれおくんのあし
    case ShsAMB010 = 25010
    ///  イダテンヒモサン
    case ShsAMB011 = 25011
    ///  アンクルサポーター
    case ShsAMB012 = 25012
    ///  バーサークグリーブ
    case ShsAMB013 = 25013
    ///  スクールローファー スゲソ
    case ShsAMB014 = 25014
    ///  キルトローファー スゲソ
    case ShsAMB015 = 25015
    ///  ヒーローキックス レプリカ
    case ShsMSN000 = 27000
    ///  アーマーブーツ レプリカ
    case ShsMSN004 = 27004
    ///  ケタコゾネスブーツ
    case ShsMSN110 = 27110
    ///  タコ・ブーツ
    case ShsMSN200 = 27200
    ///  サバイバルフット
    case ShsMSN301 = 27301
    ///  ヒーローブーツLv1
    case ShsMSN302 = 27302
    ///  ヒーローブーツLv2
    case ShsMSN303 = 27303
    ///  ヒーローブーツLv3
    case ShsMSN304 = 27304
    ///  ヒーローブーツST
    case ShsMSN305 = 27305
    ///  ヒーローブーツ レプリカ
    case ShsMSN306 = 27306
    ///  でんせつのゾーリ
    case ShsMSN310 = 27310
    ///  AGE262
    case ShsTRG000 = 28000
}