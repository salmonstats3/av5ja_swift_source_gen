//
//  GearInfoHead.swift
//
//  Created by tkgstrator on 2023/06/03
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum GearInfoHeadKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Hed_INV000
    public var id: Int { GearInfoHeadId.allCases[GearInfoHeadKey.allCases.firstIndex(of: self) ?? 0].rawValue }

    ///  INVISIBLE
    case HedINV000 = "b3908ae3208a1de5af32fc9c84ea5d42b4a5d964c5e26dbdb020502b7cce3575"
    ///  ヘッドバンド ホワイト
    case HedFST000 = "9970e78730016ca786353edf5de46e3f9c72f01ec1ac65bde2331f5b78eeb8c1"
    ///  ウーニーズBBキャップ
    case HedCAP000 = "f397b6fc8da9b9e8bdb42b1559101a003e3fca3b4ed4233def5080262e922de1"
    ///  キャンプキャップ
    case HedCAP001 = "730df11118d7a9ef367d5921003c012bfa7814477d1a6612ada6378b765fa4c1"
    ///  ヤコメッシュ
    case HedCAP002 = "437be7eb016cfeceaacf16059a1e6767eef01c6cf34f05685950c3c2a75cd320"
    ///  ビバレッジキャップ
    case HedCAP003 = "39e024fcce1311b3cf297bd1c5dadb623e555db6ca32c86c601dc21a20048374"
    ///  チドリキャップ
    case HedCAP004 = "f77a4f1093b221a83fa597d620111284226fdeb9a81d47a3bc07c0fe047b4eb0"
    ///  イカベーダーキャップ
    case HedCAP005 = "4ac702b9e22a053397b730cbf6314db7513cc0a1936c8e85c13e25b334a5c316"
    ///  カモメッシュ
    case HedCAP006 = "1388b78b794b80d93a6bb5faaca2b0b8ca33f07dd54e2e9386fa25290d1d0244"
    ///  5パネルキャップ
    case HedCAP007 = "753192e3372c2643283f57e3c906ce567fefeb48f9db50382e6ddbf41e3b909c"
    ///  エゾッコメッシュ
    case HedCAP008 = "d0666fd1809c3c1b695765b656153d24d81140c055c63c2fd2265a8d0a8b4d73"
    ///  バックワードキャップ
    case HedCAP009 = "b312ed4357a1417b901d4a7f46638416902c94f4b9f59b4902f98255e70b2434"
    ///  2ラインメッシュ
    case HedCAP010 = "030874e0ff4fbc67697fbc908df6ec015444a658ea8d6477ab15a8cd0b32a525"
    ///  ジェットキャップ
    case HedCAP011 = "520d938510ace2e7826127098efb81d96e9c7ae95113abb0548621d34bfdc4a5"
    ///  テッカサイクルキャップ
    case HedCAP012 = "4cb7d62e6c10e7f2eeb6d28130c60bac375263f0f8e5a665753181f3a731cd33"
    ///  チャリキング帽
    case HedCAP014 = "3b37ec21115ca26146b5068d4245412a694e24d6633fa0ca38fe2db51c483b98"
    ///  ヒッコリーワークキャップ
    case HedCAP020 = "7f1478a47b379a27ee46855925e9f7e451702a8e0b5fe469458526a5617f5fae"
    ///  ウールウーニーズクラシック
    case HedCAP021 = "0abeb8725b916960610762ce530fb09a210fcf10fa58d1e0674402f2b4c51841"
    ///  クラゲーダーキャップ
    case HedCAP023 = "7dad2cf540c767aff7b868b88c7bd1f465dc442c23ab954c78009f895703855a"
    ///  ハウスタグデニムCAP
    case HedCAP024 = "4883bcc057b243e8c6827ca5f29336c39e241f8b35794c1ee1510555194461f4"
    ///  ドゥーラグキャップガサネ
    case HedCAP026 = "bf37fa1b1149052bacebc9509a3cf58a2f11a7d7b75d82094cf3c60f015d3d83"
    ///  シェーディングキャップ スミ
    case HedCAP028 = "9121a06967442e44a1a6704632654cc6f099d3f7f274f45062ac32836fc6e484"
    ///  マリンキャップ
    case HedCAP031 = "9976138cdff6a075e174f7754b0c2dde636df1102a036e16e6eac55ecea5f0a3"
    ///  カモキャップ ドトン
    case HedCAP034 = "9860f8daeb19947960e4616d338cabd91b2f37bf1d19106939069f91ea7c4d8c"
    ///  カモキャップ スイトン
    case HedCAP035 = "a3b3b75f0521aad60d33e14e11c4aa123c1599c51f0eb690a41acd65bdc35a39"
    ///  フィッシャーマンキャップ
    case HedCAP036 = "bd1412ae26456c34eff53202c8238ea63b01f0c52b29d0947e6561107cae2414"
    ///  ボンボンニット
    case HedNCP000 = "d9f7d7dd09a3b8d7e7e9e7176a8573051992bf1a13bb66c3ca3eb100d80f223a"
    ///  ショートビーニー
    case HedNCP001 = "028eb90b48ece34043bb201c167c3e6e1c285ac8ffc21d3902fb1a78553790df"
    ///  ボーダービーニー
    case HedNCP002 = "8c3972c5530ba137ea960851ecc2f59891be24fc712bd757c1f9095c3788b14e"
    ///  ウインターボンボン
    case HedNCP003 = "bf1f63d071987c20552a48d0de0dbeb9267ada5f63820db2d6644426a8b7c424"
    ///  モンゴウベレー
    case HedNCP004 = "2ad7c9ee3b5c6e2d7539c0e56b110601f906c30d4807bf49601eabb770424a79"
    ///  イカノルディック
    case HedNCP005 = "3bcd7716b516c536b7d71e1430aecec7395fe4be00d88a09d4aea419694575ca"
    ///  リブニット
    case HedNCP008 = "3ad3d2fc2a7a8718a4b272e6a373dc16774156c77ac78cec4331c58f4f6447c4"
    ///  アナアキアンピンベレー
    case HedNCP009 = "74455c8d63d8f015e358c780808b73f6a3794c8a38bb2698ffe09479c1b99062"
    ///  チゴフグニット
    case HedNCP013 = "159e6e7bb93adb7949bc65dda2ff7d9639ab3b87122ab0fdcd02fb5c153c1032"
    ///  クロブチ レトロ
    case HedEYE000 = "38072cfb2f10f1aa987a756dd65defad90a3bbecb2286ab14d598c8b590a87f4"
    ///  スプラッシュゴーグル
    case HedEYE001 = "1a45ed82fc6e378cd428e4a1eece2fad82c314f102078e52e8783f9f84501fe1"
    ///  パイロットゴーグル
    case HedEYE002 = "40be323caaaa4b23dbf5ab6587a75bbdd5f7c7f2ccc23fe851e972878c681b4a"
    ///  イロメガネ
    case HedEYE003 = "a9abdc3cfe2e435f67d4649a280e8c1280ba70fc68f3ba5e2a9efa0fe92178c7"
    ///  アローバンド ブラック
    case HedEYE004 = "6aadffb8d6ace327cf46514df48b766dc35eb9c6d37e71401f114d1c52eb9c61"
    ///  ダイバーゴーグル
    case HedEYE005 = "2db7f1311a97492d106f7d29858e84d027d265264bc74d7265023e9fe160e696"
    ///  アローバンド ホワイト
    case HedEYE006 = "c06636f26d7fea275623e494da55ceddebcef12a035b29207a225e0c7ffa05db"
    ///  ダテコンタクト
    case HedEYE007 = "605157b896e265ccde45f5e8f02c943c4c9c2bad75eed2428e297debb3593384"
    ///  タレサン18K
    case HedEYE008 = "806f1535cb7359b64b1ea96d98f33eee5105f4094e2bd217ce4145b0db285902"
    ///  マルベッコー
    case HedEYE009 = "332abe2aa860cea24a209113b366bf8651956080dbc678ef6937eea302f563ac"
    ///  オクタグラス
    case HedEYE010 = "5ed04bfdc031e2f48622607c6b92485792e7c5008a8dfba15630121f0777d9e7"
    ///  セルブロウ
    case HedEYE011 = "5969760f0e323abf35abc8cdc528673d6e82acc3d71547382649fa58dfa0f82b"
    ///  ダブルエッグサングラス
    case HedEYE012 = "61de748900252df1ee4da387ac6d2a5fdd8985d552ca09a75d1ce7e4896893f3"
    ///  マルサンSV925
    case HedEYE014 = "979bc0c4772ed06b0229b99244985266eaf796a04195a300f2121174b82d6a37"
    ///  アナアキバスクベレー
    case HedEYE015 = "fec895f449b5771c8c59caf9a22974411e6d7400ec3a04ad870d7aa344542603"
    ///  スイミングモーグル
    case HedEYE016 = "326bec857e9424242262d2a1952f32bcb9415458f26aaefe344cd8432bbc2b84"
    ///  モーグル タタキベッチュー
    case HedEYE018 = "ba03a689d68fa21bed79457578366e431c598759ea1bac1d64c3ca12a40d8b29"
    ///  デメニギスゴーグル
    case HedEYE021 = "29d46db4a2125aa063203c6f5753ea72fcbf3602863d30023b5712dbb5e7e248"
    ///  ８ビットフレーム
    case HedEYE022 = "b29bab1e9bc764847c66e716052e8812a3908f5d8e6115beb963e9962c6a3307"
    ///  ワイヤーグラス
    case HedEYE023 = "b455e3e093659fb5ca0c57f2831dcffbac34a137acfc4ceb47503036da94531b"
    ///  サンサンサングラス
    case HedEYE024 = "1b34d8f000527fdcecbf0d60df60f2fadd7de580c2cc4928dc3a7929aef33a06"
    ///  フロート クリアグラス
    case HedEYE025 = "f399da43b1ef4a20c6b9c7124490613aaec8c58a6dd38b8ad028d506c34f1725"
    ///  バイカーシェード
    case HedEYE026 = "4e2dd27d5c8c374375d05f6146c74c33c7ce19769ad2b3de9457f1d579272b72"
    ///  アナアキスクエアグラス
    case HedEYE027 = "c4a1f4df6fe6fb8a224db3e2286df1d34917b87327b70aa90abd9b48c1bb2306"
    ///  クラムグラス
    case HedEYE028 = "893b4660018a3c19514c3d370d595e1fda1b6f32c311c41438374b2da4361995"
    ///  タマサンBC925
    case HedEYE029 = "d20c30de17f019379ffa18dc2ba7e6150b6c4c472dbfbf541d89a94ec4f2c902"
    ///  メダイサングラス
    case HedEYE030 = "134eb8923b21259d9760b579b7bd87fe443ed1e5c5b6fa9e1e62b7e230c881c5"
    ///  フトブチスクエア
    case HedEYE031 = "9bbe96712d74138a3e0d48256266baeb057dca037b4a554a7a2599a70c596e33"
    ///  ロブスターブーニー
    case HedHAT000 = "57c3f4cbd331685cb9da4596f15a06cf47d42b2e8997f0b3496971238f7f6834"
    ///  サファリハット
    case HedHAT001 = "576c31536aeb873d97afaf57be11dd55b2cce978f55e5c8df91b0c7ec311e0b3"
    ///  キャンプハット
    case HedHAT002 = "771c835e4efee031009fd43e8fecb92031e607ad73149603a788043a02bcceff"
    ///  フグベルハット
    case HedHAT003 = "cdc687f30bde3da5a2b23b98f1fbab2fac5e51927d3ecb36ead0152d53451985"
    ///  スゲ
    case HedHAT004 = "9e8980542e2198bd4b6b2874ad884627fb7458a66bb879bbf2f3d02be76cd3ef"
    ///  イカンカン
    case HedHAT005 = "1ed2a93d1c6f3745fb2cc9adb250a3956df5b23a1b06f7fc4120785a18e45fde"
    ///  イカンカン クラシック
    case HedHAT006 = "6d9e951ff61e484c898bab641fe798c5ec2de9c4f0ac0767d685d048e600bc51"
    ///  トレジャーメット
    case HedHAT007 = "e8f44cd807b6f352094feb1228bb657d757e4d6b5d5571d182da45cb80673dd1"
    ///  イカバケット
    case HedHAT008 = "ab1b62fa9bf59570163ce3a36f59880025cc6256bdbf4f8da08631fd197d3e0a"
    ///  パラソルチューリップ
    case HedHAT010 = "20a7fac7a65ecf796b75401ad769ca40e9d5f929dafe9c37f3fc6d039c69a458"
    ///  カイガラスゲ
    case HedHAT012 = "6b87072aa279a9f0004c95d7c560a5fc0894b064bcb63fb607bdfd94f7cd5159"
    ///  ボーラークラシック
    case HedHAT015 = "667e08432fba4356e8102d01acc70f3d1591ceb9e122abfb90ab43dece3bb648"
    ///  ステンシルデニムハット
    case HedHAT016 = "f4dfea6d1570eaab39e2717c265bee7745ef4551446dd21a95d6f6aef8a80d75"
    ///  ホタテンガロン
    case HedHAT017 = "df7cb45196f3b0019c6804c3cab1239a78d6094db6bdaa5752001f53b72bb9fb"
    ///  ストローハット
    case HedHAT019 = "aaba2a6a3bfd94fcf71e70cbd2f19f927187c823ee73c6f2ad4bd79160563597"
    ///  エゾッコリーボーラー
    case HedHAT020 = "b59317be0c3e68ae601e97b628222e3223209ab02db11687ce2221f4d3350caf"
    ///  フグベルベルベルハット
    case HedHAT021 = "f0a576adc5c5c3ae4911ad01fc8c9faff5814d012b1ee9c43d14171df0f89b18"
    ///  スタジオヘッドホン
    case HedHDP000 = "92cb13a626208575f304d18fc3398135de749d48ae52aaaa9d15acc6d6efeb11"
    ///  オーロラヘッドホン
    case HedHDP001 = "d637de9cfe9d4d4d0b1296afecfd8c3ee591a752735c53b31913ff1355c4dee7"
    ///  イヤーマフ
    case HedHDP002 = "06c7b602de1ddd906d9456e7f17fb5beef437992ce2f3508cf5d95513dc081f5"
    ///  ステカセヘッドホン
    case HedHDP004 = "03dc2cdb4219dfad5b10d239c9858b85f97fb63ac104fec4709536cbd8579d28"
    ///  ミミタコ8
    case HedHDP007 = "c6a4b2a88cff7480b314bcda6aca9a640943f19b93b13325072a3383cba0eec9"
    ///  甲伝導エンペラEP
    case HedHDP008 = "42f588f0a936a08f1f3e6754c8d615f517579c974070e415697a907c5c079368"
    ///  ミミタコ8 RAW
    case HedHDP009 = "8b28e1c2d41de4394f4843d4b257bcb92decb2d7b58262fe6682d25c2fdf8a58"
    ///  カモヘッドホン ドトン
    case HedHDP011 = "9a89484afa284b46480442b01dbb2c6f3973b444fd04df928355ae94b25fdef2"
    ///  カモヘッドホン スイトン
    case HedHDP012 = "0bf01ddc3a367ad66bee7a21501262fadd4180e1e13ed65b70949ae83b4dd859"
    ///  キャディ サンバイザー
    case HedVIS000 = "699023b20031e20abe4688c720f28009f08ab9be96794a0dbc463ee53ee85976"
    ///  ヤキフグ サンバイザー
    case HedVIS001 = "42d039e4cd97fdd24092632fe08bc0a2ab20355f1844be489cd94e8918b16b1a"
    ///  サンサンサンバイザー
    case HedVIS002 = "301d74ea88aaf430f3c8225ac53d270671b3da8834d4356bc940e3e30415d2f3"
    ///  ヤコバイザー
    case HedVIS003 = "510fa5cc020119717a0c229be4a67873893dfcc65be2df86f031fe41c1ef43a5"
    ///  フェイスバイザー
    case HedVIS004 = "c4853cb0cbd6acca147ca5bfb907a8fd342aca4d83d977e82ff07eedb5ff53e7"
    ///  ロブズ・10・バイザー
    case HedVIS005 = "db7391a22ecb3e10d643aec3c697054eadaca4d8b0b482c53ea0afafa6dc54e6"
    ///  サイクルメット
    case HedMET000 = "bf9aa39cec6e5dc11178468303a2eaf79275314414f2204aab160198f65078ed"
    ///  ナイトビジョン
    case HedMET002 = "04857797c6fd77af9a2ce286ff75190e28c2fba2eba3f06924e5f1202a46db1f"
    ///  スケボーメット
    case HedMET004 = "ae7c176fbdd175bb0e489598f4d5bacbc38515860c2a4fdc0822db4b3038896c"
    ///  バイザーメット
    case HedMET005 = "c0d7b19446869deef73464f28649c22e262362be4d5c71da73b559c64c64a655"
    ///  ロゴヅクシMTBメット
    case HedMET006 = "7042b001883ef0acb6cd2d2d6709432878b6808e5f67b9fecc4309cf4298fb60"
    ///  イカロスHKメット
    case HedMET007 = "209f461a4b0d0440523c7fd6a1eab7517b3daba44beaa71a6fe81c003c543edf"
    ///  オクトメットプライズデコ
    case HedMET009 = "4d51f9c3febb0d014be17af7ae873a23153979700f9ffa026b0c451360da6604"
    ///  シェルメット
    case HedMET012 = "6429f49e379bb3bb5b53e18826ec4a674573ff750d6d207544a40e4ef5dbdbc2"
    ///  ホーンメットBF
    case HedMET013 = "314058e86b8544391f024a0da6c276c926015156ee893094aef43fa6034b4a4a"
    ///  キャッチャーマスクFU
    case HedMET014 = "a7f88319920704c32079b9246bbbd1be236e456f6d780a8e23bef96e49db956f"
    ///  ヘッキャ ムジ
    case HedMET016 = "cee5b16fe77fb2268873dc932f96a09d9c51d3e7b3455b1bd821896e56ccf1d4"
    ///  イシダイSTメット ホーム
    case HedMET018 = "ee32dac9025cfeb962d2d6f8f511dd3423c8625ab9bf59597f1a2f76f97509ce"
    ///  チゴフグメット
    case HedMET019 = "0bea4543f3faa3e227d50f2144c0e94f9bab30599bda144f29094936f78fda83"
    ///  タコマスク
    case HedMSK000 = "61b990dc5ce510af4a45c935ea334440f4c611d3fe60f6119b7b3815eb04e267"
    ///  フェイスゴーグル
    case HedMSK001 = "10839b0cd0f773148a10156a921d847cf97eb15f4d462b544b2a97fda6954932"
    ///  エイズリーバンダナ
    case HedMSK002 = "27f2fa9b69b6e8a33b2bd3f4fcbd6b28005406cdebd7de257760bf853418a312"
    ///  イカスカルマスク
    case HedMSK003 = "9f7d3ee4857de420f8a1110882e6902762e64bcde0398c4027f2eeb874db0aee"
    ///  ペインターマスク
    case HedMSK004 = "921755ccd3f0dac0afde15b8684dea095e14068ae204febd0beb7c1d039b5676"
    ///  アナアキマスク
    case HedMSK005 = "9a5ca4a89dd2bcaabee3d25bb6f05296acd481d6201bdcca93d46edd099a2b80"
    ///  キングタコスターマスク
    case HedMSK006 = "2b4403bc36dd334137437b713472438232e13fe7a82a8707485ab93bed9bb7ee"
    ///  イカバッテンガード
    case HedMSK007 = "586d01eec9eaebea5b05d2b8bdc05a9d378d946f20ef23627d48329f16b1170b"
    ///  マスクドホッコリー
    case HedMSK008 = "70a775e8f172571389dc7d5b0f8fe08e75ce90fe5f062451767b4fc6b5cd58d5"
    ///  フォーリマスク
    case HedMSK011 = "cba946dc8b59e15b5b8bf107a2d871df42405142797d0fa733adcf908079a8e7"
    ///  ブロブスマイルマスク
    case HedMSK014 = "ba346dc0d5d1f5b45ffb03768099b43b0e2d31456260e1dbef931dd2c6ec8621"
    ///  エラブリースマスク
    case HedMSK015 = "3b113dbdd2094ccb052ca0bfd4ad3d706387bfd55b2709d9263921e94cc51f34"
    ///  トンビシールドR255
    case HedMSK016 = "34d2b767400912f944b27736790e9b237b0106d49a814437b3b9493867194140"
    ///  トンビシールドRGB0
    case HedMSK018 = "9e5b2a6eb26fae96fdbfc65242ec937f2b807ca37bd58efe625c9ed7ca69611c"
    ///  バスケバンド
    case HedHBD001 = "db35e908ae0c3df02c77df9cc907c013d56a849d9b1713d29aca6acb2c7bef4a"
    ///  スカッシュバンド
    case HedHBD002 = "8ccbd573a5b8b99b1d7eedc7d94a52cd68bd36f2a7ca4cb7cfd1e08a494c1ca9"
    ///  テニスバンド
    case HedHBD003 = "b0907544d34f3eac8506493ab163592ba44d5ee2afb45dac7751722f775455b2"
    ///  ランニングバンド
    case HedHBD004 = "67325c6e691c554c3820c231e7c7fb7b0c5cde0e793399d4898a93d9ccae0a38"
    ///  サッカーバンド
    case HedHBD005 = "8284879fba21fe5cc178e141728ead59cd0a4898ea6e900f6b8a159f20e49d63"
    ///  ヤキフグビスケットバンダナ
    case HedHBD007 = "2760099d2504f3383ec92fd976cc3e78d0223fd7ffa6bece622cbbf440166d1b"
    ///  ピンポンバンド
    case HedHBD009 = "cbf94a703559e438bb602a61dc79b94090f32e3dc7187392d6d6507365d175ce"
    ///  イカタコピアス 
    case HedACC003 = "be26811f5124aa5377ba087b9b9530d9288afb3d50923251bcf445ca464a222a"
    ///  バイトヘルメット オレンジ
    case HedCOP001 = "b2643db9a48948811b848d3932cacb3029b230ca8204b1f7eafab1b98d0eb7aa"
    ///  バイトヘルメット グリーン
    case HedCOP002 = "02e6b28993d5464030809d1eabac51b3275e9c23cd8e8965715bb7d939da046a"
    ///  バイトヘルメット イエロー
    case HedCOP003 = "5d5c911b5ebf8c4c46cc064c5af969895cf15a40c6c775315982c43d65af129f"
    ///  バイトヘルメット ピンク
    case HedCOP004 = "a276129a426b249bb62c6446f1a86446eb0d2fd81e8e4386f699e1e64de817c4"
    ///  バイトヘルメット ブルー
    case HedCOP005 = "c04758b6f7289dfcc4d77cb6c2a3e52aa2f7d15fb4f66cc375eb32daf4e7b76e"
    ///  バイトヘルメット ブラック
    case HedCOP006 = "02e08c0aa864281186afa87c771bf37097dab587e1ad3ed018233f562762130a"
    ///  バイトヘルメット ホワイト
    case HedCOP007 = "25990d7e93b7d80110efc06125d15916a7ecb099cdf55c2aa2b5c904e79d6568"
    ///  バイトキャップ グリーン
    case HedCOP008 = "dc5659e1c5e961206d903fb4793c35d353beaa2abf8741a612b71ec8965512d3"
    ///  バイトキャップ グレー
    case HedCOP009 = "e824cf14158f0c0d620021f385c917bb462fe9627ea12e085ad8bb3c7493da64"
    ///  バイトキャップ ブルー
    case HedCOP010 = "0b408082463e7747a8aea35e999e5c3b56eb4c0065f74ba36f05615f8ad7a80e"
    ///  バイトキャップ ブラック
    case HedCOP011 = "e2795ff70d3405341953a1900157b37600da0fcd41ac4616f6743f8b31824c79"
    ///  ヘッドライトヘルム
    case HedCOP100 = "49f7abbe2ab59926d8949ca7f3e9ed2adf83a732d90eb0f345915befdd01ba56"
    ///  ダストブロッカー 2.5
    case HedCOP101 = "b62ad406425191ea7056ab9625551b77edb6bd80b44bfe6822af1da8a94e84cb"
    ///  イトヨリキャップ
    case HedCOP110 = "3cc194f19795825e3b8f415db7c91eee8f2d7f2baacec66c6e7b966f8599e3b3"
    ///  シカイバイザー
    case HedCOP111 = "a1a46259ea6e22f607a80e995e688c32bdacd2fc77991b35fa0dcdf394c4852e"
    ///  カジカブト
    case HedCOP112 = "12f0635920ae28ce8d2f949ca13dfd8e51ef8ffbb240dbc218e75ba25336dabd"
    ///  パイロットメット
    case HedCOP113 = "205627105988cbb1f31e504cbf0874e5b5fb8c933f40da11fc4c66c4a0223a05"
    ///  ハイテクスコープ
    case HedCOP114 = "c781e0628ec213917014d76d9249e8e0bfa31e2d60310358deba88f88279c057"
    ///  ヒラメキブレインメット
    case HedCOP115 = "719633867c61527a3cc4f338eedaa734b5e028b3ead25c4bd1c846b03d608f2c"
    ///  タコツボメット
    case HedCOP116 = "cfe6f4e32b6248fa69f8b00c4cb9cee20fac12fcdb3beae87a412f9ad5de7804"
    ///  ガーディアンズキャップ
    case HedCOP117 = "36c8f7ca8dd42b60ca114b51b88fba5f0d21434b56b8f9d95e8c4f3c5ab097ee"
    ///  マルミエールUD
    case HedCOP118 = "d225b374dc6b106055517594c1a7876e695421d327ace4c8c061f67bda2635be"
    ///  ハイパーミライヘッド
    case HedCOP119 = "bc625e030ea677808ed0eea24243e6c745309da2e7d9679e6cace3710e1701ee"
    ///  イカパッチン
    case HedAMB000 = "6d6fdc948eb553ee1b8b76c3f2e7a3e4af5232c0bc8ab756efcde4f11ed350e4"
    ///  サムライヘルメット
    case HedAMB001 = "09e36863c4b1ecd7f0c04be923c5eac657705a4566f1604d4f17df6813532f74"
    ///  パワードマスク
    case HedAMB002 = "38b7b16aedd2c4bad86b8a2206e6c4e433d6bf083fb9671a4eef096e192a5ae3"
    ///  イカクリップ
    case HedAMB003 = "12025f1bbba16d7bb2677b912d4ab47d1f37e5419f66d6648cf72df84d9470dc"
    ///  イカカゲマスク乙
    case HedAMB004 = "24ea268c65f9c30a9cd19ecad8d5a35a40668778e9ed2b4d3a52f1d1c49a86e6"
    ///  パワードマスク オリジン
    case HedAMB005 = "5fbee9d8abc5f459564a9c23514b6829011531e928303cd5dc580e3f03073660"
    ///  ヒメイトクラウンS
    case HedAMB006 = "6586d49d969962d7429842fd6385ad0745c2562bec9cdac406262bfdbffd51a4"
    ///  イイダチヘッドホン
    case HedAMB007 = "c0acc85a470c012afb88737407ef40b3273380bf83c85375ee9cd1938d698794"
    ///  エンチャントハット
    case HedAMB008 = "238b0c04d971e49c420f69814be194a775a7f4d3eea8d466c6ac32cd9ee503da"
    ///  タコティカルなヘルム
    case HedAMB009 = "c80da2a984dd60904ab9c6a5d45b33ea45accbac7c93d19c87618ff5f87f7c4b"
    ///  ひれおくん
    case HedAMB010 = "5b1883579fd524722a73fc5f2edb2278ebee758be6a1b0aead74f8358848bf9e"
    ///  オシャブリボーン
    case HedAMB011 = "55c38cc89bc4ea2b0646f5eb3005a4cb750975d089012e390f60e08539aab530"
    ///  タコハチ
    case HedAMB012 = "69ca40ebacafcfe068e885ff0baee6d3a508b85939a116f5dcf77ddaf634a576"
    ///  バーサークヘル
    case HedAMB013 = "8f9036e4a17272aa7e645c0c9a4d35276825a39668d208ac4cf025e0637fcc29"
    ///  イカカゲマスク甲
    case HedAMB016 = "11c08d51a1a0e7346cee353ac01b3b1a21426258253cda10a3cd99679605928b"
    ///  ヒメイトクラウンL
    case HedAMB017 = "1aa3ed6f5953fd914495716eebe3c1a5a900c8400ca2ca9f1121a610d05c571e"
    ///  ヒーローヘッズ レプリカ
    case HedMSN000 = "1b0cb29ad745a0f80cf28638e8ca239e90570cc373463378f0bbaad427768305"
    ///  アーマーメット レプリカ
    case HedMSN004 = "c296ffc1dd0e58a9729c86c5e3540d39032696758bfa30b371b840c04642e956"
    ///  クマノミミ
    case HedMSN109 = "3e0a2c62e455852c7a057a73989b6f7c2a4ae20b4a3784200cdead4c065744be"
    ///  ケタコゾネスゴーグル
    case HedMSN110 = "8247b08ffa7278e4ce3cc4edadec842eb21cd12a0e92b081be18d01ea3e2c3f1"
    ///  ケタコゾネスゴーグルワカメ
    case HedMSN111 = "83d6536d67e464c607e0f031e7a0de53aac91aaa7ac4f8b6db94b95ebea2372c"
    ///  サバイバルイヤー
    case HedMSN301 = "715dbfb3f3817847dc3c16d0e1184d5301b4c91a75baa309f74eb981d0693476"
    ///  ヒーローブレインLv1
    case HedMSN302 = "f23bd1c87cc2bb426c3bdfd33544b7dc4e8703286c147ced25f720908c113940"
    ///  ヒーローブレインLv2
    case HedMSN303 = "b353083ef996691ea529662b0fdf533d74359d8ffc4d3c1875a0c9f1a227c8fa"
    ///  ヒーローブレインLv3
    case HedMSN304 = "74e9338c975f086296f8de71fd7c96f32f7f00cd08f56f617ac6a6069c405b0d"
    ///  ヒーローブレインST
    case HedMSN305 = "3c29879e7226542851d4f3dc5092dae50b9eeacc346c40f364d7bd9d89bc587e"
    ///  ヒーローブレイン レプリカ
    case HedMSN306 = "7704d274fc197295815ac10fe20c88a0ebce800b59aecf60710f9ae9e9b9cd4d"
    ///  でんせつのぼうし
    case HedMSN310 = "a52eb7b431cade8b25d916dc06f172a43a0a2c63f8e513df16f6336a152470d4"
    ///  ロブキャップ
    case HedTRG000 = "b7f6b3f454ef8197babfb2168f3e2144b80d5eeb06108d760e2c6d33ca262ad2"
}