//
//  GearInfoClothes.swift
//
//  Created by tkgstrator on 2023/06/03
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum GearInfoClothesId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .CltFST001
    public var id: Int { rawValue }

    ///  わかばイカＴ
    case CltFST001 = 2
    ///  イカホワイト
    case CltTES000 = 1_000
    ///  イカノメＴ ブラック
    case CltTES001 = 1_001
    ///  イカノメＴ ライトブルー
    case CltTES003 = 1_003
    ///  ロッケンベルグＴ ホワイト
    case CltTES004 = 1_004
    ///  ロッケンベルグＴ ブラック
    case CltTES005 = 1_005
    ///  イカブラック
    case CltTES006 = 1_006
    ///  サニーオレンジＴ
    case CltTES007 = 1_007
    ///  レイニーブルーＴ
    case CltTES008 = 1_008
    ///  イカジャマイカ
    case CltTES009 = 1_009
    ///  マルフグＴ
    case CltTES010 = 1_010
    ///  ミントＴ
    case CltTES011 = 1_011
    ///  グレープＴ
    case CltTES012 = 1_012
    ///  ベクトルパターン レッド
    case CltTES013 = 1_013
    ///  ベクトルパターン グレー
    case CltTES014 = 1_014
    ///  ヤマビコＴ ブルー
    case CltTES015 = 1_015
    ///  ヤマビコＴ アイボリー
    case CltTES016 = 1_016
    ///  チドリメロンＴ
    case CltTES017 = 1_017
    ///  パイレーツボーダー
    case CltTES018 = 1_018
    ///  マリンボーダー
    case CltTES019 = 1_019
    ///  ヤキフグ8bit ホワイト
    case CltTES020 = 1_020
    ///  ヤキフグ8bit ブラック
    case CltTES021 = 1_021
    ///  ガチホワイト
    case CltTES022 = 1_022
    ///  ガチブラック
    case CltTES023 = 1_023
    ///  ニクショクＴ
    case CltTES026 = 1_026
    ///  パールドットＴ
    case CltTES027 = 1_027
    ///  タコＴ
    case CltTES028 = 1_028
    ///  ソウショクＴ
    case CltTES029 = 1_029
    ///  イカブラックV
    case CltTES030 = 1_030
    ///  イカホワイトV
    case CltTES035 = 1_035
    ///  アナアキT ポルポピック
    case CltTES047 = 1_047
    ///  ホットグラデT
    case CltTES048 = 1_048
    ///  ヤコタイダイ ギャラクシー
    case CltTES049 = 1_049
    ///  ヤコタイダイ レインボー
    case CltTES050 = 1_050
    ///  アイスグラデT
    case CltTES055 = 1_055
    ///  サキイカホワイト
    case CltTES063 = 1_062
    ///  アロメT ゴブゴブ
    case CltTES064 = 1_063
    ///  アナアキT チョーカー
    case CltTES066 = 1_066
    ///  アナアキT アシメブレス
    case CltTES067 = 1_067
    ///  リイシューT ホワイト
    case CltTES068 = 1_068
    ///  リイシューT ブルー
    case CltTES069 = 1_069
    ///  リイシューT ブラウン
    case CltTES070 = 1_070
    ///  バラズシ ノリマキ
    case CltTES071 = 1_071
    ///  バラズシT ハクマイ
    case CltTES072 = 1_072
    ///  バラズシT ゲンマイ
    case CltTES073 = 1_073
    ///  バラズシT セキハン
    case CltTES074 = 1_074
    ///  イコT ゴブゴブ
    case CltTES075 = 1_075
    ///  イカサンT
    case CltTES076 = 1_076
    ///  タコサンT
    case CltTES077 = 1_077
    ///  ヤコT ゴブゴブ
    case CltTES081 = 1_081
    ///  リンガーT パイン
    case CltTES082 = 1_082
    ///  リンガーT アップル
    case CltTES083 = 1_083
    ///  トワイライトグラデT
    case CltTES084 = 1_084
    ///  サンセットグラデT
    case CltTES085 = 1_085
    ///  ビバレッジT リコピン
    case CltTES086 = 1_086
    ///  ガブリエルT
    case CltTES088 = 1_088
    ///  スシズメブロブ ライム
    case CltTES090 = 1_090
    ///  スシズメブロブ ベリー
    case CltTES091 = 1_091
    ///  エゾッコリーT ホワイト
    case CltTES092 = 1_092
    ///  エゾッコリーT ネイビー
    case CltTES093 = 1_093
    ///  ボーダーホワイト
    case CltTEL000 = 2_000
    ///  バニーポップ ブラック
    case CltTEL001 = 2_001
    ///  カモフラパープル
    case CltTEL002 = 2_002
    ///  ボーダーネイビー
    case CltTEL003 = 2_003
    ///  エゾッコラグラン
    case CltTEL004 = 2_004
    ///  カレッジラグラン
    case CltTEL005 = 2_005
    ///  ハラグロラグラン
    case CltTEL006 = 2_006
    ///  ハラシロラグラン
    case CltTEL007 = 2_007
    ///  バトロング ホワイト
    case CltTEL008 = 2_008
    ///  ボーダーモスグリーン
    case CltTEL009 = 2_009
    ///  イカバッテンロング
    case CltTEL010 = 2_010
    ///  アイロニックロング
    case CltTEL011 = 2_011
    ///  ヤマビコボーダー
    case CltTEL012 = 2_012
    ///  アナアキロンT ドライブ
    case CltTEL015 = 2_015
    ///  カラマリフック ブラック
    case CltTEL026 = 2_026
    ///  レイヤード ホワイト
    case CltTLY000 = 3_000
    ///  マスタードガサネ
    case CltTLY001 = 3_001
    ///  カモガサネ
    case CltTLY002 = 3_002
    ///  レイヤード ブラック
    case CltTLY003 = 3_003
    ///  アイロニックレイヤード
    case CltTLY004 = 3_004
    ///  ガチガサネ
    case CltTLY005 = 3_005
    ///  チョコガサネ
    case CltTLY006 = 3_006
    ///  かくれパイレーツ
    case CltTLY007 = 3_007
    ///  ベクトルラインガサネ
    case CltTLY008 = 3_008
    ///  グリーンＴ
    case CltTLY009 = 3_009
    ///  さくらエビポロ
    case CltPLO000 = 4_000
    ///  オレンジボーダーラガー
    case CltPLO001 = 4_001
    ///  トリコロールラガー
    case CltPLO002 = 4_002
    ///  よもぎポロ
    case CltPLO003 = 4_003
    ///  ピンポンポロ
    case CltPLO004 = 4_004
    ///  テッカサイクルシャツ
    case CltPLO005 = 4_005
    ///  チャリキングジャージ
    case CltPLO006 = 4_006
    ///  FCカラスミ
    case CltPLO007 = 4_007
    ///  アオサドーレ
    case CltPLO008 = 4_008
    ///  キングラガー010
    case CltPLO009 = 4_009
    ///  キングラガー008
    case CltPLO010 = 4_010
    ///  マウンテンオリーブ
    case CltJKT000 = 5_000
    ///  ヤコナイロン ヴィンテージ
    case CltJKT001 = 5_001
    ///  マウンテンベリー
    case CltJKT002 = 5_002
    ///  スタジャンロゴマシ
    case CltJKT003 = 5_003
    ///  スクールジャージー
    case CltJKT004 = 5_004
    ///  レタード グリーン
    case CltJKT005 = 5_005
    ///  イカライダーBLACK
    case CltJKT006 = 5_006
    ///  イカライダーWHITE
    case CltJKT007 = 5_007
    ///  FCジャージー
    case CltJKT008 = 5_008
    ///  レタード オレンジ
    case CltJKT009 = 5_009
    ///  F-190
    case CltJKT010 = 5_010
    ///  F-010
    case CltJKT011 = 5_011
    ///  イカセーラー ブルー
    case CltJKT012 = 5_012
    ///  イカセーラー ホワイト
    case CltJKT013 = 5_013
    ///  イカスカジャン
    case CltJKT014 = 5_014
    ///  ウラスカジャン
    case CltJKT015 = 5_015
    ///  クラーゲス528
    case CltJKT016 = 5_016
    ///  マッチャ ライトダウン
    case CltJKT019 = 5_019
    ///  ケンサキコーチ
    case CltJKT023 = 5_023
    ///  ボンバージャケット ネガ
    case CltJKT036 = 5_036
    ///  モンスター PCU56
    case CltJKT045 = 5_045
    ///  バラズシヤッケ
    case CltJKT046 = 5_046
    ///  フィレジャケット
    case CltJKT047 = 5_047
    ///  オールウェイズファン
    case CltJKT048 = 5_048
    ///  パドリングジャケット ネガ
    case CltJKT049 = 5_049
    ///  コテボレロ ネガ
    case CltJKT050 = 5_050
    ///  オスモル アイボリー
    case CltJKT051 = 5_051
    ///  アナアキダブルジャケット
    case CltJKT053 = 5_053
    ///  ハンティングジャケットKK
    case CltJKT054 = 5_054
    ///  パドリングジャケット ポジ
    case CltJKT055 = 5_055
    ///  コテボレロ ポジ
    case CltJKT056 = 5_056
    ///  バラズシダッフル
    case CltJKT057 = 5_057
    ///  イチニンバオリ
    case CltJKT059 = 5_059
    ///  マウンテン アオサ
    case CltJKT060 = 5_060
    ///  ヤコナイロン ノスタルジア
    case CltJKT061 = 5_061
    ///  バスケジャージ ホーム
    case CltTNK000 = 6_000
    ///  バスケジャージ アウェイ
    case CltTNK001 = 6_001
    ///  キングタンク ホワイト
    case CltTNK003 = 6_003
    ///  ウミボーズ アウェイ
    case CltTNK007 = 6_007
    ///  ウミボーズ ホーム
    case CltTNK008 = 6_008
    ///  カレッジスウェット グレー
    case CltSWT000 = 7_000
    ///  イカバッテン マスタード
    case CltSWT001 = 7_001
    ///  レトロジャッジ
    case CltSWT002 = 7_002
    ///  ホッコリー ネイビー
    case CltSWT003 = 7_003
    ///  カレッジスウェット ネイビー
    case CltSWT004 = 7_004
    ///  リールロールスウェット
    case CltSWT005 = 7_005
    ///  イカリスウェット
    case CltSWT006 = 7_006
    ///  ドロップスウェット ネガ
    case CltSWT007 = 7_007
    ///  アナアキニット アオソデ
    case CltSWT010 = 7_010
    ///  エンペーサートレーナー
    case CltSWT013 = 7_013
    ///  クラマナスウェット
    case CltSWT016 = 7_016
    ///  3Dニット シャーク
    case CltSWT017 = 7_017
    ///  タコピステ ブルー
    case CltSWT018 = 7_018
    ///  3Dニット ホエール
    case CltSWT020 = 7_020
    ///  フードレスパーカー イエロー
    case CltSWT021 = 7_021
    ///  フードレスパーカー マルチ
    case CltSWT022 = 7_022
    ///  オータムネル
    case CltSHT000 = 8_000
    ///  イカスタンシャツ
    case CltSHT001 = 8_001
    ///  ギンガムチェック ミドリ
    case CltSHT002 = 8_002
    ///  シロシャツ
    case CltSHT003 = 8_003
    ///  ウーニーズBBシャツ
    case CltSHT004 = 8_004
    ///  おどるイカアロハ
    case CltSHT005 = 8_005
    ///  ギンガムチェック アカ
    case CltSHT006 = 8_006
    ///  ベイビークラゲシャツ
    case CltSHT007 = 8_007
    ///  ミスターベースボール
    case CltSHT008 = 8_008
    ///  ミックスシャツ グレー
    case CltSHT009 = 8_009
    ///  ヴィンテージチェック
    case CltSHT010 = 8_010
    ///  マルエリシャツ
    case CltSHT011 = 8_011
    ///  ロゴマシマシアロハ
    case CltSHT012 = 8_012
    ///  ブロックストライプシャツ
    case CltSHT013 = 8_013
    ///  シャンブレーシャツ
    case CltSHT014 = 8_014
    ///  タイシャツ
    case CltSHT015 = 8_015
    ///  ピーターパンクシャツ
    case CltSHT017 = 8_017
    ///  タコボウラーシャツ
    case CltSHT018 = 8_018
    ///  スミカケシャツ
    case CltSHT019 = 8_019
    ///  パラシューター ザクロ
    case CltSHT020 = 8_020
    ///  チリメンタコアロハ
    case CltSHT024 = 8_024
    ///  アナアキオンブレネル
    case CltSHT025 = 8_025
    ///  スミヌキシャツ
    case CltSHT026 = 8_026
    ///  タツノコキューバ
    case CltSHT030 = 8_030
    ///  ピエロシャツ
    case CltSHT031 = 8_031
    ///  ジャコスカウト
    case CltSHT032 = 8_032
    ///  フィレシャツ サファリ
    case CltSHT033 = 8_033
    ///  ステッチシャツ ヤガラ
    case CltSHT034 = 8_034
    ///  スミチラシシャツ
    case CltSHT036 = 8_036
    ///  バンドカラー ストライプ
    case CltSHT037 = 8_037
    ///  バンドカラー ムジ
    case CltSHT038 = 8_038
    ///  パッチワークシャツ
    case CltSHT039 = 8_039
    ///  フィレシャツ アーバン
    case CltSHT040 = 8_040
    ///  マウンテンダウン
    case CltVST000 = 9_000
    ///  フォレストダウン
    case CltVST001 = 9_001
    ///  アーバンベスト ナイト
    case CltVST002 = 9_002
    ///  アーバンベスト イエロー
    case CltVST003 = 9_003
    ///  イカゴッチンベスト
    case CltVST004 = 9_004
    ///  イカノボリベスト
    case CltVST005 = 9_005
    ///  ハンティングベストKK
    case CltVST010 = 9_010
    ///  タカアシプロテクターレッド
    case CltVST011 = 9_011
    ///  タカアシプロテクターライム
    case CltVST012 = 9_012
    ///  スミチラシベスト
    case CltVST013 = 9_013
    ///  ハンティングベストBK
    case CltVST014 = 9_014
    ///  ジップアップ カモ
    case CltPRK000 = 10_000
    ///  ジップアップ グリーン
    case CltPRK001 = 10_001
    ///  エゾッコパーカー アズキ
    case CltPRK002 = 10_002
    ///  ホタパーカー グレー
    case CltPRK006 = 10_006
    ///  バハフーディー ロホ
    case CltPRK012 = 10_012
    ///  カモパーカー ドトン
    case CltPRK013 = 10_013
    ///  バハフーディー セレステ
    case CltPRK014 = 10_014
    ///  カモパーカー スイトン
    case CltPRK015 = 10_015
    ///  バイトツナギ オレンジ
    case CltCOP001 = 20_001
    ///  バイトツナギ グリーン
    case CltCOP002 = 20_002
    ///  バイトツナギ イエロー
    case CltCOP003 = 20_003
    ///  バイトツナギ ピンク
    case CltCOP004 = 20_004
    ///  バイトツナギ ブルー
    case CltCOP005 = 20_005
    ///  バイトツナギ ブラック
    case CltCOP006 = 20_006
    ///  バイトツナギ ホワイト
    case CltCOP007 = 20_007
    ///  バイトウェーダー オレンジ
    case CltCOP008 = 20_008
    ///  バイトウェーダー ブラック
    case CltCOP009 = 20_009
    ///  バイトウェーダー イエロー
    case CltCOP010 = 20_010
    ///  バイトウェーダー ブラウン
    case CltCOP011 = 20_011
    ///  イカテンくんポロ
    case CltCOP100 = 21_000
    ///  アンカーベスト
    case CltCOP101 = 21_001
    ///  フューエルブルゾン
    case CltCOP102 = 21_002
    ///  ガーディアンズスーツ
    case CltCOP111 = 21_011
    ///  ナリキリハイテクスーツ
    case CltCOP112 = 21_012
    ///  ハイパーミライスーツ
    case CltCOP113 = 21_013
    ///  スクールブレザーL
    case CltAMB000 = 25_000
    ///  サムライジャケット
    case CltAMB001 = 25_001
    ///  パワードスーツ
    case CltAMB002 = 25_002
    ///  スクールカーデ リボン
    case CltAMB003 = 25_003
    ///  ニンジャスーツ
    case CltAMB004 = 25_004
    ///  パワードスーツ オリジン
    case CltAMB005 = 25_005
    ///  ヒメイトパーカー
    case CltAMB006 = 25_006
    ///  イイダチトップス
    case CltAMB007 = 25_007
    ///  エンチャントローブS
    case CltAMB008 = 25_008
    ///  タコティカルなよろい
    case CltAMB009 = 25_009
    ///  ひれおくんのて
    case CltAMB010 = 25_010
    ///  サキイカガクラン
    case CltAMB011 = 25_011
    ///  ジュウドウギ クロオビ
    case CltAMB012 = 25_012
    ///  バーサークアーマー
    case CltAMB013 = 25_013
    ///  スクールブレザーR
    case CltAMB014 = 25_014
    ///  スクールカーデ ネクタイ
    case CltAMB015 = 25_015
    ///  エンチャントローブL
    case CltAMB017 = 25_017
    ///  フェスＴ
    case CltHAP001 = 26_000
    ///  ヒーロージャケット レプリカ
    case CltMSN000 = 27_000
    ///  アーマージャケット レプリカ
    case CltMSN004 = 27_004
    ///  ケタコゾネスプロテクター
    case CltMSN110 = 27_110
    ///  タコ・アーマー
    case CltMSN200 = 27_200
    ///  サバイバルスーツ
    case CltMSN301 = 27_301
    ///  ヒーロースーツLv1
    case CltMSN302 = 27_302
    ///  ヒーロースーツLv2
    case CltMSN303 = 27_303
    ///  ヒーロースーツLv3
    case CltMSN304 = 27_304
    ///  ヒーロースーツST
    case CltMSN305 = 27_305
    ///  ヒーロースーツ レプリカ
    case CltMSN306 = 27_306
    ///  でんせつのマント
    case CltMSN310 = 27_310
    ///  アゲアゲコロモ
    case CltTRG000 = 28_000
}
