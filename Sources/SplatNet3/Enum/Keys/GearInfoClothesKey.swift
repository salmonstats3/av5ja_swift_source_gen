//
//  GearInfoClothes.swift
//
//  Created by tkgstrator on 2023/06/02
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum GearInfoClothesKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .CltFST001
    public var id: Int { GearInfoClothesId.allCases[GearInfoClothesKey.allCases.firstIndex(of: self) ?? 0].rawValue }

    ///  わかばイカＴ
    case CltFST001 = "91a4565d1f7750fe92a2bcfa3113a66ba29c60666a1d54bfca0a29e6285cea09"
    ///  イカホワイト
    case CltTES000 = "f74a97fb4335b6a7ed0c7eb12e4cd07b5a189eb0d42a41008183af096b4afc31"
    ///  イカノメＴ ブラック
    case CltTES001 = "d5916b4916b3c9d21d76f64c11c3a65bfc37c9871abb46da0b2aae9ade7b57cb"
    ///  イカノメＴ ライトブルー
    case CltTES003 = "6faf249f56cb5f62c4a633826c1f40f972b9cdc08dcd64c0cdca8be40a804aa8"
    ///  ロッケンベルグＴ ホワイト
    case CltTES004 = "d248eeac8cc9dd8e9a5f249c69905e3a7063795e5478095ed5859a4372c7f501"
    ///  ロッケンベルグＴ ブラック
    case CltTES005 = "d0c4680c8f6ec8cd0ce9577da6074cb7349e813e37e49136e97c1fc59908fa30"
    ///  イカブラック
    case CltTES006 = "a5483854ac79c485a9969bad68631c332cfa73d0e5a9f05c74e8afc3d4cdd7cf"
    ///  サニーオレンジＴ
    case CltTES007 = "2c4915743cbffdd076b0cb4a0135678ee777bab1b79af0e1275ff02123a15f86"
    ///  レイニーブルーＴ
    case CltTES008 = "6742241747a5531bb5cad0394f260fa31f051cb4ef998ee2efa0810937f4ab55"
    ///  イカジャマイカ
    case CltTES009 = "690f06e8bad35ba1eded49b85d1f937354674f03713f8f8d533ff5079a3c2ef6"
    ///  マルフグＴ
    case CltTES010 = "ae5a9ed9923d3e812fefc4d528cdcd69fdc5c0f515b45c90ce5eac62cbce575f"
    ///  ミントＴ
    case CltTES011 = "bf76e9183855864589b775b8a80f90f5140495f0df7560125a3a92dfb0277deb"
    ///  グレープＴ
    case CltTES012 = "5285025755fcab65ca6d942d18bdbb1d4eea8c236b3f899a0994e004ff44b783"
    ///  ベクトルパターン レッド
    case CltTES013 = "dcf7d5495ecd110d963eaaad94c85f48176e5032d08424c25eab6c0050bbd9dc"
    ///  ベクトルパターン グレー
    case CltTES014 = "d7444942028a869d302476a7c92cd2dffca41486a39ee40b3dce0a5850a150c4"
    ///  ヤマビコＴ ブルー
    case CltTES015 = "51ea4d01a7c479c7e78619227067cf18f08b4871c17c3b24671881964a56d73f"
    ///  ヤマビコＴ アイボリー
    case CltTES016 = "6456162f608e445ba0914da7b91ffb505b8dad103375384e7f20449d719eaac1"
    ///  チドリメロンＴ
    case CltTES017 = "22df11e3f12926d16c2d17d73b86fe260e126f3df4a45ef453153d37c4212deb"
    ///  パイレーツボーダー
    case CltTES018 = "7dec56c0cf8d0d86419cc98a50d11ad796e9ea5b9d4ac40600915d53d161b1b5"
    ///  マリンボーダー
    case CltTES019 = "a9c8774bf777dda1ec8cdecbbd82ca5465a158fddff350e44edfd7eee6317f44"
    ///  ヤキフグ8bit ホワイト
    case CltTES020 = "0ebc7b54299e1f269f6581ed0783e76249e69b542dbb33ac1e23773e4472c5c8"
    ///  ヤキフグ8bit ブラック
    case CltTES021 = "b5d92a7811644e6096cde8bef58509cdc192903d66e756cf7069e5cc07fa0bd5"
    ///  ガチホワイト
    case CltTES022 = "e5175d8e260c7be5e0a80d3367254e25e076f9858af7acdf840f3969f4d6ea3d"
    ///  ガチブラック
    case CltTES023 = "c9ecbbece4c821ae558df49a434100fab0271559850453d87f5d7e4374af594e"
    ///  ニクショクＴ
    case CltTES026 = "4aa79eb78cd9c6a96d0d05ac6bed48e8ab2fd1afe84d93113e4d54917ecc8243"
    ///  パールドットＴ
    case CltTES027 = "5071451f92eb002335abb3d4ef249759fd1affa01c59b7f41173bb4bc6448b95"
    ///  タコＴ
    case CltTES028 = "0697978f016e31be224faaade37b9cf36f23c5bb0e0c312fc373c354f67f02ba"
    ///  ソウショクＴ
    case CltTES029 = "ed046882681c3d7a5fad01096277d81b32e0b46b72b44005eab833ce1584f899"
    ///  イカブラックV
    case CltTES030 = "3828b051c6caa440485ab83b4df3ad236f24699f41e08071953a7d4c8da4d621"
    ///  イカホワイトV
    case CltTES035 = "f932b065ab915dd0d3c556f7e0c0b88be1e7b5133bcd2dd9c7890eee3cdc2a01"
    ///  アナアキT ポルポピック
    case CltTES047 = "f452292a49fbcf416e94e7542775b6f3e83e3cbf2c0719f8ba49740dca2fe198"
    ///  ホットグラデT
    case CltTES048 = "e2247403936057070ab67b1f721f9acb70291a66f59c929dc67f4df320500421"
    ///  ヤコタイダイ ギャラクシー
    case CltTES049 = "0db820dcd7bdcbde53292223684fc1212e922485f2972b6db6414f7776b38baf"
    ///  ヤコタイダイ レインボー
    case CltTES050 = "d10ad3cc9da86adf76eb3d4058096110c0b14dbe82a74e05ea1117b56529e372"
    ///  アイスグラデT
    case CltTES055 = "2685fa3b7898a4ca5c15fe6122666d10b6ab23194afa7b9a9d52fe0dcfa11de8"
    ///  サキイカホワイト
    case CltTES063 = "95e3566019022d54ebb764b7d9221721465937c21217a3aa2e33667c3a9e532a"
    ///  アロメT ゴブゴブ
    case CltTES064 = "1b2ac6fae1f884a5ebcc459b30f2faf9a95d4eacb5869b1d3aafe6a32bb5cb84"
    ///  アナアキT チョーカー
    case CltTES066 = "b0d33c29c814f9d6c21a8d821e3063154acabcfdf5b2cb33000da9080d843660"
    ///  アナアキT アシメブレス
    case CltTES067 = "9595fffd2e1c4d80ee0ebdea74987ac561a2f9804419fbcd25f64408b0186a28"
    ///  リイシューT ホワイト
    case CltTES068 = "0224c0ce50add41930ccd1c10ab18f15429e1f062badb3ce4f61d00e75427885"
    ///  リイシューT ブルー
    case CltTES069 = "9b7eaa7a9e3b8bf0d2ca9be1dc28fec0763bf45f16ec5377b91bf8e85ba52ce0"
    ///  リイシューT ブラウン
    case CltTES070 = "297b2362ea85cf0ab7a3aabe2c2643139c66827ff74d000a346204c6eacfba62"
    ///  バラズシ ノリマキ
    case CltTES071 = "ef70c91fe43b4ccc9e129cd5fa31c6cd76f391e652570ed6a1d91c9452c71890"
    ///  バラズシT ハクマイ
    case CltTES072 = "b0744ee33f5ca70fdaddae3b506777104a69417f890feee64d683875c5c3700b"
    ///  バラズシT ゲンマイ
    case CltTES073 = "76c0d1fa3f9b95befd8baa75d983d2f7b920ba673ada15325e345dc337335914"
    ///  バラズシT セキハン
    case CltTES074 = "07801ef4d545081e16d4cb03920d1e1792fdc8fd3ad5511a12bdb8bbdbbb5c1a"
    ///  イコT ゴブゴブ
    case CltTES075 = "83b4127e479dc98755a9a715839c65a0aeb682ba72fffa26e3166c49da234fd4"
    ///  イカサンT
    case CltTES076 = "bcfb78c37e8dcc642bd578bd1ca2a5bebf68ee2586f94598380792c206e1429d"
    ///  タコサンT
    case CltTES077 = "203f2d96ae136516a9976a832a761599c30038d0af777a42ad15c46cc3e35a16"
    ///  ヤコT ゴブゴブ
    case CltTES081 = "abd68b62a8e9aa1d113636bf7c24392e87c2494597b92f8f66b174da75373dc1"
    ///  リンガーT パイン
    case CltTES082 = "e25c645ab498be34a9ddbf64cf21746f3493dd178223d8ec59893df82c3a4f62"
    ///  リンガーT アップル
    case CltTES083 = "f878d1f7b82a4568f397425f6a72674d7ab842206c7c85d61c92ec182dfe8395"
    ///  トワイライトグラデT
    case CltTES084 = "0559e5c118a161ec5474f72cd521fb43957c9c9c559f3f2d70c667c4fbaaed34"
    ///  サンセットグラデT
    case CltTES085 = "981b0984e92b5de13a12f8fe8d2edef120151b97178a5efc6a988cf033387245"
    ///  ビバレッジT リコピン
    case CltTES086 = "5791e3b755b342c101e31785b082dc8a8a963f70fda382eb8e0bdf0e0a11f36a"
    ///  ガブリエルT
    case CltTES088 = "86476d2ba710aded235e44dcc0ea9b264389c7b2b939e332c8e962b19aa5c71b"
    ///  スシズメブロブ ライム
    case CltTES090 = "48e54370dd9a97f01c039e2d94a25d6b91f6e0203996b3e13833be075b079350"
    ///  スシズメブロブ ベリー
    case CltTES091 = "9f454053136363353273de44cae283a68e10f77504a4fe671a9a9e6e56f8a9a4"
    ///  エゾッコリーT ホワイト
    case CltTES092 = "d8970134d2d5435610a484c2dcea1596ad7b0bf002072db3ae95a397bb636ba3"
    ///  エゾッコリーT ネイビー
    case CltTES093 = "a604771fcf983997dc4fdda3f759b61be82133e3844632f214844d0aaac6468a"
    ///  ボーダーホワイト
    case CltTEL000 = "623e7502ef2644e2b1af7cb57b3e6e49d2602cb40a5400ebbbcb6f1137689e5f"
    ///  バニーポップ ブラック
    case CltTEL001 = "2953269b38134e157f6e2366b1ee4442c62495e5f464f70ab8ed5b6d1199b4b9"
    ///  カモフラパープル
    case CltTEL002 = "1311dc72ccd1048bca94bcec78330a3dbbca4ae3981a68fa2729ae5c1aa77ea4"
    ///  ボーダーネイビー
    case CltTEL003 = "f25d4f3350884f3fba8c2499d1e2f702493d9f356a8c5783a595c2ba4fd0eea1"
    ///  エゾッコラグラン
    case CltTEL004 = "8919717e902d219e78e20cb08a56de015b63532720d9bc2e845466621d0eb265"
    ///  カレッジラグラン
    case CltTEL005 = "eaa6cc8e878e4fe02e60f9f93e2c710ae4997f8998ff12d4801b56d7ad251146"
    ///  ハラグロラグラン
    case CltTEL006 = "7aeb34db1de44a9751dd8705ee088ff5c3d8e1ccdebec4aaf01a1373ac23188e"
    ///  ハラシロラグラン
    case CltTEL007 = "67a31b31717a32d678e2008a76b3d639eb0a4ee4d9d282c00a0676b7e6765590"
    ///  バトロング ホワイト
    case CltTEL008 = "542099253456a4333cfbd9dccc5b0d270fa8a86ed51310ef4af14d04a22237cc"
    ///  ボーダーモスグリーン
    case CltTEL009 = "1b58fe4b056d4abec3e6831588a64c093d222f4dc68af19b28beafce3a3d5bde"
    ///  イカバッテンロング
    case CltTEL010 = "83a1435c61466b0c263d1f5336b8ab9f84e44475e9877318b69fcc9daf7a2017"
    ///  アイロニックロング
    case CltTEL011 = "319f23207fa3254f2c730bbd70d43b95c4cf2b1f75c7c1142ea370be960ab21c"
    ///  ヤマビコボーダー
    case CltTEL012 = "440a359daebb4cb4aab87f9e26d8f4cf4735ea3b801a9f24969f85a62888487a"
    ///  アナアキロンT ドライブ
    case CltTEL015 = "cadfa74dcc4d39156bf483656aa64d2e1188c5c99b6bb680a72636f13a9626da"
    ///  カラマリフック ブラック
    case CltTEL026 = "b1ad6478e53eaa75ddf3940c88c806ccc3da0f8d71332cc1dbb706e2c83de7e0"
    ///  レイヤード ホワイト
    case CltTLY000 = "4bb2d9ef221ebfcc63f7b13751dd2cc4a31eaaf1b3b99f30eed814673a0e5d46"
    ///  マスタードガサネ
    case CltTLY001 = "df3c215c16aaf23e7c30347a7c8d93e110fa9827e1b4fbc882bef83aa2e0c202"
    ///  カモガサネ
    case CltTLY002 = "6de226c4a766ee0001563cf79602f51767155c5fa056c4f55b04c05d14ddc901"
    ///  レイヤード ブラック
    case CltTLY003 = "22de7ea9593d1d39e4305141724eba11ebf40180d37ca707502fa0b3924bf04b"
    ///  アイロニックレイヤード
    case CltTLY004 = "0dea2bf5d28210a5ec8d93b9553607f2a94f92b7bd686d1eebc72f9c73b87556"
    ///  ガチガサネ
    case CltTLY005 = "ea279223a33ccce211ddd63627bb9d4860a1731eb9eddedaecf852f34f10146f"
    ///  チョコガサネ
    case CltTLY006 = "d459c16ed3e12dd3e3427bc651cc5ca05f0e7f60849b61c40c44b20dcce9646f"
    ///  かくれパイレーツ
    case CltTLY007 = "f5e5ce5e213b8568bdc9a5c84be895b685f0209f6a6614cdd2380a9f5d72da50"
    ///  ベクトルラインガサネ
    case CltTLY008 = "b4021bdebee21dde1e5bb23f2f0208ad1a4376674b96569bf9556f444f6ed1e0"
    ///  グリーンＴ
    case CltTLY009 = "b0e4641609d0ea08cd656035a8374bfc387e521b56daae80d61e30445f04eeb9"
    ///  さくらエビポロ
    case CltPLO000 = "76c7025ad3da0a54d6eb773c7a9abdadbbaebd496d79ed687fd7e245b7edfcc8"
    ///  オレンジボーダーラガー
    case CltPLO001 = "75930f47334ff2008db6bc51c368b7e7afce0551e9d9903744256cd0eeb17f0b"
    ///  トリコロールラガー
    case CltPLO002 = "2ffd044cb843ed50c8c1541bcafa82f3c1737090da68589a956ec590244d7110"
    ///  よもぎポロ
    case CltPLO003 = "2afefccbd2a7e6c1bfb430f9ff813ac8f37124618605c823404ab55202c60407"
    ///  ピンポンポロ
    case CltPLO004 = "3518171a2249d21477fc492e5fc1662677530d7640a2af3d190b2a6f6168555d"
    ///  テッカサイクルシャツ
    case CltPLO005 = "6a6b93519f21b5b779cd30af9cabf51442c2ad212b9e0c5fcce90f3885e7879b"
    ///  チャリキングジャージ
    case CltPLO006 = "ff38a9a3a61fd2842afaf18d4463f3bc966eff13d2a8a8be4d55591c0054461f"
    ///  FCカラスミ
    case CltPLO007 = "ff7e78a78354cf514cb6c8e3205943dedb8cd9a8d688f80082df0082dba2ff12"
    ///  アオサドーレ
    case CltPLO008 = "c5340ff8adda1123a0055bfaab6b27ad6558ed8e99f21dbb2e213339301ab51b"
    ///  キングラガー010
    case CltPLO009 = "6bc4e669c906902d7e0da0168d61018b7c3e4ff65baa659c07f20c5077dd2087"
    ///  キングラガー008
    case CltPLO010 = "faa679a1cb88dc61aa739be96d65846bd51fda65717b0a0c92b6113c070a16d2"
    ///  マウンテンオリーブ
    case CltJKT000 = "9a5befa120274f86a7eb5539a90087d3a5e70382a13e099c0c699a33859fb925"
    ///  ヤコナイロン ヴィンテージ
    case CltJKT001 = "2bd6b16e0f4b00c2fa3470e35342137a8cc420df03ffc9ee9ff4eea94faac06f"
    ///  マウンテンベリー
    case CltJKT002 = "dd9cd3ebbb2e0a5c6c65b8c16b56b35f019b3e913a88452deea00c97d291668b"
    ///  スタジャンロゴマシ
    case CltJKT003 = "1aecede8cbfe89866af6b643df4c40446d21c4030ec7159493f46d304e4afc9e"
    ///  スクールジャージー
    case CltJKT004 = "e98f791c877336b75ff1ffefdcc75a5c127e4e42f6f5b302c884fc9f9666f689"
    ///  レタード グリーン
    case CltJKT005 = "c598767e7ebb950707258e93760d4b3e424592df6e8821fce779b36bacbc3bcd"
    ///  イカライダーBLACK
    case CltJKT006 = "a7bc7d902c2d27cadbb9a3d898a7e714ece83e8087b38613344525cf58d8dd83"
    ///  イカライダーWHITE
    case CltJKT007 = "e46c18f3e03b1b277b706486a35153900d2b1eb8287c8ed24c791be7756b9dcf"
    ///  FCジャージー
    case CltJKT008 = "93f46b945e6f20ff9a5e314e0cb02d6f0f4aebf1d8e369ff7f3e26ad9f041d07"
    ///  レタード オレンジ
    case CltJKT009 = "118e2cd8c9bba3f75e6293764662ea84139c27ad1f4fdc42052a9a7ceca2b83d"
    ///  F-190
    case CltJKT010 = "29c9b49b0821e7444bdf96359539ce0863541db36abec9fe0bcd80203ba79380"
    ///  F-010
    case CltJKT011 = "55a00d999d486c7d283c16db6de97cf26344b0a0ba973bf02e26e383a084cf2e"
    ///  イカセーラー ブルー
    case CltJKT012 = "1666ae7472c0cea06111492e245267a18e22d9324fe0d9580d56ea4cd375fed4"
    ///  イカセーラー ホワイト
    case CltJKT013 = "832de73cc065ef3dcdb1e681dc1aa681570d2051b1b597d874eaa32a034c4090"
    ///  イカスカジャン
    case CltJKT014 = "6fa1e212abbd8373d6a82db7bf53553d09be972a35f76bb6bf63f5aafdd30cb7"
    ///  ウラスカジャン
    case CltJKT015 = "2fe15f0da4249acda4e69a7014bdb2da940e1474f7b08d57b06f5345ab2c49dd"
    ///  クラーゲス528
    case CltJKT016 = "d0639a761a4550f4be0452aae83360c0859838a2aacd3c6becdf24046a960b56"
    ///  マッチャ ライトダウン
    case CltJKT019 = "6502f678672a3f6f68efd584c66cfca7dfbb1c3d8637801ea3f7a48bca6cc314"
    ///  ケンサキコーチ
    case CltJKT023 = "ed14f60eafe2f6e0228ebda95334596141d961aa0bf84be672c6615a3dbfeea3"
    ///  ボンバージャケット ネガ
    case CltJKT036 = "f0e01a2c4ee99ce2d5758b40e56fc0bd494f260a6def92e87462ca4fae39d73c"
    ///  モンスター PCU56
    case CltJKT045 = "730cf0fbcaf569bba2a79d30782fdcf01107a8ac452ea345dac1f2860133292f"
    ///  バラズシヤッケ
    case CltJKT046 = "da74100112e501d10d2c4fc3e2d78f0239958945d460f3ad2b78b191b78b6e56"
    ///  フィレジャケット
    case CltJKT047 = "ed22b4e199802fab7cb03bbb5b4798c97ef6d59adf85c1aeaea2fa6a5c874274"
    ///  オールウェイズファン
    case CltJKT048 = "bf21d448849c4f65d817b4abd99c450436f1f2a0ea2200273ec5f9a7bec8dd7b"
    ///  パドリングジャケット ネガ
    case CltJKT049 = "9bc94aba3143acb46b0865963b4f17331d4d3e1f8f3691145256b412d83e47a3"
    ///  コテボレロ ネガ
    case CltJKT050 = "35060ee180c37b38c326e2052f91c741142d5f7dfd007cca998e79110f982340"
    ///  オスモル アイボリー
    case CltJKT051 = "cb1f8bd4b00fea8093c01f2d68700b18dd52dc536b4fc8bb2152016aced49b62"
    ///  アナアキダブルジャケット
    case CltJKT053 = "8e7a02c208d16106003d3f55e3eb82ed5e08f263371d41eea65b52babf1d17c4"
    ///  ハンティングジャケットKK
    case CltJKT054 = "74b3b7e93ea6313597330644a9cb1db742d79b7142675cfc764c506bb9476d97"
    ///  パドリングジャケット ポジ
    case CltJKT055 = "09da452726fa2a26dc9c77def28a39bb39dc8d480a38e4491d2da177e8466af8"
    ///  コテボレロ ポジ
    case CltJKT056 = "5d4411fd56f21ac3cefeddd00e7936d83042004e2b8080e3ae8c1f02b8ba1331"
    ///  バラズシダッフル
    case CltJKT057 = "fb87e0f5d5ca8c862f59a17198ee203c0411ea6e1f797836c57eb8ca3ed7b2ab"
    ///  イチニンバオリ
    case CltJKT059 = "00a07702e6a770b3146c0cdd2c58e9d10f89caf3c1df03036dc0a940543bdbc9"
    ///  マウンテン アオサ
    case CltJKT060 = "50717788b7d79257c15d69ccecddd7000a99bd941172365d9d209839af80dbd4"
    ///  ヤコナイロン ノスタルジア
    case CltJKT061 = "5ffba27258c1b9c6486e16635abe02053359654cedec6055abe8e0ac869029c2"
    ///  バスケジャージ ホーム
    case CltTNK000 = "efa3340a6636ec8aec69c6c50e1a01ef4669e0544c8297ff14c2d95d59eb76d9"
    ///  バスケジャージ アウェイ
    case CltTNK001 = "798cc9c9d3251ae0b4b6533f2b46e4e80131e787aa72cd0b3c7ccced146cbc53"
    ///  キングタンク ホワイト
    case CltTNK003 = "a232a2d6a9a33a927e0777ff5bda93a06a0ec193e768d69f8736e9f3dbec23dc"
    ///  ウミボーズ アウェイ
    case CltTNK007 = "87c5a94713d672dbe5e2d96b280db821f97d4f8e77991563e7498b75056546e4"
    ///  ウミボーズ ホーム
    case CltTNK008 = "8dacde5f302bb51618fb4fce6b6841f97bc203dbcce94bd07a03b8b8da73852d"
    ///  カレッジスウェット グレー
    case CltSWT000 = "1070a6cc2267596181f6523c526b06022bf7dcf90bb58942056d0c2111278d61"
    ///  イカバッテン マスタード
    case CltSWT001 = "04621782e7e530d0426ad24139006b91aca45f3e60221a35005c6b8e22744cf1"
    ///  レトロジャッジ
    case CltSWT002 = "40006398e739ea8a7dfecad5941c1e8321924f213c8771e25edee927c36a5047"
    ///  ホッコリー ネイビー
    case CltSWT003 = "a03f22f27f257ff5481e79c4b473341b13fe36910fee6532cf20eb0f7f10a4c3"
    ///  カレッジスウェット ネイビー
    case CltSWT004 = "41e918eed628bc3a51e836ed89d34e71d1a84a4fe8cd241cd406f64663dc156b"
    ///  リールロールスウェット
    case CltSWT005 = "08e0dbd7fc7835f0a9e5c321375e8eb1cd5d946750721bf2a9602fdf8359f7d3"
    ///  イカリスウェット
    case CltSWT006 = "92f8569a6e0dbb3ba3aa93463141787e34a043033e1293307fa8b7f21da0002c"
    ///  ドロップスウェット ネガ
    case CltSWT007 = "550d4a0a52a23d2ba411466f19860b9ad1904fcab347a2df2d8dbc73ffed01ea"
    ///  アナアキニット アオソデ
    case CltSWT010 = "85d50ca137b6f3445c1059c69476c344dc5b11974127bce604a311b8573f0b5d"
    ///  エンペーサートレーナー
    case CltSWT013 = "e33e54c9939bbe5188479b79df02c31b64cb694ca608d2d38fceaf03243f14b3"
    ///  クラマナスウェット
    case CltSWT016 = "1e9ac0e2afd80c98bdf693df5fe485580c9d46af2fe726d265bc7a9a5e855cab"
    ///  3Dニット シャーク
    case CltSWT017 = "e88b6e19ed179885925c4fec57041b8e76dba575dbad857db3752ad6cb7123ed"
    ///  タコピステ ブルー
    case CltSWT018 = "d462793d7e90d5e60f605601546ec1e12573e3d3a30f5d2249d0c4734833feef"
    ///  3Dニット ホエール
    case CltSWT020 = "e7741822ca39fb2006b4c3d026bdbf00bd44172a96addf9ac9e5be9a0b598b14"
    ///  フードレスパーカー イエロー
    case CltSWT021 = "9df93a1ae2ed4962f4dcc71173b8ce7ed03e200089045a0fe40c46b76f7c4d74"
    ///  フードレスパーカー マルチ
    case CltSWT022 = "bc72c1cccf4a98abb4f2673895ce6b3badec1628e25e4244458ed1678629c760"
    ///  オータムネル
    case CltSHT000 = "194ca8cacc7090ac1ec01cad49a61b8a200a779302e67e8ccf7452150266cd33"
    ///  イカスタンシャツ
    case CltSHT001 = "f062a9782ecec1cbe48047c11481de2bdbfff43ba0bafa95b1dd118256625b42"
    ///  ギンガムチェック ミドリ
    case CltSHT002 = "e5eb6e64cea070181de9dbbd4fbc9d40476133e9b7efe8c75ab1db8c5352b09f"
    ///  シロシャツ
    case CltSHT003 = "fac02231b31235d9287d08a499841270a5b866af3d157763de0e00419562bcfd"
    ///  ウーニーズBBシャツ
    case CltSHT004 = "5f424f12e1d0a1e12c69c0812f8a4065fc0bfccc1a42a79d7bde9a029df5d549"
    ///  おどるイカアロハ
    case CltSHT005 = "61f64c9f48e9734c48d0d01ba205f28d2088cade70ad93c9040819fec4f9c188"
    ///  ギンガムチェック アカ
    case CltSHT006 = "d159aec8efd96973da880ef8357afade95a6ec0cc7040cd0011e8356303019c5"
    ///  ベイビークラゲシャツ
    case CltSHT007 = "4ad1b090209a17da42a32498320ac5bd61688c47582c1530ac34ceddf3285dfa"
    ///  ミスターベースボール
    case CltSHT008 = "ff05f37b1f0f3e2e9e6517a8652ea2dd890d72c3d28853b45a8ba6a2404a46e9"
    ///  ミックスシャツ グレー
    case CltSHT009 = "4f38718518f5b9a393c2e1571e69ae16576e20508dee1ebb766f6a593044ad9d"
    ///  ヴィンテージチェック
    case CltSHT010 = "821e02f157b2cc6f7f2ef736f282e163a01323b56cf76355ad09afd486a67974"
    ///  マルエリシャツ
    case CltSHT011 = "ee7cb0251288da137c189d0e41ac5169a0853aaf8e86e989078552574c821648"
    ///  ロゴマシマシアロハ
    case CltSHT012 = "3545c1a42f704ffc74a53cda8cbe61ee7af85b569548adea028341648ac025e0"
    ///  ブロックストライプシャツ
    case CltSHT013 = "1280826ebf33bbf44ca27bace19e2ce303c888458740e70bed27a875162f7273"
    ///  シャンブレーシャツ
    case CltSHT014 = "4e5f427ffb83d4770cf5acdec49bdda780d90b85e1cae18fb7242198ba37804a"
    ///  タイシャツ
    case CltSHT015 = "e28534db03f4ab45a6152dc66a22a768e913e80511e2f45605672e22a8178386"
    ///  ピーターパンクシャツ
    case CltSHT017 = "0c18ac7e6ebb86916e224aae0bf2ffe14a831a371779188f080dd34274f81608"
    ///  タコボウラーシャツ
    case CltSHT018 = "a568a20bc9defc7f2351e462bc07ef8a1c89cf9f5b90eecd23c62e5ec3d527da"
    ///  スミカケシャツ
    case CltSHT019 = "43efa5a3c67752f16e8486452e1d5d2b01e43dafe0933a14cb14d1bb0e5c95b9"
    ///  パラシューター ザクロ
    case CltSHT020 = "b62dc62f72a0a24985789a5c7da9f0fa90d38d54e91e43e7d2f2c15bc5c7960b"
    ///  チリメンタコアロハ
    case CltSHT024 = "745e305e66890b70175e828840cb940cb5bfc22462568b9bb471107ee45d5cb2"
    ///  アナアキオンブレネル
    case CltSHT025 = "57188ba8bc19032326056111aeee9daab3082a20dcaabb5e31eb94fb0dee7c97"
    ///  スミヌキシャツ
    case CltSHT026 = "abe8a08ea37ba7f64dcbb94fde1b9289e2dae219e2ee8964e89c2347c925013a"
    ///  タツノコキューバ
    case CltSHT030 = "5f65c78eab41d2b44e4919e147bdf0e385e27f8557762c2e397e5ee6d0568c0a"
    ///  ピエロシャツ
    case CltSHT031 = "ef1c2f3b976e43d4975c4fd116b7bbb6615b8715af6d9fbddfb77f50a964d2ea"
    ///  ジャコスカウト
    case CltSHT032 = "aee622e5fe3b0fd492806ce87c1ec910940969b43f8b97817f44be5d8cae4e21"
    ///  フィレシャツ サファリ
    case CltSHT033 = "4c8919c44c7e7f89f7a08b1924e82c6f929dec8b7875af23d1c0eeb54e55d5d9"
    ///  ステッチシャツ ヤガラ
    case CltSHT034 = "b0a6a1b99d383f8dfc93dab52127aa98228e53fcd8761f81f252a764d6c8f297"
    ///  スミチラシシャツ
    case CltSHT036 = "57ffe463b66ae5604d991e955f66d98f35b82b8dbf8bddfb97c88ce0ff3e3c2c"
    ///  バンドカラー ストライプ
    case CltSHT037 = "981300abd899c924d34b9e44e40f436e4ce57c84abf6fa19a174f633a6a34505"
    ///  バンドカラー ムジ
    case CltSHT038 = "0bba824432f44862627a9510c60becb327f7d4e94ee1632f0dd8a331b9b888e9"
    ///  パッチワークシャツ
    case CltSHT039 = "e74a230473df73bd9874f9b513d8501144b1689425b22dfa92397d14e633ecb8"
    ///  フィレシャツ アーバン
    case CltSHT040 = "7ccef556f7e83b3e8df0323d6377f154e22bcecf71fd1c94cd24a805d1e8ceec"
    ///  マウンテンダウン
    case CltVST000 = "6a0aa432234e6e14536b04d640e8533a2ef9f8dce38a5a7b6c56dff985fc66d9"
    ///  フォレストダウン
    case CltVST001 = "cb4b80f5fe2879803dd87ee442690ccbff0e3c344928b836b03aa4c022053dc3"
    ///  アーバンベスト ナイト
    case CltVST002 = "afa1a82e0000190cb6b467e27b85786da2443c960a246f886110ca0147f9be14"
    ///  アーバンベスト イエロー
    case CltVST003 = "85f04cb040bf9cf6653ee665d4a003127cbd334d9f088ea4e711e4e3d3b5275e"
    ///  イカゴッチンベスト
    case CltVST004 = "7e629ad5d360e44b1e6b9100a1b05d53c7c5a8c40b85e56f48a6256ca656fe48"
    ///  イカノボリベスト
    case CltVST005 = "42e699cb25f442b6d02a637fa9e91706261699ab02e81931a1e10190b6bdb3da"
    ///  ハンティングベストKK
    case CltVST010 = "ab73195e3c0ecf0dd3b65464afd627b1ee3ef1bf39624cc4c5a5157bcb9bfa88"
    ///  タカアシプロテクターレッド
    case CltVST011 = "e6999f7c8420f34adef9ff692cccfaf84ba92435b167865b918580b418490c10"
    ///  タカアシプロテクターライム
    case CltVST012 = "26f54b493c09cdcf2b58c4f259a484d82457178395648ce282efbc7df1a1078c"
    ///  スミチラシベスト
    case CltVST013 = "c218428aced65b2b211c2c6c04dc2fcd90f911b65b6d38a2259a0a3b2a5ba6fa"
    ///  ハンティングベストBK
    case CltVST014 = "e519c3e56d36d0a045c37f232125d9fd84ffaf33a3a65c8a587e9502541f4037"
    ///  ジップアップ カモ
    case CltPRK000 = "c9624e4ad5798c86da097f8cb77d7dff48ccf8cf7aeb33f9240497e73c4f1ee4"
    ///  ジップアップ グリーン
    case CltPRK001 = "815a399494f7f77ff028efe9c57cdd50e25ea68d2e636adb0802d7bb3ac3b6a3"
    ///  エゾッコパーカー アズキ
    case CltPRK002 = "49873328005959d4ec030891feb9fe22492a6aafcd6ed06089e5998a4df318c6"
    ///  ホタパーカー グレー
    case CltPRK006 = "bf49beaeb35763d669e2795156c31bd94e9fa370bb077d684dc1d1715a15abd3"
    ///  バハフーディー ロホ
    case CltPRK012 = "103a7507b3b0974a2f26f17a04d5e4937bb23f3415448b91c1f287c057ffad7f"
    ///  カモパーカー ドトン
    case CltPRK013 = "98b7ecdadc047770c10a39b6972b4138055a3e9d4ca48a65bfe74ff4fa0a3caf"
    ///  バハフーディー セレステ
    case CltPRK014 = "8c7a2129e859dc03b8f05ea5438aa37d6a5de22f51425649abde424c8fb8279b"
    ///  カモパーカー スイトン
    case CltPRK015 = "5ea32298563489fddacbe14ac5d975abff8131a4edefd67d12c81d9141f0508d"
    ///  バイトツナギ オレンジ
    case CltCOP001 = "80c5fe2a622eef647d4cd2e717a9ef660b5c42654aff3378517535738bf0fbe1"
    ///  バイトツナギ グリーン
    case CltCOP002 = "8f03e316abab27e5402aad8c182d86a9430292c55366e74372652b34b6f812a5"
    ///  バイトツナギ イエロー
    case CltCOP003 = "2dfd25a793dd6ca2a219b9ab25d19c9aed7c06b325b75fa1167f82e46a2a769e"
    ///  バイトツナギ ピンク
    case CltCOP004 = "df5f02ec40eceb9f40643331a60208d266c8d25fa4f24c5732318af15ff630b9"
    ///  バイトツナギ ブルー
    case CltCOP005 = "4f0d6afb58885d7a4692b33dbae5d2ed8d699623d1e8c39c5dd1cb401684eddf"
    ///  バイトツナギ ブラック
    case CltCOP006 = "1399aa9223483fe44dd6b81fd759fc295a1c44febcf80af227fa010448c5070d"
    ///  バイトツナギ ホワイト
    case CltCOP007 = "f842738e2a003cda0304b53d820b1a94af8fd136a50147b8fd3f5d1b028ceb99"
    ///  バイトウェーダー オレンジ
    case CltCOP008 = "60c6987099d10335bed2ce2cc2dc74b000f30901b0e88899e5235809b1932a85"
    ///  バイトウェーダー ブラック
    case CltCOP009 = "ea09093c7c9850ea4db8ee09595f65a072d3ccea135bc62768bf729dbcd4af60"
    ///  バイトウェーダー イエロー
    case CltCOP010 = "d7c485b61542dafc6cb2daf92860a067ab15fb87ac3e4caf2f04b85a5e850301"
    ///  バイトウェーダー ブラウン
    case CltCOP011 = "de46583444fd9c09b09101bb6d5c1452dc7639acaff1675fdd04e1e92d5c84a2"
    ///  イカテンくんポロ
    case CltCOP100 = "5f828579a28ee2133c9f842c389fc4c0a34cd7e13a8feb832391b223b13ce305"
    ///  アンカーベスト
    case CltCOP101 = "214c5b7c7a33f42a80bdbf5de70b314961294d6195188cd5817b72078930627a"
    ///  フューエルブルゾン
    case CltCOP102 = "9f9a2dc5b6594ade01a1d5f54c9428ed1b9285afbd2ecde7dcb2b57b264c753c"
    ///  ガーディアンズスーツ
    case CltCOP111 = "46679677c04f8d905affce7d8026435c80f3a02e1221affe05dc13bc1e3b593d"
    ///  ナリキリハイテクスーツ
    case CltCOP112 = "e42932ba2e69cccf6abc4eaefc7553d9374e6b9089d5494cc9bdcc72f0c7d666"
    ///  ハイパーミライスーツ
    case CltCOP113 = "62649c9d0a4a56df224dc319927a15e9562cb32243afc0e12926f49deea51085"
    ///  スクールブレザーL
    case CltAMB000 = "45e0fe8467c62a00bab95d387af5730c51eb6a857ada7aee7cf676287b1c81da"
    ///  サムライジャケット
    case CltAMB001 = "96e31e8c3c16548bfa55e357c18d885e13b8dc737a0cb8d3870bca917b183139"
    ///  パワードスーツ
    case CltAMB002 = "53074eb0a77d3b6c45a928c28ca2c35934ccc1045283f5544f9299e2a2028c54"
    ///  スクールカーデ リボン
    case CltAMB003 = "227c84f5561eaee85424a89feb459a6ffdc49b302be1fc8d02446093912deb3d"
    ///  ニンジャスーツ
    case CltAMB004 = "e2dadef47a7b566856402c49ad39726180bdf38a1d0aec7d5776680070470434"
    ///  パワードスーツ オリジン
    case CltAMB005 = "2d7a41126d3bea01f62e1c60f4e4765e0fc3587b66ef8b0b86e7e13c7453b4b3"
    ///  ヒメイトパーカー
    case CltAMB006 = "8454df9b04640bdb36dad23bf6e5c989b26fd9353f533d616c07bf91add63124"
    ///  イイダチトップス
    case CltAMB007 = "b1b68b3dccc7ac625cc71d45bf69c6886953856943264c661850757b8c12abaa"
    ///  エンチャントローブS
    case CltAMB008 = "ae6894e4a69e35e5912bec148a905280dc761b27c2bf94d172cc746cfc19ac2f"
    ///  タコティカルなよろい
    case CltAMB009 = "4f197066cca6daaef8b6b1f351fdb2b13870492f7b00cc106b19276ec4cd6a77"
    ///  ひれおくんのて
    case CltAMB010 = "0ed8005d3e737d74cea1a913f6523fcce8980461a0facddbb89bdcbb925bb74b"
    ///  サキイカガクラン
    case CltAMB011 = "5c83c00b70a8f8c7235b3fdb4923188d05b5a931707b805fdf99e11520f9ac08"
    ///  ジュウドウギ クロオビ
    case CltAMB012 = "556b5dc156118e2f53c8d2df3f918706728428a8cc9d95501691f1aa3542ab4a"
    ///  バーサークアーマー
    case CltAMB013 = "c05dd01a3d24fc7f97980a177914477148a1780fd4a65f3b5a01062b8b1441dc"
    ///  スクールブレザーR
    case CltAMB014 = "d5fccd7f4ed6eb8df40d2d57dc348a4935e5a234c30ba6f43e00ac2b4905da39"
    ///  スクールカーデ ネクタイ
    case CltAMB015 = "76c1740f606ad8041d565e7c87dcc0312cd576ad32f98768ed32a624bd23f6fa"
    ///  エンチャントローブL
    case CltAMB017 = "86ad73541c6d90ba58e384184f02f71cc856e2b39098cd6b0dc7cba01853c4ce"
    ///  フェスＴ
    case CltHAP001 = "07f22915f02685c3cbc043929d8b823bf7ab68588147635fc5e1407fc0c43f5f"
    ///  ヒーロージャケット レプリカ
    case CltMSN000 = "630401edac85eee48c367506467a5e20426449f0c107a95317d65b576e6513df"
    ///  アーマージャケット レプリカ
    case CltMSN004 = "8fe4db1aed785b06e4077dc2393ce5b3e581fbaa290d2ffb0a377abcf8439faf"
    ///  ケタコゾネスプロテクター
    case CltMSN110 = "ce6e698bb12d041daf8f260e7b20784ca35915a8504b2e39bb7e9a1edbfeef23"
    ///  タコ・アーマー
    case CltMSN200 = "4e687b314074255032c136d7a2f7a302341040a44e2017a54d165490b239cdb9"
    ///  サバイバルスーツ
    case CltMSN301 = "e7fbc65ddcb6237b8e99c621d1ad8ef2191df585971fc3a83d480afa7e136aef"
    ///  ヒーロースーツLv1
    case CltMSN302 = "aa574bf63b0efcfc4825f19a9ceeb85288675ff8d96534ec73f15c33256e496c"
    ///  ヒーロースーツLv2
    case CltMSN303 = "fe13245a6275b649bed4217ed5ab8b7311851981e86b380c044406afc693ee40"
    ///  ヒーロースーツLv3
    case CltMSN304 = "b541fcfc183aa3c3c060073d5cb8b019d86794861d48ee5ddb54cafd47a399f4"
    ///  ヒーロースーツST
    case CltMSN305 = "e0eed73a58ac472beb06bb20d37833e9ba0373e2a78f892c1f0d81a6c59346b6"
    ///  ヒーロースーツ レプリカ
    case CltMSN306 = "dae43e544ec63b37f9ef2ff9906fcf2d6612f52fb697d9d09a222544252315a3"
    ///  でんせつのマント
    case CltMSN310 = "fda1b049a14da44fa480a7698097b26f8e6ec9c643c45b4bb21a883edbb7c3fc"
    ///  アゲアゲコロモ
    case CltTRG000 = "690ed173b79f8e8ff3d68ca0bdf95cabd6b8f40086616dbc5ef3cea6dc84041c"
}
