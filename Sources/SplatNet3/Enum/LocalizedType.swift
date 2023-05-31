//
//  LocalizedType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum LocalizedType: String, CaseIterable {
	public var localized: String { NSLocalizedString(rawValue, bundle: .module, comment: "") }
	/// テッキュウ
	case CoopEnemySakeArtillery = "CoopEnemySakeArtillery"
	/// ドロシャケ
	case CoopEnemySakeBigMouth = "CoopEnemySakeBigMouth"
	/// ドロシャケ
	case CoopEnemySakeBigMouthGold = "CoopEnemySakeBigMouthGold"
	/// シャケコプター
	case CoopEnemySakeCopter = "CoopEnemySakeCopter"
	/// ダイバー
	case CoopEnemySakeDolphin = "CoopEnemySakeDolphin"
	/// タマヒロイ
	case CoopEnemySakeFlyBagman = "CoopEnemySakeFlyBagman"
	/// ハシラ
	case CoopEnemySakePillar = "CoopEnemySakePillar"
	/// タツ
	case CoopEnemySakeRope = "CoopEnemySakeRope"
	/// ナベブタ
	case CoopEnemySakeSaucer = "CoopEnemySakeSaucer"
	/// モグラ
	case CoopEnemySakediver = "CoopEnemySakediver"
	/// グリル
	case CoopEnemySakedozer = "CoopEnemySakedozer"
	/// バクダン
	case CoopEnemySakelienBomber = "CoopEnemySakelienBomber"
	/// カタパッド
	case CoopEnemySakelienCupTwins = "CoopEnemySakelienCupTwins"
	/// ヨコヅナ
	case CoopEnemySakelienGiant = "CoopEnemySakelienGiant"
	/// キンシャケ
	case CoopEnemySakelienGolden = "CoopEnemySakelienGolden"
	/// ドスコイ
	case CoopEnemySakelienLarge = "CoopEnemySakelienLarge"
	/// テッパン
	case CoopEnemySakelienShield = "CoopEnemySakelienShield"
	/// コジャケ
	case CoopEnemySakelienSmall = "CoopEnemySakelienSmall"
	/// ヘビ
	case CoopEnemySakelienSnake = "CoopEnemySakelienSnake"
	/// シャケ
	case CoopEnemySakelienStandard = "CoopEnemySakelienStandard"
	/// タワー
	case CoopEnemySakelienTower = "CoopEnemySakelienTower"
	/// コウモリ
	case CoopEnemySakerocket = "CoopEnemySakerocket"
	/// かけだし
	case CoopGrade00 = "CoopGrade00"
	/// はんにんまえ
	case CoopGrade01 = "CoopGrade01"
	/// いちにんまえ
	case CoopGrade02 = "CoopGrade02"
	/// じゅくれん
	case CoopGrade03 = "CoopGrade03"
	/// たつじん
	case CoopGrade04 = "CoopGrade04"
	/// たつじん＋１
	case CoopGrade05 = "CoopGrade05"
	/// たつじん＋２
	case CoopGrade06 = "CoopGrade06"
	/// たつじん＋３
	case CoopGrade07 = "CoopGrade07"
	/// でんせつ
	case CoopGrade08 = "CoopGrade08"
	/// かけだし アルバイター
	case CoopGradeArbeiter00 = "CoopGradeArbeiter00"
	/// はんにんまえ アルバイター
	case CoopGradeArbeiter01 = "CoopGradeArbeiter01"
	/// いちにんまえ アルバイター
	case CoopGradeArbeiter02 = "CoopGradeArbeiter02"
	/// じゅくれん アルバイター
	case CoopGradeArbeiter03 = "CoopGradeArbeiter03"
	/// たつじん アルバイター
	case CoopGradeArbeiter04 = "CoopGradeArbeiter04"
	/// たつじん＋１ アルバイター
	case CoopGradeArbeiter05 = "CoopGradeArbeiter05"
	/// たつじん＋２ アルバイター
	case CoopGradeArbeiter06 = "CoopGradeArbeiter06"
	/// たつじん＋３ アルバイター
	case CoopGradeArbeiter07 = "CoopGradeArbeiter07"
	/// でんせつ アルバイター
	case CoopGradeArbeiter08 = "CoopGradeArbeiter08"
	/// スメーシーワールド
	case CoopStageCarousel = "CoopStageCarousel"
	/// ムニ・エール海洋発電所
	case CoopStageShakedent = "CoopStageShakedent"
	/// すじこジャンクション跡
	case CoopStageShakehighway = "CoopStageShakehighway"
	/// 難破船ドン・ブラコ
	case CoopStageShakeship = "CoopStageShakeship"
	/// アラマキ砦
	case CoopStageShakespiral = "CoopStageShakespiral"
	/// シェケナダム
	case CoopStageShakeup = "CoopStageShakeup"
	/// マテガイ放水路
	case CoopStageTemple = "CoopStageTemple"
	/// アラマキ砦
	case CoopStageTutorial = "CoopStageTutorial"
	/// ？？？
	case CoopStageUnknown = "CoopStageUnknown"
	/// 海女美術大学
	case CoopStageUpland = "CoopStageUpland"
	/// 0
	case CommonLocaleLang = "CommonLocaleLang"
	/// ja-JP
	case CommonSplatNet3Locale = "CommonSplatNet3Locale"
	/// 実測値
	case CommonActualValue = "CommonActualValue"
	/// Salmonia3+
	case CommonAppSalmonia = "CommonAppSalmonia"
	/// アプリを更新してください
	case CommonAppUpdateRequired = "CommonAppUpdateRequired"
	/// チャート
	case CommonCharts = "CommonCharts"
	/// クリア率
	case CommonClearRatio = "CommonClearRatio"
	/// この操作は取り消せません。続行して良いですか。
	case CommonConfirmDanger = "CommonConfirmDanger"
	/// カスタマイズ
	case CommonCustomize = "CommonCustomize"
	/// ダークモード
	case CommonDarkMode = "CommonDarkMode"
	/// データ管理
	case CommonDataManagements = "CommonDataManagements"
	/// 助けられた回数
	case CommonDeathCount = "CommonDeathCount"
	/// オオモノシャケ討伐率
	case CommonDefeatedRatio = "CommonDefeatedRatio"
	/// オオモノシャケを倒した数
	case CommonDefeatedSakelienCount = "CommonDefeatedSakelienCount"
	/// 推定値
	case CommonEstimatedValue = "CommonEstimatedValue"
	/// イベントクリア率
	case CommonEventClearRatio = "CommonEventClearRatio"
	/// イベント発生率
	case CommonEventProbability = "CommonEventProbability"
	/// ゲーミングモード
	case CommonGamingMode = "CommonGamingMode"
	/// スケジュール取得
	case CommonGetSchedules = "CommonGetSchedules"
	/// 過去のスケジュールデータを取得します
	case CommonGetSchedulesTxt = "CommonGetSchedulesTxt"
	/// 金イクラ納品数
	case CommonGoldenEggsCollected = "CommonGoldenEggsCollected"
	/// 称号
	case CommonGradeId = "CommonGradeId"
	/// 評価ポイント
	case CommonGradePoint = "CommonGradePoint"
	/// イクラ取得率
	case CommonIkuraRatio = "CommonIkuraRatio"
	/// 記録
	case CommonJobResults = "CommonJobResults"
	/// バイト
	case CommonJobWorks = "CommonJobWorks"
	/// マイページ
	case CommonMyPage = "CommonMyPage"
	/// すすむ
	case CommonNext = "CommonNext"
	/// なかま
	case CommonPlayerCrew = "CommonPlayerCrew"
	/// あなた
	case CommonPlayerYou = "CommonPlayerYou"
	/// イクラ獲得数
	case CommonPowerEggsCollected = "CommonPowerEggsCollected"
	/// プライバシーポリシー
	case CommonPrivacyPolicy = "CommonPrivacyPolicy"
	/// 保存成功しました。
	case CommonSaveToPhotoLibrary = "CommonSaveToPhotoLibrary"
	/// アプリ設定
	case CommonSettings = "CommonSettings"
	/// ログイン
	case CommonSignIn = "CommonSignIn"
	/// ニンテンドーアカウントにログイン
	case CommonSignInTitle = "CommonSignInTitle"
	/// ニンテンドーアカウントはニンテンドースイッチに連携されている必要があります。
	case CommonSignInTxt = "CommonSignInTxt"
	/// ブキ支給回数
	case CommonSuppliedCount = "CommonSuppliedCount"
	/// ブキ支給率
	case CommonSuppliedMainProb = "CommonSuppliedMainProb"
	/// ブキ支給率
	case CommonSuppliedSpecialProb = "CommonSuppliedSpecialProb"
	/// 利用データの収集について
	case CommonTrackingData = "CommonTrackingData"
	/// 許可を選択した場合、アプリケーションはCookieを含むデータを収集し、コンテンツ、製品、サービスを最適化するためにGoogle Analyticsサービスのサーバーに送信します。
	case CommonTrackingDataTxt = "CommonTrackingDataTxt"
	/// アカウント連携解除
	case CommonUnlinkAccounts = "CommonUnlinkAccounts"
	/// アプリとニンテンドースイッチオンラインのアカウント連携を解除します（アカウントは削除されません）
	case CommonUnlinkAccountsTxt = "CommonUnlinkAccountsTxt"
	/// ようこそSalmonia3+へ
	case CommonWelcomeApp = "CommonWelcomeApp"
	/// もっと便利なサーモンランライフを！
	case CommonWelcomeAppTxt = "CommonWelcomeAppTxt"
	/// データ消去
	case CommonWipeData = "CommonWipeData"
	/// アプリで保存されているデータを削除します
	case CommonWipeDataTxt = "CommonWipeDataTxt"
	/// レビューを書く
	case CommonWriteReview = "CommonWriteReview"
	/// フォーム
	case CommonForm = "CommonForm"
	/// 種類
	case CommonFormType = "CommonFormType"
	/// バグ修正
	case CommonFormTypeBug = "CommonFormTypeBug"
	/// 機能追加
	case CommonFormTypeFeature = "CommonFormTypeFeature"
	/// 改善案
	case CommonFormTypeEnhancement = "CommonFormTypeEnhancement"
	/// タイトル
	case CommonFormTitle = "CommonFormTitle"
	/// 内容
	case CommonFormContent = "CommonFormContent"
	/// 送信
	case CommonFormSubmit = "CommonFormSubmit"
	/// 復元
	case CommonRestore = "CommonRestore"
	/// バックアップからリザルトを復元します
	case CommonRestoreTxt = "CommonRestoreTxt"
	/// バックアップ
	case CommonBackup = "CommonBackup"
	/// リザルトをバックアップします
	case CommonBackupTxt = "CommonBackupTxt"
	/// ログ
	case CommonLog = "CommonLog"
	/// 開発者にログを送信します（個人を特定する情報は含まれません）
	case CommonLogTxt = "CommonLogTxt"
	/// 圧縮(ZIP)
	case CommonBackupCompress = "CommonBackupCompress"
	/// 非圧縮(JSON)
	case CommonBackupNoCompress = "CommonBackupNoCompress"
	/// { 0 }%
	case Common = "Common"
	/// キャンセル
	case CommonCancel = "CommonCancel"
	/// ガチアサリ
	case CommonClamBlitz = "CommonClamBlitz"
	/// 閉じる
	case CommonClose = "CommonClose"
	/// : 
	case CommonColonRule = "CommonColonRule"
	/// ビッグラン
	case CommonCoopBigRun = "CommonCoopBigRun"
	/// QRコードは、株式会社デンソーウェーブの登録商標です。
	case CommonCopyrightQrCode = "CommonCopyrightQrCode"
	/// 決定
	case CommonDecide = "CommonDecide"
	/// ダウンロード
	case CommonDownload = "CommonDownload"
	/// おわる
	case CommonEnd = "CommonEnd"
	/// はてな
	case CommonGearPowerBlank = "CommonGearPowerBlank"
	/// ホーム
	case CommonHome = "CommonHome"
	/// イカリング３
	case CommonIkaring3 = "CommonIkaring3"
	/// ロード中
	case CommonNowLoading = "CommonNowLoading"
	/// ひっぱって更新
	case CommonPullToRefresh = "CommonPullToRefresh"
	/// ガチホコバトル
	case CommonRainmaker = "CommonRainmaker"
	/// シェア
	case CommonShare = "CommonShare"
	/// ガチエリア
	case CommonSplatZones = "CommonSplatZones"
	/// ガチヤグラ
	case CommonTowerControl = "CommonTowerControl"
	/// トリカラアタック
	case CommonTricolor = "CommonTricolor"
	/// トリカラマッチ
	case CommonTricolorMatch = "CommonTricolorMatch"
	/// ナワバリバトル
	case CommonTurfWar = "CommonTurfWar"
	/// 出現数
	case CoopHistoryAvailable = "CoopHistoryAvailable"
	/// 出現したオカシラシャケ
	case CoopHistoryAvailableBoss = "CoopHistoryAvailableBoss"
	/// 平均クリアWAVE数
	case CoopHistoryAverageClearWaves = "CoopHistoryAverageClearWaves"
	/// ビッグラン
	case CoopHistoryBigrun = "CoopHistoryBigrun"
	/// クリアボーナス
	case CoopHistoryBonus = "CoopHistoryBonus"
	/// オカシラシャケ出現！
	case CoopHistoryBossAvailable = "CoopHistoryBossAvailable"
	/// Clear!!
	case CoopHistoryClear = "CoopHistoryClear"
	/// キケン度
	case CoopHistoryDangerRatio = "CoopHistoryDangerRatio"
	/// オカシラシャケ撃破！
	case CoopHistoryDefeatBoss = "CoopHistoryDefeatBoss"
	/// 倒したオカシラシャケ
	case CoopHistoryDefeatBossCount = "CoopHistoryDefeatBossCount"
	/// 倒した！
	case CoopHistoryDefeated = "CoopHistoryDefeated"
	/// 倒したオオモノシャケ
	case CoopHistoryDefeatedEnemies = "CoopHistoryDefeatedEnemies"
	/// ※カッコ内の数字は自分で倒した数です
	case CoopHistoryDefeatedEnemiesGuide = "CoopHistoryDefeatedEnemiesGuide"
	/// 集めたイクラ
	case CoopHistoryDeliverCount = "CoopHistoryDeliverCount"
	/// オオモノシャケ
	case CoopHistoryEnemy = "CoopHistoryEnemy"
	/// EX-WAVE
	case CoopHistoryExWave = "CoopHistoryExWave"
	/// Failure
	case CoopHistoryFailure = "CoopHistoryFailure"
	/// GJ!
	case CoopHistoryGj = "CoopHistoryGj"
	/// バイトヒストリー一覧に戻る
	case CoopHistoryGoToStats = "CoopHistoryGoToStats"
	/// 集めた金イクラ
	case CoopHistoryGoldenDeliverCount = "CoopHistoryGoldenDeliverCount"
	/// 最高きろく
	case CoopHistoryHighestScore = "CoopHistoryHighestScore"
	/// バイトヒストリー
	case CoopHistoryHistory = "CoopHistoryHistory"
	/// 獲得ポイント
	case CoopHistoryJobPoint = "CoopHistoryJobPoint"
	/// 評価レート
	case CoopHistoryJobRatio = "CoopHistoryJobRatio"
	/// クマサンポイントカード
	case CoopHistoryKumaPointCard = "CoopHistoryKumaPointCard"
	/// 最新のバイトへ
	case CoopHistoryLatest = "CoopHistoryLatest"
	/// 期間限定
	case CoopHistoryLimited = "CoopHistoryLimited"
	/// 今月のギア
	case CoopHistoryMonthlyReward = "CoopHistoryMonthlyReward"
	/// 次のバイト
	case CoopHistoryNext = "CoopHistoryNext"
	/// NG
	case CoopHistoryNg = "CoopHistoryNg"
	/// バイトヒストリーがありません
	case CoopHistoryNoData = "CoopHistoryNoData"
	/// バイトヒストリーを表示できません
	case CoopHistoryNotAvailable = "CoopHistoryNotAvailable"
	/// 閲覧できるバイトヒストリーは、最新の50戦までです。
	case CoopHistoryNotAvailableDescription = "CoopHistoryNotAvailableDescription"
	/// 倒せなかった...
	case CoopHistoryNotDefeated = "CoopHistoryNotDefeated"
	/// { 0 }p
	case CoopHistoryP = "CoopHistoryP"
	/// バイト回数
	case CoopHistoryPlayCount = "CoopHistoryPlayCount"
	/// 前のバイト
	case CoopHistoryPrevious = "CoopHistoryPrevious"
	/// プライベート
	case CoopHistoryPrivate = "CoopHistoryPrivate"
	/// スタッフ募集！
	case CoopHistoryRecruit = "CoopHistoryRecruit"
	/// 初心者でも安心！元気で明るい方大歓迎！<br />アットホームな職場でアルバイトをしてみませんか？
	case CoopHistoryRecruitDescription = "CoopHistoryRecruitDescription"
	/// 簡単
	case CoopHistoryRecruitTag1 = "CoopHistoryRecruitTag1"
	/// イクラ集め
	case CoopHistoryRecruitTag2 = "CoopHistoryRecruitTag2"
	/// ～イカした制服でイクラ集め～
	case CoopHistoryRecruitTitle = "CoopHistoryRecruitTitle"
	/// いつものバイト
	case CoopHistoryRegular = "CoopHistoryRegular"
	/// 現在のポイント
	case CoopHistoryRegularPoint = "CoopHistoryRegularPoint"
	/// 助けた回数
	case CoopHistoryRescueCount = "CoopHistoryRescueCount"
	/// たすけてもらったかいすう
	case CoopHistoryRescuedCount = "CoopHistoryRescuedCount"
	/// ウロコ
	case CoopHistoryScale = "CoopHistoryScale"
	/// ドウウロコ
	case CoopHistoryScaleBronze = "CoopHistoryScaleBronze"
	/// キンウロコ
	case CoopHistoryScaleGold = "CoopHistoryScaleGold"
	/// ギンウロコ
	case CoopHistoryScaleSilver = "CoopHistoryScaleSilver"
	/// バイトスコア
	case CoopHistoryScore = "CoopHistoryScore"
	/// スケジュールを見る
	case CoopHistorySeeSchedule = "CoopHistorySeeSchedule"
	/// オカシラゲージ
	case CoopHistorySmellMeter = "CoopHistorySmellMeter"
	/// 支給ブキ
	case CoopHistorySupplyWeapon = "CoopHistorySupplyWeapon"
	/// サーモンラン
	case CoopHistoryTitle = "CoopHistoryTitle"
	/// るいけいポイント
	case CoopHistoryTotalPoint = "CoopHistoryTotalPoint"
	/// WAVE 1
	case CoopWave1 = "CoopWave1"
	/// WAVE 2
	case CoopWave2 = "CoopWave2"
	/// WAVE 3
	case CoopWave3 = "CoopWave3"
	/// 干潮
	case CoopWaterLevel0 = "CoopWaterLevel0"
	/// 普通
	case CoopWaterLevel1 = "CoopWaterLevel1"
	/// 満潮
	case CoopWaterLevel2 = "CoopWaterLevel2"
	/// 最後に遊んだ
	case RecordLatestPlayed = "RecordLatestPlayed"
	/// よく使う
	case RecordLatestUsed = "RecordLatestUsed"
	/// メイン
	case RecordMain = "RecordMain"
	/// じゅくれん度アップまで
	case RecordNextSkillLevel = "RecordNextSkillLevel"
	/// じゅくれん度
	case RecordSkillLevel = "RecordSkillLevel"
	/// 並び替え
	case RecordSort = "RecordSort"
	/// スペシャル
	case RecordSpecial = "RecordSpecial"
	/// ステージのきろく
	case RecordStageRecord = "RecordStageRecord"
	/// ステージ
	case RecordStageRecordAppName = "RecordStageRecordAppName"
	/// サブ
	case RecordSub = "RecordSub"
	/// きろく
	case RecordTitle = "RecordTitle"
	/// { 0 }p
	case RecordTotalTurfPoint = "RecordTotalTurfPoint"
	/// 塗りポイント
	case RecordTurfPoint = "RecordTurfPoint"
	/// 遊んでないステージ
	case RecordUnplayedStages = "RecordUnplayedStages"
	/// 未所持のブキ
	case RecordUnusedWeapons = "RecordUnusedWeapons"
	/// チョーシ
	case RecordVibes = "RecordVibes"
	/// ブキのきろく
	case RecordWeaponRecord = "RecordWeaponRecord"
	/// ブキ
	case RecordWeaponRecordAppName = "RecordWeaponRecordAppName"
	/// 勝利数
	case RecordWinCount = "RecordWinCount"
	/// { 0 }%
	case RecordWinRatio = "RecordWinRatio"
	/// バイトチームコンテスト
	case CommonCoopTeamContest = "CommonCoopTeamContest"
	/// はてな
	case CommonWpnNotfound = "CommonWpnNotfound"
	/// 銅
	case CoopHistoryBigrunBronze = "CoopHistoryBigrunBronze"
	/// 金
	case CoopHistoryBigrunGold = "CoopHistoryBigrunGold"
	/// 銀
	case CoopHistoryBigrunSilver = "CoopHistoryBigrunSilver"
	/// 現在の期間限定ポイント
	case CoopHistoryLimitedPoint = "CoopHistoryLimitedPoint"
	/// バイトチームコンテスト
	case CoopHistoryTeamContest = "CoopHistoryTeamContest"
	/// バイト
	case CoopRecordAppName = "CoopRecordAppName"
	/// 参加回数： { 0 }
	case CoopRecordAttended = "CoopRecordAttended"
	/// ビッグラン
	case CoopRecordBigrun = "CoopRecordBigrun"
	/// 銅
	case CoopRecordBigrunBronze = "CoopRecordBigrunBronze"
	/// 金
	case CoopRecordBigrunGold = "CoopRecordBigrunGold"
	/// 銀
	case CoopRecordBigrunSilver = "CoopRecordBigrunSilver"
	/// 最高評価
	case CoopRecordHighestJobRate = "CoopRecordHighestJobRate"
	/// ハイスコア
	case CoopRecordHighestScore = "CoopRecordHighestScore"
	/// もっと見る
	case CoopRecordMore = "CoopRecordMore"
	/// きろくがありません
	case CoopRecordNoData = "CoopRecordNoData"
	/// バイトチームコンテスト
	case CoopRecordTeamContest = "CoopRecordTeamContest"
	/// サーモンランのきろく
	case CoopRecordTitle = "CoopRecordTitle"
	/// M/d HH:mm
	case DatetimeFormat = "DatetimeFormat"
	/// yyyy M/d HH:mm
	case DatetimeYearFormat = "DatetimeYearFormat"
	/// ラッシュ
	case CoopEvent1 = "CoopEvent1"
	/// キンシャケ探し
	case CoopEvent2 = "CoopEvent2"
	/// グリル発進
	case CoopEvent3 = "CoopEvent3"
	/// ハコビヤ襲来
	case CoopEvent4 = "CoopEvent4"
	/// 霧
	case CoopEvent5 = "CoopEvent5"
	/// ドスコイ大量発生
	case CoopEvent6 = "CoopEvent6"
	/// 巨大タツマキ
	case CoopEvent7 = "CoopEvent7"
	/// ドロシャケ噴出
	case CoopEvent8 = "CoopEvent8"
}