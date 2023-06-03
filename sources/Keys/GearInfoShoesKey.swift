//
//  GearInfoShoes.swift
//
//  Created by tkgstrator on 2023/06/03
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum GearInfoShoesKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .ShsSLO000
    public var id: Int { GearInfoShoesId.allCases[GearInfoShoesKey.allCases.firstIndex(of: self) ?? 0].rawValue }

    ///  グリッチョ ブルー
    case ShsSLO000 = "0334e44e7ab88572b46878796ba20f7fd8225a801306588689a1c5f90c6583c5"
    ///  キャンバス バナナ
    case ShsSLO001 = "ae7045c813d1ba70701ba9c0b7cc3c3cf2958ab17c6d4deccfcefddcdf84e4a2"
    ///  グリッチョ グリーン 限定版
    case ShsSLO002 = "17a3c03711a943fddc9ab625d2c17bb5d96f5a3b020ed001324b9c83ab84690b"
    ///  シーホース ホワイト
    case ShsSLO003 = "9b89d24ea6359856f28611d9d72a782403b5c8dbf520df44df59a8239fadff06"
    ///  グリッチョ オレンジ
    case ShsSLO004 = "24eeba7f3c99ab5ae3be5fdcf35856cc84c4181bdf57b7d6f2c4ce342b7d2127"
    ///  シーホース ブラックレザー
    case ShsSLO005 = "0d2651f8b1afff5a729e3792aeda2ca60e3038d07ea62204da8fd78b1b40c75a"
    ///  キャンバス クマノミ
    case ShsSLO006 = "6f2305e8ceaea5c67a0ec415863d7829e8e5b87243306b5fb2e8149e5d9b13d7"
    ///  シーホース イエロー
    case ShsSLO007 = "365a59cb855546a63dcfc1267d6fc8962726ab8d59b91daf1362cc721bf4a3ca"
    ///  ベリベリホワイト
    case ShsSLO008 = "5ca4f30c0fa3c3386c06b977dca0ca81fea2a4778e6f4f264bf55562ae19f286"
    ///  ベリベリレッド
    case ShsSLO009 = "06e98adf353359e65c661824f7a2c90d731d5aa629c32c223ee5952c87e60cf8"
    ///  ユデスパイカ
    case ShsSLO010 = "546758b87b13f78375c1f4ebbd2503f9d6054abedd3d96a46bbd03b316f4d9db"
    ///  レアスパイカ
    case ShsSLO011 = "b7ee195bb4fc3e03b4c2e9b3d914b514f9029d518043174073d39a5600a02097"
    ///  ボルダーシューズ タイノエ
    case ShsSLO012 = "4f521a7bc0bd4a444ab19a9f60d623e212996c85f01324e5e0b12782facf4438"
    ///  NNJグリーン
    case ShsSLO021 = "97bd8f4a208e561606de64602a753a0f638c0f88a91f1891ce0d63b8ad221b21"
    ///  ザ・ベース ルーキー
    case ShsSLO022 = "90df16cd4b6759a018854111c461bcb71d73987b0a2132e2ddf8f9e04942667d"
    ///  クラム600 カンロ
    case ShsSLO023 = "857ef030ac8ed7d047391126ce4895df35b7f33da4a4f45897b79c97f5048344"
    ///  ザ・ベース ボス
    case ShsSLO024 = "065169c561608aeb34c7dbed8535b4aef8b752d1fad5a7fa1ba5315cac2fbfca"
    ///  クラム600 コハク
    case ShsSLO025 = "3a5c8e8603f1e72cca09017916f715b42110a600856cde046fd55d34a8242814"
    ///  シーホースHi レッド
    case ShsSHI000 = "f17cac41e8ca657ecf6775582496f6fd64b62ee19a6409c4fba74bd436165265"
    ///  シーホースHi ゾンビ
    case ShsSHI001 = "c5f15624346786166d9a6810d397c5b2c86b378e67b8c3cebffcc82c49cceddd"
    ///  キャンバスHi マッシュルーム
    case ShsSHI002 = "1cdc9d67b87c80ab3bb7c8bcc987e394a4e1ac4b05b0a9e562136e913498eddd"
    ///  シーホースHi パープル
    case ShsSHI003 = "61c1155f846388e6d63932e9a09b810009e541ab8899762f64f455a06464f170"
    ///  キャンバスHi モロヘイヤ
    case ShsSHI004 = "e884fb6ace8fcadececbb8479017f85c224ca95d663d9db497be47e3db926146"
    ///  キャンバスHi トマト
    case ShsSHI005 = "20ec2d227e6371055f4bd19e3fe082f3ca46a7ba1817edf042d0e921ad025933"
    ///  シーホースHi ゴールド
    case ShsSHI006 = "947f9cb88b43b7b51ca5798ea1a113bb846c95057096d6378e4b0bd8ac49dfd3"
    ///  シャークモカシン
    case ShsSHI008 = "f0a8d07cb7534a1622169e3d672c81fac4ef4579c904aa610ee9b1c35d653fc5"
    ///  ジョーズモカシン
    case ShsSHI009 = "86d70c19f62701d52d8c6a7ebc3d98d2e51557c1ad95f2c441f4ffd0a791422b"
    ///  デカロニックチョコレート
    case ShsSHI010 = "e6171faca0f23f68ab1c95b968f5f37ec68d0cc64f8af23fcb2bdd33592ac485"
    ///  デカロニックミント
    case ShsSHI011 = "0cec2837427c2ac483524a8a523d43156dd6879e7f8749170c158a038781d939"
    ///  オルカHi サンセット
    case ShsSHI016 = "ba7ef43e9490a6ff83a147edceb7f1bfb205b7a958e5f49e617eff5d959aafc4"
    ///  エギング4 アカクロ
    case ShsSHI017 = "ec09ef02485139471ff6a74726201af3befeccb4793da919dc7925b322b708ae"
    ///  エギング4 アオクロ
    case ShsSHI018 = "37e0a3f5e4c9b6fa50b438018bb3f8b0c8d23ed62b76dc0111aa9c3d449d7fb1"
    ///  エギング5 シロアカ
    case ShsSHI025 = "d7e5a1fb1bd98ba0bdd639fd76e4027057156d87ba7431aaf622f8a7b4b9d459"
    ///  パワーリセットHi
    case ShsSHI042 = "9708b69e95afbf7b4e536d99dcdfc74480ca309d2864419e88377d1f1d4b54ca"
    ///  テンヤ8 レッド
    case ShsSHI043 = "f7dc1f0df12bff2eb11ef16275e4c23a29705cb38baf22b19dd9c98f08df6322"
    ///  テンヤ8 パープル
    case ShsSHI044 = "b7d0c8a83488b2dc7805ad7ac3ba5360cbe1c158b9745bd143b3bd78fc27cf6f"
    ///  01STER コハク
    case ShsSHI045 = "ee9e9ed2cacf97af7c24fda40ec01254588da9aaccc2ae19f29cb73e10135b40"
    ///  ウノアシHi
    case ShsSHI046 = "bdc8b5b7cdd39cfbf79a88ae52f29bb517ec695da416498d4e190bc90046dc1f"
    ///  カモスニーカー ドトン
    case ShsSHI047 = "ce66706a90f05c4215dbc139427ea717c2d0df6c5d5d8590fcd1640de802e042"
    ///  カモスニーカー スイトン
    case ShsSHI048 = "735851dd796f4a566910cd5041d06d1f8712593f5e4b83e3c9827443c04fd5ca"
    ///  パーチHi ホワイト
    case ShsSHI049 = "d6ffd5517fb77356f22c8e0ba232ab4f2a6d6b8c3a23357fc42d308b4ee4f0cc"
    ///  01STER カンロ
    case ShsSHI052 = "c7823e1c2076f5169fb853717d46a1b9ebad36571384398efa671e2251ba446d"
    ///  ピンクビーンズ
    case ShsSHT000 = "b43d75e158e1e823531d125ea5ac97b4cf193380e711a247dd3ee0bdcdc0c0b2"
    ///  オレンジアローズ
    case ShsSHT001 = "18e0da6241e9bc512fec1bc88b23e57ba782ce6d28b8c61e02798694d85d06db"
    ///  ウミウシイエロー
    case ShsSHT002 = "9525cfe5bcd1563e578e61fccc296f8c8adaa6afc07dfd43a08d52eab25265a8"
    ///  ホワイトアローズ
    case ShsSHT003 = "b4125e7eb60cf9bb48dd90873bd617eeea934e7d4c3e0fdd59950a4ab0e2af6f"
    ///  シアンビーンズ
    case ShsSHT004 = "0abf92e6c1d06293632593614ddcc76a319883a367fd31936b0474dfc208fc6d"
    ///  ウミウシブルー
    case ShsSHT005 = "6ad1206d1c721e65ea57e6f8d0516673ffd0ce51abfdbd1f2c33a9b14e118658"
    ///  ウミウシレッド
    case ShsSHT006 = "7662dc67a50a4ba94bd292258233cbd0dcb3be59f1537a3619a4321032e4f5c6"
    ///  ウミウシパープル
    case ShsSHT007 = "77ae767d617dd506c6496c0d361cdaf9c2147bf70ee822ae110b8d7df54b2c57"
    ///  クレイジーアローズ
    case ShsSHT008 = "ff6d4ee9663a08da02b28b393fbc72e8ddd1df5a16ec7a01995887b43ef59977"
    ///  ブラックビーンズ
    case ShsSHT009 = "7cdefa422a38db9ed2c16ad747b81f0566bb9f002ef958d76210aaf575b6a6fd"
    ///  アロメッシュイエロー
    case ShsSHT012 = "42833aa8f756faa3b99760bfe77e51ac84313e5ca9c5496300e8e6fa6843cfbe"
    ///  アローズ タタキベッチュー
    case ShsSHT013 = "15de7c20ea47dd7b2b5f3ca5a42db4d1bddd529466977cd5adcfb19b04a5c8e0"
    ///  イカサシ スクランブル
    case ShsSHT020 = "0a7dbcf5844ac65ac25ed776dda8a1319a0126b352ad84dd6c4f89637c9e5f8a"
    ///  グッピーフラミンゴ
    case ShsSHT021 = "4ba5386b2e43f7326ca6c9887d9e994057a103d80db7f0157dcde5632e48310a"
    ///  MOVEレッド
    case ShsSHT022 = "dfe0e2e90b0eafc43765c24ca8ab46e514e32fd7502f5e693eace7145c717663"
    ///  MODZ-9
    case ShsSHT023 = "f564d7d291a4cdd9fe9dc36448b8ba7e21e5633e4c669ff16f97676a674bb13e"
    ///  シェルバシラWO
    case ShsSHT024 = "dbf843f9a727aed1676e3d3e803daa785b6173afa6a58bc6d7c91f2faa4465dc"
    ///  フカヒレニマイバ
    case ShsSHT025 = "44c68932d8b9c4fa428f3e6a94a6dd39826655f9a2cb02d5a2c752954eea433c"
    ///  シャコナックル
    case ShsSHT026 = "67d1f717af374cbbeae67fb8bde637d82ff0483cd0572e8ace7922f036d362bc"
    ///  オイスタークロッグ
    case ShsSDL000 = "64a885d3d257d26975c257401b17282b4ff59ac4b97cf481ac4b635c36570ab0"
    ///  チョコクロッグ
    case ShsSDL001 = "0f9140e98700713058a061ad624dc3e52eed3966a5b32752d8dc32e3ce9313dd"
    ///  ブルーベリーコンフォート
    case ShsCFS000 = "30a5feb2ea336d8d3195edc3648391f76bbf2c8b814406c55f547686bbc5b8f4"
    ///  アケビコンフォート
    case ShsCFS001 = "a1159f7ccce306ab5bc9ef247c13166782d88aaaf355916e0f4621a18b39c96f"
    ///  デルタストラップ ネオン
    case ShsSDL003 = "5da7cd547b9f5f00e86c722ce63bd246618f912836691e735de55d0de8f2c53b"
    ///  BBサンダル
    case ShsSDL004 = "9edec4490b47bae345121440172af550caaee0dcc6ab839263816bac827f8509"
    ///  デルタストラップ スノー
    case ShsSDL005 = "79c6873b8dfe1e55a856f6811a0a91348dbef5eee50e4f48a5e45bb208f8c180"
    ///  デルタストラップ ルミナス
    case ShsSDL006 = "2d5ea27149c2cefe1226b0abadb948494b3fe60f814cc88697f736008ae0ff8e"
    ///  ヤキフグシャワサン アカ
    case ShsSDL007 = "8ea2f18a72a5e28e2b790a87c1ff87bf736801316bbfac62fac82e13ab59ca4c"
    ///  ヤキフグシャワサン キ
    case ShsSDL008 = "17bc4bcd486e7ec97dc3e45a2679ff7c5e3a5f93c2b99a0407e913fb27bf0000"
    ///  フィッシュボーンワラチ
    case ShsSDL010 = "6904badfa37d1fe624bfc05a67a2f3cbef0fa898438da17105426049f4281a36"
    ///  アローズサンダル アオキ
    case ShsSDL011 = "c2a96dc18c665a7e2ad09c73f9891e9d2732ae8b04e0d0ae3f42bd4b53e22df0"
    ///  BSサンダル
    case ShsSDL012 = "66f808223dab68805ebbf9e39743c6cc5abb41e75d801fa1164ce6d67b0dc177"
    ///  べリべリサン オレンジ
    case ShsSDL013 = "fa33ba1ae5b113c21503de083f55c6c0c7499f9a1f4798001da5fa01570a1521"
    ///  アローズサンダル ムラキ
    case ShsSDL014 = "c65bc1237cb3205d6346f972807dcc85219e6afe4383a2b9fd96b46d9a29fd63"
    ///  アナアキストラップ レザー
    case ShsSDL015 = "9d6ab1a0ad42d9b71a9d5349797863f4176a15b80b8f6bf353f059ca479db56c"
    ///  べリべリサン マゼンタ
    case ShsSDL017 = "16b185ecd74bdebb4d19e7e9f9e93acca3dfae721d5baa0c5e85c94913cab128"
    ///  べリべリサン シアン
    case ShsSDL018 = "63c262fc89fa92b40972e7cdc912910f6101abe5072da1ca78ec8a12e439f88c"
    ///  エゾックロッグ ネイビー
    case ShsSDL019 = "2d248794fe5c3dd1b862dec12c2ce0480d8fa807afee178d00860abd1202bf48"
    ///  エゾックロッグ レッド
    case ShsSDL020 = "67905585266d413a296a10026573e5c13f99829a805bba061d1f2dd528f4b4a6"
    ///  エゾックロッグ イエロー
    case ShsSDL021 = "77a4c4e7dde0e09fff0892bd5b68c7ecf0269bf7b9a75573edae421c517ca815"
    ///  エゾックロッグ グリーン
    case ShsSDL022 = "277595b7cd26b121b8278abe8dba174fb1e4889618e169c0f4696449390a8830"
    ///  トレッキングライト
    case ShsTRS000 = "9893afaf18dc2ebbbfbb2f823c998ee3c75e38f93662f2f746e06f31eb675ef1"
    ///  トレッキングカスタム
    case ShsTRS001 = "987569af8d88153796c78df1cd0f640b3270dd6d07ebfac86985bd620f19f871"
    ///  トレッキングプロ
    case ShsTRS002 = "4230f946468112a5954ae9665ca1b38df1e84e1997805c2fc4aac8b5fa1f9a0b"
    ///  モトクロスブーツ
    case ShsBOT000 = "6fbfef928ff7ebda7b69a9dffb02d6dcb8c25ce85ac2d9502a2cf12f42768abd"
    ///  ヌバックブーツ イエロー
    case ShsBOT001 = "554ef898693a3d1696a194521ddaa7e8b0e77ed3e86f9fa9d1bfff74d3d04a18"
    ///  ヌバックブーツ レッド
    case ShsBOT002 = "e989fed0d8cbb87f5476a0e131e64aa5599dae48405dce7d509bed3c122837ba"
    ///  モトクロス ソリッドブルー
    case ShsBOT003 = "4e970bf2faa879df67225d9e85cbbc45f098786aa2b21d0cf71b6739be22ee74"
    ///  レイニーモスグリーン
    case ShsBOT004 = "e4328a3ea727dc9096bc37b3f06e879cebfecd0e1487102770f033c77954b745"
    ///  レイニーアセロラ
    case ShsBOT005 = "6debd8db9771298a89ce56068ad354911e7897b1d4fd75529c42b3091213996d"
    ///  ロッキンホワイト
    case ShsBOT006 = "07966cf4acacadcc07a0010825626764ba6863e0e841fb7fabc14732f0c575ba"
    ///  ロッキンチェリー
    case ShsBOT007 = "ee9e0597db8cbb7d6d4f0df9c2ad7a8fbeff9d9163756d890594e1d63c71b458"
    ///  ロッキンイエロー
    case ShsBOT008 = "93f1967022d978b4819b424f377efae822f37e6e7cb8aef691edd9cd8cf5f561"
    ///  レイニーシャボン
    case ShsBOT009 = "9b121b4f065409b4bcb62575f9a9120938176a491a8baa474be9e4abefe5552e"
    ///  ミルキーダウンブーツ
    case ShsBOT010 = "84cd1a13ca0ac91815e6470da5bfce72866180c92cabcd75fd76a26d80561d1f"
    ///  アイスダウンブーツ
    case ShsBOT011 = "8dbdd0f79c7c9be1fa331bea0f083c4e245a58c8f0e0f5c93dfc52caee0e9924"
    ///  ハンティングブーツ
    case ShsBOT012 = "b26850abe1a97aa39b6d894acbcdca098ba261b5116d598f2f47346d3d71d033"
    ///  ロッキンブラック
    case ShsBOT013 = "28580665e6f35ec40676793b26da28110bce2fe6e0a3cf58816fba1e51051700"
    ///  モトクロスM-DCB
    case ShsBOT019 = "7889bfdc4edf5b2554bef08055c3a0718d0247a566dc0a3996904fff614461a7"
    ///  ヌバックブーツxSJ
    case ShsBOT020 = "91368338dfc08c4db2edb10ad4bd3a8de46394832cb37f201292a17f638da556"
    ///  ダックブーツ スノウ
    case ShsBOT021 = "2ea26794162c79b35d50fe534bdb64f8336fb5f7e64f08fbb26cc4a82c8ae9aa"
    ///  カセブカブーツ レッド
    case ShsBOT023 = "e84e998914bc8cd803bd35f578db888a625098620934ab2cde2a642d5aaa7599"
    ///  カセブカブーツ ダップル
    case ShsBOT024 = "af3347dfb46e32e41127efb80a71c74dbfefadbf5a004509ab3700c4df5c9cc5"
    ///  ロッキンピンク
    case ShsBOT025 = "7c1531c1fb0889379e732afbbcefc58ed4f536b62a5e168347c139b95b9b651f"
    ///  ウォームブーツ
    case ShsBOT026 = "d0e3ee8ce879605cc7672f46c966f1d7dab997bedad68873382230ae0150d1b1"
    ///  カモチャームブーツ
    case ShsBOT027 = "3133ad7d9e7c12c9a3aa485a693cefeca3219a34da9252132142ef60c74227a0"
    ///  スリッポン ブルー
    case ShsSLP000 = "e4ad70d2427f180ff6121b46273192dc2dca6c9df15123760210aa6e08b88170"
    ///  スリッポン レッド
    case ShsSLP001 = "b050d1472d76a4990333ecfd457748f5d39f293bd049f8222c5e57841cae525a"
    ///  スリッポン チドリ
    case ShsSLP002 = "353c3bec6c88750d732a95932c2440df47989b65485776001159dac9b5573e93"
    ///  チゴフグスリッポン
    case ShsSLP004 = "850a72e5d09fd5ab51adca049a662b9ee6ec0d880eda14a73d4d3d200c68ffba"
    ///  ラバーソール ホワイト
    case ShsLTS000 = "04e8142cd66f2a38f31b2eb10dd88a54d8c8187efcfe2fb15aecae7906bb9b19"
    ///  ラバーソール チェリー
    case ShsLTS001 = "bb4814f8f457cb886a588210b6b1df6f00b325332443500df7ca18ce98badd76"
    ///  ラバーソール ターコイズ
    case ShsLTS002 = "d77e01f362765ffc980864b410dffebe2a6e41f2f3f457c7f31a0bd2605d3ebc"
    ///  イカスミチップ
    case ShsLTS003 = "05c55fc85bda274bdf2d0caba3dc8070f93955efde423baf3083f04dd476d7cb"
    ///  イカヤキチップ
    case ShsLTS004 = "858a487534e401fea109a0b2d5c94a66962c3a3d56ce80fb324721a4f7aba68f"
    ///  イカボウズキャメル
    case ShsLTS005 = "43a1045fa21ae4e53d638a6cfeb079b89d82d9b6ebf0ab28442deb920c888d5a"
    ///  ネイビーチップ レッドソール
    case ShsLTS007 = "208974a079935bac5a0af6b1b71e7e31d4b0b53faf5e1984b131eb13f7f12750"
    ///  アナアキラバー ハバネロ
    case ShsLTS010 = "d729bb1837a2524c17d31a5aaf3223a172fde4a79845a2b4c8e002eb3ca2ef98"
    ///  アナアキラバー フェイク
    case ShsLTS011 = "e5cf3c7996a47851a08f7fd70b47d3289478e694e591e87761c593c1c938031c"
    ///  チャッカブーツ サンド
    case ShsLTS013 = "dd4dcd9a6484a70c429e2ab31b6d4e4f0d239e6ed07f76f2693cae64d858774e"
    ///  デッキシューズ フカイリ
    case ShsLTS014 = "102edb09e6f847c5fc67212819284f71605cd7741d749cacf96761f8d4a6d43a"
    ///  マッドラバー
    case ShsCOP101 = "bbceae63665f73319b95e7fefca09167bba2c45301fc79870bb9be6200b49aaa"
    ///  スクールローファー ハイソ
    case ShsAMB000 = "71b322d39b561419e38d1f6c047976938142a0c949a29df8602dee0f3417a3b0"
    ///  サムライシューズ
    case ShsAMB001 = "4713fd6e4157736c383c0ffa199e5eebd45eb89a20fa0bf1462819c9b06bbc63"
    ///  パワードレッグス
    case ShsAMB002 = "a079d3d7d9d451de195e5c8bd64a0562bec7cda1e01741d70c196b4b3d5c6279"
    ///  キルトローファー ルーズ
    case ShsAMB003 = "058f894d426b74f8f9dc390c1e403d3f18c440d50cea63162e33762433ce75fe"
    ///  シノビアシ
    case ShsAMB004 = "43ad7037e7987489c48d4384df3dd29077981115424fbe004ab76d6dd1f3f9de"
    ///  パワードレッグス オリジン
    case ShsAMB005 = "8af57e584e42cb126297f3686a6577990aa5ff3384459ae1c48122b0c10fead2"
    ///  ヒメイトスニーカー
    case ShsAMB006 = "b734219029d5d560cfeebbbc2b12e57c70b430c7d173c8e85e1845f89866702a"
    ///  イイダチスリッポン
    case ShsAMB007 = "681ca14d49b417dd3073e85ce8c24bb456ff796b14f807e58199eb342bbbbfd4"
    ///  エンチャントブーツ
    case ShsAMB008 = "7e3e173b3e88b1b58ec193a0df9ac0a3e49736200874e964ceb9dddb308a1f98"
    ///  タコティカルなすねあて
    case ShsAMB009 = "279180568971438997a492d82ab5190baf453c51f9df98d64d37c0013cc6da34"
    ///  ひれおくんのあし
    case ShsAMB010 = "99012fe5f5886647cbda3f5684d0b7f5207c0b5d047d33c168858b1106c00be4"
    ///  イダテンヒモサン
    case ShsAMB011 = "aedc788985916999e44f3f4d7b2fb8037605c396245b3df52d78dc8ce87447a2"
    ///  アンクルサポーター
    case ShsAMB012 = "247da64e6dcc4b23205521b99507d164ed4c6d14678c835eb6e754325076d68e"
    ///  バーサークグリーブ
    case ShsAMB013 = "b46aedc61dc4a76dd3237986f84e1bdd79a98f9c415eacad379538e26f2902ec"
    ///  スクールローファー スゲソ
    case ShsAMB014 = "aa1f1bf844ec966c1a75991af78a620a8cc90a33dac9045cbeba52b4ac34d060"
    ///  キルトローファー スゲソ
    case ShsAMB015 = "2579b96d9806cfd4acedf40745a0fdcac7ce2b644ec1f5e270eaa33bea33627e"
    ///  ヒーローキックス レプリカ
    case ShsMSN000 = "41e3cf63db2c0f9efceec3ef4888714dfb11691f123baed0b3da862ac77aee08"
    ///  アーマーブーツ レプリカ
    case ShsMSN004 = "89e656b77f996285ce8e7bc2ff0657be64866022f7c048afe48304f03ba1fa2d"
    ///  ケタコゾネスブーツ
    case ShsMSN110 = "145a413c0077058e21737bff2237aa4b79efe8bec12ea78028c7dd9710ae249c"
    ///  タコ・ブーツ
    case ShsMSN200 = "30eb0c6a172341d2fefd61bca4690c827be1ec540ea693e583dc66fc34494271"
    ///  サバイバルフット
    case ShsMSN301 = "9c34f627e5a7173048e3635dec19c061bcbd6d26c0e1ba4f55073453eb2a5028"
    ///  ヒーローブーツLv1
    case ShsMSN302 = "da9a7cf90da65760c29857c79d81ec91d415c521ff1ae356d75464183ba3a69b"
    ///  ヒーローブーツLv2
    case ShsMSN303 = "513033be7c477de6e2d13aeea85a6f97244b93fdd421f2c9147a0c40088aa666"
    ///  ヒーローブーツLv3
    case ShsMSN304 = "396c277e83c5c7ac4213b3e0aa2ba506fdf413d4639690f6c52f7be0f293e64e"
    ///  ヒーローブーツST
    case ShsMSN305 = "252c1860c2ff23b551980af4742a9e0d8b22412cebfe51f124cfc24c81a7be67"
    ///  ヒーローブーツ レプリカ
    case ShsMSN306 = "a45cb8e038e107cccc6f806bffd9ffb42ebdbb369ba76c85dfbce418befaf8ac"
    ///  でんせつのゾーリ
    case ShsMSN310 = "c3bd8ffe20d6cfd10cb8cf7cee4d8b6a44327fa16a55fdb96a4b2823e8468e6d"
    ///  AGE262
    case ShsTRG000 = "336706b6149ff79afafa1ca89f5bae12f4bccf9f552730a48618d0f2a066ec66"
}