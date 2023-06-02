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
    case CltTES000 = 1000
    ///  イカノメＴ ブラック
    case CltTES001 = 1001
    ///  イカノメＴ ライトブルー
    case CltTES003 = 1003
    ///  ロッケンベルグＴ ホワイト
    case CltTES004 = 1004
    ///  ロッケンベルグＴ ブラック
    case CltTES005 = 1005
    ///  イカブラック
    case CltTES006 = 1006
    ///  サニーオレンジＴ
    case CltTES007 = 1007
    ///  レイニーブルーＴ
    case CltTES008 = 1008
    ///  イカジャマイカ
    case CltTES009 = 1009
    ///  マルフグＴ
    case CltTES010 = 1010
    ///  ミントＴ
    case CltTES011 = 1011
    ///  グレープＴ
    case CltTES012 = 1012
    ///  ベクトルパターン レッド
    case CltTES013 = 1013
    ///  ベクトルパターン グレー
    case CltTES014 = 1014
    ///  ヤマビコＴ ブルー
    case CltTES015 = 1015
    ///  ヤマビコＴ アイボリー
    case CltTES016 = 1016
    ///  チドリメロンＴ
    case CltTES017 = 1017
    ///  パイレーツボーダー
    case CltTES018 = 1018
    ///  マリンボーダー
    case CltTES019 = 1019
    ///  ヤキフグ8bit ホワイト
    case CltTES020 = 1020
    ///  ヤキフグ8bit ブラック
    case CltTES021 = 1021
    ///  ガチホワイト
    case CltTES022 = 1022
    ///  ガチブラック
    case CltTES023 = 1023
    ///  ニクショクＴ
    case CltTES026 = 1026
    ///  パールドットＴ
    case CltTES027 = 1027
    ///  タコＴ
    case CltTES028 = 1028
    ///  ソウショクＴ
    case CltTES029 = 1029
    ///  イカブラックV
    case CltTES030 = 1030
    ///  イカホワイトV
    case CltTES035 = 1035
    ///  アナアキT ポルポピック
    case CltTES047 = 1047
    ///  ホットグラデT
    case CltTES048 = 1048
    ///  ヤコタイダイ ギャラクシー
    case CltTES049 = 1049
    ///  ヤコタイダイ レインボー
    case CltTES050 = 1050
    ///  アイスグラデT
    case CltTES055 = 1055
    ///  サキイカホワイト
    case CltTES063 = 1062
    ///  アロメT ゴブゴブ
    case CltTES064 = 1063
    ///  アナアキT チョーカー
    case CltTES066 = 1066
    ///  アナアキT アシメブレス
    case CltTES067 = 1067
    ///  リイシューT ホワイト
    case CltTES068 = 1068
    ///  リイシューT ブルー
    case CltTES069 = 1069
    ///  リイシューT ブラウン
    case CltTES070 = 1070
    ///  バラズシ ノリマキ
    case CltTES071 = 1071
    ///  バラズシT ハクマイ
    case CltTES072 = 1072
    ///  バラズシT ゲンマイ
    case CltTES073 = 1073
    ///  バラズシT セキハン
    case CltTES074 = 1074
    ///  イコT ゴブゴブ
    case CltTES075 = 1075
    ///  イカサンT
    case CltTES076 = 1076
    ///  タコサンT
    case CltTES077 = 1077
    ///  ヤコT ゴブゴブ
    case CltTES081 = 1081
    ///  リンガーT パイン
    case CltTES082 = 1082
    ///  リンガーT アップル
    case CltTES083 = 1083
    ///  トワイライトグラデT
    case CltTES084 = 1084
    ///  サンセットグラデT
    case CltTES085 = 1085
    ///  ビバレッジT リコピン
    case CltTES086 = 1086
    ///  ガブリエルT
    case CltTES088 = 1088
    ///  スシズメブロブ ライム
    case CltTES090 = 1090
    ///  スシズメブロブ ベリー
    case CltTES091 = 1091
    ///  エゾッコリーT ホワイト
    case CltTES092 = 1092
    ///  エゾッコリーT ネイビー
    case CltTES093 = 1093
    ///  ボーダーホワイト
    case CltTEL000 = 2000
    ///  バニーポップ ブラック
    case CltTEL001 = 2001
    ///  カモフラパープル
    case CltTEL002 = 2002
    ///  ボーダーネイビー
    case CltTEL003 = 2003
    ///  エゾッコラグラン
    case CltTEL004 = 2004
    ///  カレッジラグラン
    case CltTEL005 = 2005
    ///  ハラグロラグラン
    case CltTEL006 = 2006
    ///  ハラシロラグラン
    case CltTEL007 = 2007
    ///  バトロング ホワイト
    case CltTEL008 = 2008
    ///  ボーダーモスグリーン
    case CltTEL009 = 2009
    ///  イカバッテンロング
    case CltTEL010 = 2010
    ///  アイロニックロング
    case CltTEL011 = 2011
    ///  ヤマビコボーダー
    case CltTEL012 = 2012
    ///  アナアキロンT ドライブ
    case CltTEL015 = 2015
    ///  カラマリフック ブラック
    case CltTEL026 = 2026
    ///  レイヤード ホワイト
    case CltTLY000 = 3000
    ///  マスタードガサネ
    case CltTLY001 = 3001
    ///  カモガサネ
    case CltTLY002 = 3002
    ///  レイヤード ブラック
    case CltTLY003 = 3003
    ///  アイロニックレイヤード
    case CltTLY004 = 3004
    ///  ガチガサネ
    case CltTLY005 = 3005
    ///  チョコガサネ
    case CltTLY006 = 3006
    ///  かくれパイレーツ
    case CltTLY007 = 3007
    ///  ベクトルラインガサネ
    case CltTLY008 = 3008
    ///  グリーンＴ
    case CltTLY009 = 3009
    ///  さくらエビポロ
    case CltPLO000 = 4000
    ///  オレンジボーダーラガー
    case CltPLO001 = 4001
    ///  トリコロールラガー
    case CltPLO002 = 4002
    ///  よもぎポロ
    case CltPLO003 = 4003
    ///  ピンポンポロ
    case CltPLO004 = 4004
    ///  テッカサイクルシャツ
    case CltPLO005 = 4005
    ///  チャリキングジャージ
    case CltPLO006 = 4006
    ///  FCカラスミ
    case CltPLO007 = 4007
    ///  アオサドーレ
    case CltPLO008 = 4008
    ///  キングラガー010
    case CltPLO009 = 4009
    ///  キングラガー008
    case CltPLO010 = 4010
    ///  マウンテンオリーブ
    case CltJKT000 = 5000
    ///  ヤコナイロン ヴィンテージ
    case CltJKT001 = 5001
    ///  マウンテンベリー
    case CltJKT002 = 5002
    ///  スタジャンロゴマシ
    case CltJKT003 = 5003
    ///  スクールジャージー
    case CltJKT004 = 5004
    ///  レタード グリーン
    case CltJKT005 = 5005
    ///  イカライダーBLACK
    case CltJKT006 = 5006
    ///  イカライダーWHITE
    case CltJKT007 = 5007
    ///  FCジャージー
    case CltJKT008 = 5008
    ///  レタード オレンジ
    case CltJKT009 = 5009
    ///  F-190
    case CltJKT010 = 5010
    ///  F-010
    case CltJKT011 = 5011
    ///  イカセーラー ブルー
    case CltJKT012 = 5012
    ///  イカセーラー ホワイト
    case CltJKT013 = 5013
    ///  イカスカジャン
    case CltJKT014 = 5014
    ///  ウラスカジャン
    case CltJKT015 = 5015
    ///  クラーゲス528
    case CltJKT016 = 5016
    ///  マッチャ ライトダウン
    case CltJKT019 = 5019
    ///  ケンサキコーチ
    case CltJKT023 = 5023
    ///  ボンバージャケット ネガ
    case CltJKT036 = 5036
    ///  モンスター PCU56
    case CltJKT045 = 5045
    ///  バラズシヤッケ
    case CltJKT046 = 5046
    ///  フィレジャケット
    case CltJKT047 = 5047
    ///  オールウェイズファン
    case CltJKT048 = 5048
    ///  パドリングジャケット ネガ
    case CltJKT049 = 5049
    ///  コテボレロ ネガ
    case CltJKT050 = 5050
    ///  オスモル アイボリー
    case CltJKT051 = 5051
    ///  アナアキダブルジャケット
    case CltJKT053 = 5053
    ///  ハンティングジャケットKK
    case CltJKT054 = 5054
    ///  パドリングジャケット ポジ
    case CltJKT055 = 5055
    ///  コテボレロ ポジ
    case CltJKT056 = 5056
    ///  バラズシダッフル
    case CltJKT057 = 5057
    ///  イチニンバオリ
    case CltJKT059 = 5059
    ///  マウンテン アオサ
    case CltJKT060 = 5060
    ///  ヤコナイロン ノスタルジア
    case CltJKT061 = 5061
    ///  バスケジャージ ホーム
    case CltTNK000 = 6000
    ///  バスケジャージ アウェイ
    case CltTNK001 = 6001
    ///  キングタンク ホワイト
    case CltTNK003 = 6003
    ///  ウミボーズ アウェイ
    case CltTNK007 = 6007
    ///  ウミボーズ ホーム
    case CltTNK008 = 6008
    ///  カレッジスウェット グレー
    case CltSWT000 = 7000
    ///  イカバッテン マスタード
    case CltSWT001 = 7001
    ///  レトロジャッジ
    case CltSWT002 = 7002
    ///  ホッコリー ネイビー
    case CltSWT003 = 7003
    ///  カレッジスウェット ネイビー
    case CltSWT004 = 7004
    ///  リールロールスウェット
    case CltSWT005 = 7005
    ///  イカリスウェット
    case CltSWT006 = 7006
    ///  ドロップスウェット ネガ
    case CltSWT007 = 7007
    ///  アナアキニット アオソデ
    case CltSWT010 = 7010
    ///  エンペーサートレーナー
    case CltSWT013 = 7013
    ///  クラマナスウェット
    case CltSWT016 = 7016
    ///  3Dニット シャーク
    case CltSWT017 = 7017
    ///  タコピステ ブルー
    case CltSWT018 = 7018
    ///  3Dニット ホエール
    case CltSWT020 = 7020
    ///  フードレスパーカー イエロー
    case CltSWT021 = 7021
    ///  フードレスパーカー マルチ
    case CltSWT022 = 7022
    ///  オータムネル
    case CltSHT000 = 8000
    ///  イカスタンシャツ
    case CltSHT001 = 8001
    ///  ギンガムチェック ミドリ
    case CltSHT002 = 8002
    ///  シロシャツ
    case CltSHT003 = 8003
    ///  ウーニーズBBシャツ
    case CltSHT004 = 8004
    ///  おどるイカアロハ
    case CltSHT005 = 8005
    ///  ギンガムチェック アカ
    case CltSHT006 = 8006
    ///  ベイビークラゲシャツ
    case CltSHT007 = 8007
    ///  ミスターベースボール
    case CltSHT008 = 8008
    ///  ミックスシャツ グレー
    case CltSHT009 = 8009
    ///  ヴィンテージチェック
    case CltSHT010 = 8010
    ///  マルエリシャツ
    case CltSHT011 = 8011
    ///  ロゴマシマシアロハ
    case CltSHT012 = 8012
    ///  ブロックストライプシャツ
    case CltSHT013 = 8013
    ///  シャンブレーシャツ
    case CltSHT014 = 8014
    ///  タイシャツ
    case CltSHT015 = 8015
    ///  ピーターパンクシャツ
    case CltSHT017 = 8017
    ///  タコボウラーシャツ
    case CltSHT018 = 8018
    ///  スミカケシャツ
    case CltSHT019 = 8019
    ///  パラシューター ザクロ
    case CltSHT020 = 8020
    ///  チリメンタコアロハ
    case CltSHT024 = 8024
    ///  アナアキオンブレネル
    case CltSHT025 = 8025
    ///  スミヌキシャツ
    case CltSHT026 = 8026
    ///  タツノコキューバ
    case CltSHT030 = 8030
    ///  ピエロシャツ
    case CltSHT031 = 8031
    ///  ジャコスカウト
    case CltSHT032 = 8032
    ///  フィレシャツ サファリ
    case CltSHT033 = 8033
    ///  ステッチシャツ ヤガラ
    case CltSHT034 = 8034
    ///  スミチラシシャツ
    case CltSHT036 = 8036
    ///  バンドカラー ストライプ
    case CltSHT037 = 8037
    ///  バンドカラー ムジ
    case CltSHT038 = 8038
    ///  パッチワークシャツ
    case CltSHT039 = 8039
    ///  フィレシャツ アーバン
    case CltSHT040 = 8040
    ///  マウンテンダウン
    case CltVST000 = 9000
    ///  フォレストダウン
    case CltVST001 = 9001
    ///  アーバンベスト ナイト
    case CltVST002 = 9002
    ///  アーバンベスト イエロー
    case CltVST003 = 9003
    ///  イカゴッチンベスト
    case CltVST004 = 9004
    ///  イカノボリベスト
    case CltVST005 = 9005
    ///  ハンティングベストKK
    case CltVST010 = 9010
    ///  タカアシプロテクターレッド
    case CltVST011 = 9011
    ///  タカアシプロテクターライム
    case CltVST012 = 9012
    ///  スミチラシベスト
    case CltVST013 = 9013
    ///  ハンティングベストBK
    case CltVST014 = 9014
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
