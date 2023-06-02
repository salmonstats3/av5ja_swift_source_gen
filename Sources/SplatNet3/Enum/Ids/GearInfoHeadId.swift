//
//  GearInfoHead.swift
//
//  Created by tkgstrator on 2023/06/03
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum GearInfoHeadId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .HedINV000
    public var id: Int { rawValue }

    ///  INVISIBLE
    case HedINV000 = 0
    ///  ヘッドバンド ホワイト
    case HedFST000 = 1
    ///  ウーニーズBBキャップ
    case HedCAP000 = 1_000
    ///  キャンプキャップ
    case HedCAP001 = 1_001
    ///  ヤコメッシュ
    case HedCAP002 = 1_002
    ///  ビバレッジキャップ
    case HedCAP003 = 1_003
    ///  チドリキャップ
    case HedCAP004 = 1_004
    ///  イカベーダーキャップ
    case HedCAP005 = 1_005
    ///  カモメッシュ
    case HedCAP006 = 1_006
    ///  5パネルキャップ
    case HedCAP007 = 1_007
    ///  エゾッコメッシュ
    case HedCAP008 = 1_008
    ///  バックワードキャップ
    case HedCAP009 = 1_009
    ///  2ラインメッシュ
    case HedCAP010 = 1_010
    ///  ジェットキャップ
    case HedCAP011 = 1_011
    ///  テッカサイクルキャップ
    case HedCAP012 = 1_012
    ///  チャリキング帽
    case HedCAP014 = 1_014
    ///  ヒッコリーワークキャップ
    case HedCAP020 = 1_020
    ///  ウールウーニーズクラシック
    case HedCAP021 = 1_021
    ///  クラゲーダーキャップ
    case HedCAP023 = 1_023
    ///  ハウスタグデニムCAP
    case HedCAP024 = 1_024
    ///  ドゥーラグキャップガサネ
    case HedCAP026 = 1_026
    ///  シェーディングキャップ スミ
    case HedCAP028 = 1_028
    ///  マリンキャップ
    case HedCAP031 = 1_031
    ///  カモキャップ ドトン
    case HedCAP034 = 1_034
    ///  カモキャップ スイトン
    case HedCAP035 = 1_035
    ///  フィッシャーマンキャップ
    case HedCAP036 = 1_036
    ///  ボンボンニット
    case HedNCP000 = 2_000
    ///  ショートビーニー
    case HedNCP001 = 2_001
    ///  ボーダービーニー
    case HedNCP002 = 2_002
    ///  ウインターボンボン
    case HedNCP003 = 2_003
    ///  モンゴウベレー
    case HedNCP004 = 2_004
    ///  イカノルディック
    case HedNCP005 = 2_005
    ///  リブニット
    case HedNCP008 = 2_008
    ///  アナアキアンピンベレー
    case HedNCP009 = 2_009
    ///  チゴフグニット
    case HedNCP013 = 2_013
    ///  クロブチ レトロ
    case HedEYE000 = 3_000
    ///  スプラッシュゴーグル
    case HedEYE001 = 3_001
    ///  パイロットゴーグル
    case HedEYE002 = 3_002
    ///  イロメガネ
    case HedEYE003 = 3_003
    ///  アローバンド ブラック
    case HedEYE004 = 3_004
    ///  ダイバーゴーグル
    case HedEYE005 = 3_005
    ///  アローバンド ホワイト
    case HedEYE006 = 3_006
    ///  ダテコンタクト
    case HedEYE007 = 3_007
    ///  タレサン18K
    case HedEYE008 = 3_008
    ///  マルベッコー
    case HedEYE009 = 3_009
    ///  オクタグラス
    case HedEYE010 = 3_010
    ///  セルブロウ
    case HedEYE011 = 3_011
    ///  ダブルエッグサングラス
    case HedEYE012 = 3_012
    ///  マルサンSV925
    case HedEYE014 = 3_014
    ///  アナアキバスクベレー
    case HedEYE015 = 3_015
    ///  スイミングモーグル
    case HedEYE016 = 3_016
    ///  モーグル タタキベッチュー
    case HedEYE018 = 3_018
    ///  デメニギスゴーグル
    case HedEYE021 = 3_021
    ///  ８ビットフレーム
    case HedEYE022 = 3_022
    ///  ワイヤーグラス
    case HedEYE023 = 3_023
    ///  サンサンサングラス
    case HedEYE024 = 3_024
    ///  フロート クリアグラス
    case HedEYE025 = 3_025
    ///  バイカーシェード
    case HedEYE026 = 3_026
    ///  アナアキスクエアグラス
    case HedEYE027 = 3_027
    ///  クラムグラス
    case HedEYE028 = 3_028
    ///  タマサンBC925
    case HedEYE029 = 3_029
    ///  メダイサングラス
    case HedEYE030 = 3_030
    ///  フトブチスクエア
    case HedEYE031 = 3_031
    ///  ロブスターブーニー
    case HedHAT000 = 4_000
    ///  サファリハット
    case HedHAT001 = 4_001
    ///  キャンプハット
    case HedHAT002 = 4_002
    ///  フグベルハット
    case HedHAT003 = 4_003
    ///  スゲ
    case HedHAT004 = 4_004
    ///  イカンカン
    case HedHAT005 = 4_005
    ///  イカンカン クラシック
    case HedHAT006 = 4_006
    ///  トレジャーメット
    case HedHAT007 = 4_007
    ///  イカバケット
    case HedHAT008 = 4_008
    ///  パラソルチューリップ
    case HedHAT010 = 4_010
    ///  カイガラスゲ
    case HedHAT012 = 4_012
    ///  ボーラークラシック
    case HedHAT015 = 4_015
    ///  ステンシルデニムハット
    case HedHAT016 = 4_016
    ///  ホタテンガロン
    case HedHAT017 = 4_017
    ///  ストローハット
    case HedHAT019 = 4_019
    ///  エゾッコリーボーラー
    case HedHAT020 = 4_020
    ///  フグベルベルベルハット
    case HedHAT021 = 4_021
    ///  スタジオヘッドホン
    case HedHDP000 = 5_000
    ///  オーロラヘッドホン
    case HedHDP001 = 5_001
    ///  イヤーマフ
    case HedHDP002 = 5_002
    ///  ステカセヘッドホン
    case HedHDP004 = 5_004
    ///  ミミタコ8
    case HedHDP007 = 5_007
    ///  甲伝導エンペラEP
    case HedHDP008 = 5_008
    ///  ミミタコ8 RAW
    case HedHDP009 = 5_009
    ///  カモヘッドホン ドトン
    case HedHDP011 = 5_011
    ///  カモヘッドホン スイトン
    case HedHDP012 = 5_012
    ///  キャディ サンバイザー
    case HedVIS000 = 6_000
    ///  ヤキフグ サンバイザー
    case HedVIS001 = 6_001
    ///  サンサンサンバイザー
    case HedVIS002 = 6_002
    ///  ヤコバイザー
    case HedVIS003 = 6_003
    ///  フェイスバイザー
    case HedVIS004 = 6_004
    ///  ロブズ・10・バイザー
    case HedVIS005 = 6_005
    ///  サイクルメット
    case HedMET000 = 7_000
    ///  ナイトビジョン
    case HedMET002 = 7_002
    ///  スケボーメット
    case HedMET004 = 7_004
    ///  バイザーメット
    case HedMET005 = 7_005
    ///  ロゴヅクシMTBメット
    case HedMET006 = 7_006
    ///  イカロスHKメット
    case HedMET007 = 7_007
    ///  オクトメットプライズデコ
    case HedMET009 = 7_009
    ///  シェルメット
    case HedMET012 = 7_012
    ///  ホーンメットBF
    case HedMET013 = 7_013
    ///  キャッチャーマスクFU
    case HedMET014 = 7_014
    ///  ヘッキャ ムジ
    case HedMET016 = 7_016
    ///  イシダイSTメット ホーム
    case HedMET018 = 7_018
    ///  チゴフグメット
    case HedMET019 = 7_019
    ///  タコマスク
    case HedMSK000 = 8_000
    ///  フェイスゴーグル
    case HedMSK001 = 8_001
    ///  エイズリーバンダナ
    case HedMSK002 = 8_002
    ///  イカスカルマスク
    case HedMSK003 = 8_003
    ///  ペインターマスク
    case HedMSK004 = 8_004
    ///  アナアキマスク
    case HedMSK005 = 8_005
    ///  キングタコスターマスク
    case HedMSK006 = 8_006
    ///  イカバッテンガード
    case HedMSK007 = 8_007
    ///  マスクドホッコリー
    case HedMSK008 = 8_008
    ///  フォーリマスク
    case HedMSK011 = 8_011
    ///  ブロブスマイルマスク
    case HedMSK014 = 8_014
    ///  エラブリースマスク
    case HedMSK015 = 8_015
    ///  トンビシールドR255
    case HedMSK016 = 8_016
    ///  トンビシールドRGB0
    case HedMSK018 = 8_018
    ///  バスケバンド
    case HedHBD001 = 9_001
    ///  スカッシュバンド
    case HedHBD002 = 9_002
    ///  テニスバンド
    case HedHBD003 = 9_003
    ///  ランニングバンド
    case HedHBD004 = 9_004
    ///  サッカーバンド
    case HedHBD005 = 9_005
    ///  ヤキフグビスケットバンダナ
    case HedHBD007 = 9_007
    ///  ピンポンバンド
    case HedHBD009 = 9_009
    ///  イカタコピアス 
    case HedACC003 = 10_003
    ///  バイトヘルメット オレンジ
    case HedCOP001 = 20_001
    ///  バイトヘルメット グリーン
    case HedCOP002 = 20_002
    ///  バイトヘルメット イエロー
    case HedCOP003 = 20_003
    ///  バイトヘルメット ピンク
    case HedCOP004 = 20_004
    ///  バイトヘルメット ブルー
    case HedCOP005 = 20_005
    ///  バイトヘルメット ブラック
    case HedCOP006 = 20_006
    ///  バイトヘルメット ホワイト
    case HedCOP007 = 20_007
    ///  バイトキャップ グリーン
    case HedCOP008 = 20_008
    ///  バイトキャップ グレー
    case HedCOP009 = 20_009
    ///  バイトキャップ ブルー
    case HedCOP010 = 20_010
    ///  バイトキャップ ブラック
    case HedCOP011 = 20_011
    ///  ヘッドライトヘルム
    case HedCOP100 = 21_000
    ///  ダストブロッカー 2.5
    case HedCOP101 = 21_001
    ///  イトヨリキャップ
    case HedCOP110 = 21_010
    ///  シカイバイザー
    case HedCOP111 = 21_011
    ///  カジカブト
    case HedCOP112 = 21_012
    ///  パイロットメット
    case HedCOP113 = 21_013
    ///  ハイテクスコープ
    case HedCOP114 = 21_014
    ///  ヒラメキブレインメット
    case HedCOP115 = 21_015
    ///  タコツボメット
    case HedCOP116 = 21_016
    ///  ガーディアンズキャップ
    case HedCOP117 = 21_017
    ///  マルミエールUD
    case HedCOP118 = 21_018
    ///  ハイパーミライヘッド
    case HedCOP119 = 21_019
    ///  イカパッチン
    case HedAMB000 = 25_000
    ///  サムライヘルメット
    case HedAMB001 = 25_001
    ///  パワードマスク
    case HedAMB002 = 25_002
    ///  イカクリップ
    case HedAMB003 = 25_003
    ///  イカカゲマスク乙
    case HedAMB004 = 25_004
    ///  パワードマスク オリジン
    case HedAMB005 = 25_005
    ///  ヒメイトクラウンS
    case HedAMB006 = 25_006
    ///  イイダチヘッドホン
    case HedAMB007 = 25_007
    ///  エンチャントハット
    case HedAMB008 = 25_008
    ///  タコティカルなヘルム
    case HedAMB009 = 25_009
    ///  ひれおくん
    case HedAMB010 = 25_010
    ///  オシャブリボーン
    case HedAMB011 = 25_011
    ///  タコハチ
    case HedAMB012 = 25_012
    ///  バーサークヘル
    case HedAMB013 = 25_013
    ///  イカカゲマスク甲
    case HedAMB016 = 25_016
    ///  ヒメイトクラウンL
    case HedAMB017 = 25_017
    ///  ヒーローヘッズ レプリカ
    case HedMSN000 = 27_000
    ///  アーマーメット レプリカ
    case HedMSN004 = 27_004
    ///  クマノミミ
    case HedMSN109 = 27_109
    ///  ケタコゾネスゴーグル
    case HedMSN110 = 27_110
    ///  ケタコゾネスゴーグルワカメ
    case HedMSN111 = 27_111
    ///  サバイバルイヤー
    case HedMSN301 = 27_301
    ///  ヒーローブレインLv1
    case HedMSN302 = 27_302
    ///  ヒーローブレインLv2
    case HedMSN303 = 27_303
    ///  ヒーローブレインLv3
    case HedMSN304 = 27_304
    ///  ヒーローブレインST
    case HedMSN305 = 27_305
    ///  ヒーローブレイン レプリカ
    case HedMSN306 = 27_306
    ///  でんせつのぼうし
    case HedMSN310 = 27_310
    ///  ロブキャップ
    case HedTRG000 = 28_000
}
