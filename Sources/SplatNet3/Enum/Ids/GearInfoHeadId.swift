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
    case HedCAP000 = 1000
    ///  キャンプキャップ
    case HedCAP001 = 1001
    ///  ヤコメッシュ
    case HedCAP002 = 1002
    ///  ビバレッジキャップ
    case HedCAP003 = 1003
    ///  チドリキャップ
    case HedCAP004 = 1004
    ///  イカベーダーキャップ
    case HedCAP005 = 1005
    ///  カモメッシュ
    case HedCAP006 = 1006
    ///  5パネルキャップ
    case HedCAP007 = 1007
    ///  エゾッコメッシュ
    case HedCAP008 = 1008
    ///  バックワードキャップ
    case HedCAP009 = 1009
    ///  2ラインメッシュ
    case HedCAP010 = 1010
    ///  ジェットキャップ
    case HedCAP011 = 1011
    ///  テッカサイクルキャップ
    case HedCAP012 = 1012
    ///  チャリキング帽
    case HedCAP014 = 1014
    ///  ヒッコリーワークキャップ
    case HedCAP020 = 1020
    ///  ウールウーニーズクラシック
    case HedCAP021 = 1021
    ///  クラゲーダーキャップ
    case HedCAP023 = 1023
    ///  ハウスタグデニムCAP
    case HedCAP024 = 1024
    ///  ドゥーラグキャップガサネ
    case HedCAP026 = 1026
    ///  シェーディングキャップ スミ
    case HedCAP028 = 1028
    ///  マリンキャップ
    case HedCAP031 = 1031
    ///  カモキャップ ドトン
    case HedCAP034 = 1034
    ///  カモキャップ スイトン
    case HedCAP035 = 1035
    ///  フィッシャーマンキャップ
    case HedCAP036 = 1036
    ///  ボンボンニット
    case HedNCP000 = 2000
    ///  ショートビーニー
    case HedNCP001 = 2001
    ///  ボーダービーニー
    case HedNCP002 = 2002
    ///  ウインターボンボン
    case HedNCP003 = 2003
    ///  モンゴウベレー
    case HedNCP004 = 2004
    ///  イカノルディック
    case HedNCP005 = 2005
    ///  リブニット
    case HedNCP008 = 2008
    ///  アナアキアンピンベレー
    case HedNCP009 = 2009
    ///  チゴフグニット
    case HedNCP013 = 2013
    ///  クロブチ レトロ
    case HedEYE000 = 3000
    ///  スプラッシュゴーグル
    case HedEYE001 = 3001
    ///  パイロットゴーグル
    case HedEYE002 = 3002
    ///  イロメガネ
    case HedEYE003 = 3003
    ///  アローバンド ブラック
    case HedEYE004 = 3004
    ///  ダイバーゴーグル
    case HedEYE005 = 3005
    ///  アローバンド ホワイト
    case HedEYE006 = 3006
    ///  ダテコンタクト
    case HedEYE007 = 3007
    ///  タレサン18K
    case HedEYE008 = 3008
    ///  マルベッコー
    case HedEYE009 = 3009
    ///  オクタグラス
    case HedEYE010 = 3010
    ///  セルブロウ
    case HedEYE011 = 3011
    ///  ダブルエッグサングラス
    case HedEYE012 = 3012
    ///  マルサンSV925
    case HedEYE014 = 3014
    ///  アナアキバスクベレー
    case HedEYE015 = 3015
    ///  スイミングモーグル
    case HedEYE016 = 3016
    ///  モーグル タタキベッチュー
    case HedEYE018 = 3018
    ///  デメニギスゴーグル
    case HedEYE021 = 3021
    ///  ８ビットフレーム
    case HedEYE022 = 3022
    ///  ワイヤーグラス
    case HedEYE023 = 3023
    ///  サンサンサングラス
    case HedEYE024 = 3024
    ///  フロート クリアグラス
    case HedEYE025 = 3025
    ///  バイカーシェード
    case HedEYE026 = 3026
    ///  アナアキスクエアグラス
    case HedEYE027 = 3027
    ///  クラムグラス
    case HedEYE028 = 3028
    ///  タマサンBC925
    case HedEYE029 = 3029
    ///  メダイサングラス
    case HedEYE030 = 3030
    ///  フトブチスクエア
    case HedEYE031 = 3031
    ///  ロブスターブーニー
    case HedHAT000 = 4000
    ///  サファリハット
    case HedHAT001 = 4001
    ///  キャンプハット
    case HedHAT002 = 4002
    ///  フグベルハット
    case HedHAT003 = 4003
    ///  スゲ
    case HedHAT004 = 4004
    ///  イカンカン
    case HedHAT005 = 4005
    ///  イカンカン クラシック
    case HedHAT006 = 4006
    ///  トレジャーメット
    case HedHAT007 = 4007
    ///  イカバケット
    case HedHAT008 = 4008
    ///  パラソルチューリップ
    case HedHAT010 = 4010
    ///  カイガラスゲ
    case HedHAT012 = 4012
    ///  ボーラークラシック
    case HedHAT015 = 4015
    ///  ステンシルデニムハット
    case HedHAT016 = 4016
    ///  ホタテンガロン
    case HedHAT017 = 4017
    ///  ストローハット
    case HedHAT019 = 4019
    ///  エゾッコリーボーラー
    case HedHAT020 = 4020
    ///  フグベルベルベルハット
    case HedHAT021 = 4021
    ///  スタジオヘッドホン
    case HedHDP000 = 5000
    ///  オーロラヘッドホン
    case HedHDP001 = 5001
    ///  イヤーマフ
    case HedHDP002 = 5002
    ///  ステカセヘッドホン
    case HedHDP004 = 5004
    ///  ミミタコ8
    case HedHDP007 = 5007
    ///  甲伝導エンペラEP
    case HedHDP008 = 5008
    ///  ミミタコ8 RAW
    case HedHDP009 = 5009
    ///  カモヘッドホン ドトン
    case HedHDP011 = 5011
    ///  カモヘッドホン スイトン
    case HedHDP012 = 5012
    ///  キャディ サンバイザー
    case HedVIS000 = 6000
    ///  ヤキフグ サンバイザー
    case HedVIS001 = 6001
    ///  サンサンサンバイザー
    case HedVIS002 = 6002
    ///  ヤコバイザー
    case HedVIS003 = 6003
    ///  フェイスバイザー
    case HedVIS004 = 6004
    ///  ロブズ・10・バイザー
    case HedVIS005 = 6005
    ///  サイクルメット
    case HedMET000 = 7000
    ///  ナイトビジョン
    case HedMET002 = 7002
    ///  スケボーメット
    case HedMET004 = 7004
    ///  バイザーメット
    case HedMET005 = 7005
    ///  ロゴヅクシMTBメット
    case HedMET006 = 7006
    ///  イカロスHKメット
    case HedMET007 = 7007
    ///  オクトメットプライズデコ
    case HedMET009 = 7009
    ///  シェルメット
    case HedMET012 = 7012
    ///  ホーンメットBF
    case HedMET013 = 7013
    ///  キャッチャーマスクFU
    case HedMET014 = 7014
    ///  ヘッキャ ムジ
    case HedMET016 = 7016
    ///  イシダイSTメット ホーム
    case HedMET018 = 7018
    ///  チゴフグメット
    case HedMET019 = 7019
    ///  タコマスク
    case HedMSK000 = 8000
    ///  フェイスゴーグル
    case HedMSK001 = 8001
    ///  エイズリーバンダナ
    case HedMSK002 = 8002
    ///  イカスカルマスク
    case HedMSK003 = 8003
    ///  ペインターマスク
    case HedMSK004 = 8004
    ///  アナアキマスク
    case HedMSK005 = 8005
    ///  キングタコスターマスク
    case HedMSK006 = 8006
    ///  イカバッテンガード
    case HedMSK007 = 8007
    ///  マスクドホッコリー
    case HedMSK008 = 8008
    ///  フォーリマスク
    case HedMSK011 = 8011
    ///  ブロブスマイルマスク
    case HedMSK014 = 8014
    ///  エラブリースマスク
    case HedMSK015 = 8015
    ///  トンビシールドR255
    case HedMSK016 = 8016
    ///  トンビシールドRGB0
    case HedMSK018 = 8018
    ///  バスケバンド
    case HedHBD001 = 9001
    ///  スカッシュバンド
    case HedHBD002 = 9002
    ///  テニスバンド
    case HedHBD003 = 9003
    ///  ランニングバンド
    case HedHBD004 = 9004
    ///  サッカーバンド
    case HedHBD005 = 9005
    ///  ヤキフグビスケットバンダナ
    case HedHBD007 = 9007
    ///  ピンポンバンド
    case HedHBD009 = 9009
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
