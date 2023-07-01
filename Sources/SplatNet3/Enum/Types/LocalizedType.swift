//
//  LocalizedType.swift
//
//  Created by tkgstrator on 2023/07/01
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum LocalizedType: String, CaseIterable, Identifiable {
    public var id: String { rawValue }

    /// テッキュウ
    case SakeArtillery
    /// ドロシャケ
    case SakeBigMouth
    /// ドロシャケ
    case SakeBigMouthGold
    /// シャケコプター
    case SakeCopter
    /// ダイバー
    case SakeDolphin
    /// タマヒロイ
    case SakeFlyBagman
    /// ハシラ
    case SakePillar
    /// タツ
    case SakeRope
    /// ナベブタ
    case SakeSaucer
    /// モグラ
    case Sakediver
    /// グリル
    case Sakedozer
    /// バクダン
    case SakelienBomber
    /// カタパッド
    case SakelienCupTwins
    /// ヨコヅナ
    case SakelienGiant
    /// キンシャケ
    case SakelienGolden
    /// ドスコイ
    case SakelienLarge
    /// テッパン
    case SakelienShield
    /// コジャケ
    case SakelienSmall
    /// ヘビ
    case SakelienSnake
    /// シャケ
    case SakelienStandard
    /// タワー
    case SakelienTower
    /// コウモリ
    case Sakerocket
    /// かけだし
    case Grade00
    /// はんにんまえ
    case Grade01
    /// いちにんまえ
    case Grade02
    /// じゅくれん
    case Grade03
    /// たつじん
    case Grade04
    /// たつじん＋１
    case Grade05
    /// たつじん＋２
    case Grade06
    /// たつじん＋３
    case Grade07
    /// でんせつ
    case Grade08
    /// バイトツナギ オレンジ
    case Cop001
    /// バイトツナギ グリーン
    case Cop002
    /// バイトツナギ イエロー
    case Cop003
    /// バイトツナギ ピンク
    case Cop004
    /// バイトツナギ ブルー
    case Cop005
    /// バイトツナギ ブラック
    case Cop006
    /// バイトツナギ ホワイト
    case Cop007
    /// バイトウェーダー オレンジ
    case Cop008
    /// バイトウェーダー ブラック
    case Cop009
    /// バイトウェーダー イエロー
    case Cop010
    /// バイトウェーダー ブラウン
    case Cop011
    /// スメーシーワールド
    case Carousel
    /// ムニ・エール海洋発電所
    case Shakedent
    /// すじこジャンクション跡
    case Shakehighway
    /// 難破船ドン・ブラコ
    case Shakeship
    /// アラマキ砦
    case Shakespiral
    /// シェケナダム
    case Shakeup
    /// マテガイ放水路
    case Temple
    /// アラマキ砦
    case Tutorial
    /// ？？？
    case Unknown
    /// 海女美術大学
    case Upland
    /// グリル発進
    case CoopEventDozer
    /// 霧
    case CoopEventFog
    /// キンシャケ探し
    case CoopEventGeyser
    /// ハコビヤ襲来
    case CoopEventHakobiya
    /// ドスコイ大量発生
    case CoopEventMissile
    /// 巨大タツマキ
    case CoopEventRelay
    /// ラッシュ
    case CoopEventRush
    /// ドロシャケ噴出
    case CoopEventTamaire
    /// バイトシナリオ
    case CoopScenario
    /// オカシラシャケ
    case SakeBigBoss
    /// オカシラゲージ
    case SakeBigBossGauge
    /// セットアップ中です
    case InitialSetup
    /// About
    case CommonAbout
    /// 実測値
    case RecordActualValue
    /// 外観
    case CommonAppearances
    /// アプリ
    case CommonApplication
    /// 平均きろく
    case RecordAverageScore
    /// バックアップ
    case CommonBackupResults
    /// 圧縮(ZIP)
    case CommonBackupCompress
    /// データベースのバックアップを出力します。
    case CommonBackupMessage
    /// 非圧縮(JSON)
    case CommonBackupPlain
    /// クレジット
    case CommonAppCredit
    /// ダークモード
    case CommonDarkMode
    /// データ管理
    case CommonDataManagement
    /// 助けられた回数
    case CoopHistoryDeathCount
    /// オオモノシャケをたおした数
    case CoopHistoryDefeatedCount
    /// 推定値
    case CoopHistoryEstimatedValue
    /// イベントクリア率
    case CoopHistoryEventClearRatio
    /// イベント発生率
    case CoopHistoryEventFrequency
    /// よくあるご質問
    case CommonFaq
    /// ゲーミングモード
    case CommonGamingMode
    /// 称号
    case CoopHistoryGradeId
    /// 評価ポイント
    case CoopHistoryGradePoint
    /// 最高きろく
    case CoopHistoryHighestRecord
    /// イカリング2
    case CommonIkaring2
    /// 無効
    case CommonInvalid
    /// 言語
    case CommonLanguages
    /// 開発者にログを送信します。エラー発生時にログファイルを送信していただくことで、開発者が原因特定と修正するのが楽になります。ログファイルには個人を特定する一切の情報は含まれていません。
    case CommonShareLogMessage
    /// ログ送信
    case CommonShareLog
    /// ログファイル
    case CommonLogSize
    /// マイページ
    case CommonMyPage
    /// なかま
    case CoopHistoryPlayerCrew
    /// あなた
    case CoopHistoryPlayerYou
    /// プライバシーポリシー
    case CommonPrivacyPolicy
    /// フォーム
    case CommonRequestForm
    /// バグ修正
    case CommonRequestFormBug
    /// 内容
    case CommonRequestFormContent
    /// 改善案
    case CommonRequestFormEnhancement
    /// 機能追加
    case CommonRequestFormFeature
    /// タイトル
    case CommonRequestFormTitle
    /// 種類
    case CommonRequestFormType
    /// 送信
    case CommonRequsetFormSubmit
    /// リストア
    case CommonRestore
    /// ファイルアプリからリストアするファイルを選択してください。
    case CommonRestoreMessage
    /// リザルト件数
    case CoopHistoryResultsCount
    /// デバッグ
    case CommonRoleDebuger
    /// 開発
    case CommonRoleDeveloper
    /// テスト
    case CommonRoleTester
    /// 翻訳
    case CommonRoleTranslator
    /// 保存しました
    case CommonSaveToPhotoLibrary
    /// スケジュール同期
    case CommonScheduleSync
    /// スケジュールサーバーから過去のスケジュールを取得します
    case CommonScheduleSyncMessage
    /// ログイン
    case CommonSignIn
    /// ログアウト
    case CommonSignOut
    /// ログアウト成功しました
    case CommonSignOutSuccessfully
    /// ニンテンドーアカウントとの連携を解除します
    case CommonSignOutMessage
    /// ソースコード
    case CommonSourceCode
    /// 支給率
    case CoopHistorySuppliedRatio
    /// アプリをアップデートしてください
    case CommonUpdateRequired
    /// ユーザーデータ
    case CommonUserData
    /// 有効
    case CommonValid
    /// バージョン
    case CommonAppVersion
    /// ログ消去
    case CommonWipeLog
    /// 保存されている全てのログを消去します。
    case CommonWipeLogMessage
    /// リザルト消去
    case CommonWipeResults
    /// 保存されている全てのリザルトを消去します。
    case CommonWipeResultsMessage
    /// レビューを書く
    case CommonWriteReview
    /// 総合きろく
    case CoopHistoryOverallRecord
    /// 金イクラ
    case CommonGoldenEggs
    /// イクラ
    case CommonPowerEggs
    /// 概要
    case CommonOverview
    /// ja-JP
    case CommonLocale
    /// 0
    case CommonLanguageCode
    /// データベース
    case CommonDatabase
    /// X-ProductVersion
    case CommonXproductVersion
    /// X-WebViewVer
    case CommonXwebViewVer
    /// アップロード
    case CommonUpload
    /// 開発
    case CommonCreditDevelop
    /// テスト
    case CommonCreditTest
    /// UI/UXデザイン
    case CommonCreditDesign
    /// チームポイントカード
    case CoopHistoryTeamPointCard
    /// 推定値を表示
    case CoopHistoryUseEstimatedValue
    /// Safariの認証を利用する
    case CommonUseSecureSession
    /// 報酬
    case CommonCheckInReward
    /// 過去に配布されていたQRコードの報酬を取得します。
    case CommonGetCheckInReward
    /// チーム
    case CoopHistoryTeamResult
    /// あなた
    case CoopHistoryPlayerResult
    /// なかまの平均
    case CoopHistoryCrewAvgResult
    /// なかま
    case CoopHistoryCrewResult
    /// Waves
    case CoopHistoryWaveResult
    /// 最高
    case CoopRecordHighestScore
    /// 平均
    case CoopRecordAverageScore
    /// この機能を利用するにはiOS16以上にアップデートする必要があります。
    case CommonRequirediOs16
    /// このアプリを利用するにはニンテンドーアカウントでログインする必要があります。
    case CommonRequiredSignIn
    /// リザルト復元に成功しました。
    case CommonRestoreSuccessMessage
    /// リザルト復元に失敗しました。未サポートの形式またはファイルが改ざんされているため署名が一致しません。
    case CommonRestoreFailureMessage
    /// リザルト件数
    case CommonResultsCount
    /// デベロッパの回答
    case CommonDeveloperAnswer
    /// サポートされていないバージョンでバックアップされたリザルトのため復元できませんでした。
    case CommonMinimumVersion
    /// バックアップの署名が一致しなかったため復元できませんでした。リザルトが改ざんされている可能性があります。
    case ErrorInvalidSignature
    /// 端末の設定を利用する
    case CommonUseSystemTheme
    /// ライセンス
    case CommonLicense
    /// yyyy M/d HH:mm
    case DateTimeYearFormat
    /// M/d HH:mm
    case DateTimeFormat
    /// コンプリート！
    case CoopHistoryRandomComplete
    /// -
    case WaterLevels
    /// ラッシュ
    case Rush
    /// キンシャケ探し
    case GoldieSeeking
    /// グリル発進
    case Griller
    /// ハコビヤ襲来
    case TheMothership
    /// 霧
    case Fog
    /// ドスコイ大量発生
    case CohockCharge
    /// 巨大タツマキ
    case GiantTornado
    /// ドロシャケ噴出
    case MudmouthEruptions
    /// キャンセル
    case CommonCancel
    /// ガチアサリ
    case CommonClamBlitz
    /// 閉じる
    case CommonClose
    /// :
    case CommonColonRule
    /// ビッグラン
    case CommonCoopBigRun
    /// バイトチームコンテスト
    case CommonCoopTeamContest
    /// QRコードは、株式会社デンソーウェーブの登録商標です。
    case CommonCopyrightQrCode
    /// 決定
    case CommonDecide
    /// ダウンロード
    case CommonDownload
    /// おわる
    case CommonEnd
    /// はてな
    case CommonGearPowerBlank
    /// ホーム
    case CommonHome
    /// イカリング３
    case CommonIkaring3
    /// ロード中
    case CommonNowLoading
    /// ひっぱって更新
    case CommonPullToRefresh
    /// ガチホコバトル
    case CommonRainmaker
    /// シェア
    case CommonShare
    /// ガチエリア
    case CommonSplatZones
    /// ガチヤグラ
    case CommonTowerControl
    /// トリカラアタック
    case CommonTricolor
    /// トリカラマッチ
    case CommonTricolorMatch
    /// ナワバリバトル
    case CommonTurfWar
    /// はてな
    case CommonWpnNotfound
    /// 出現数
    case CoopHistoryAvailable
    /// 出現したオカシラシャケ
    case CoopHistoryAvailableBoss
    /// 平均クリアWAVE数
    case CoopHistoryAverageClearWaves
    /// ビッグラン
    case CoopHistoryBigrun
    /// 銅
    case CoopHistoryBigrunBronze
    /// 金
    case CoopHistoryBigrunGold
    /// 銀
    case CoopHistoryBigrunSilver
    /// クリアボーナス
    case CoopHistoryBonus
    /// オカシラシャケ出現！
    case CoopHistoryBossAvailable
    /// Clear!!
    case CoopHistoryClear
    /// キケン度
    case CoopHistoryDangerRatio
    /// オカシラシャケ撃破！
    case CoopHistoryDefeatBoss
    /// 倒したオカシラシャケ
    case CoopHistoryDefeatBossCount
    /// 倒した！
    case CoopHistoryDefeated
    /// 倒したオオモノシャケ
    case CoopHistoryDefeatedEnemies
    /// ※カッコ内の数字は自分で倒した数です
    case CoopHistoryDefeatedEnemiesGuide
    /// 集めたイクラ
    case CoopHistoryDeliverCount
    /// オオモノシャケ
    case CoopHistoryEnemy
    /// EX-WAVE
    case CoopHistoryExWave
    /// Failure
    case CoopHistoryFailure
    /// GJ!
    case CoopHistoryGj
    /// バイトヒストリー一覧に戻る
    case CoopHistoryGoToStats
    /// 集めた金イクラ
    case CoopHistoryGoldenDeliverCount
    /// ハイスコア
    case CoopHistoryHighestScore
    /// バイトヒストリー
    case CoopHistoryHistory
    /// 獲得ポイント
    case CoopHistoryJobPoint
    /// 評価レート
    case CoopHistoryJobRatio
    /// クマサンポイントカード
    case CoopHistoryKumaPointCard
    /// 最新のバイトへ
    case CoopHistoryLatest
    /// 現在の期間限定ポイント
    case CoopHistoryLimitedPoint
    /// 今月のギア
    case CoopHistoryMonthlyReward
    /// 次のバイト
    case CoopHistoryNext
    /// NG
    case CoopHistoryNg
    /// バイトヒストリーがありません
    case CoopHistoryNoData
    /// バイトヒストリーを表示できません
    case CoopHistoryNotAvailable
    /// 閲覧できるバイトヒストリーは、最新の50戦までです。
    case CoopHistoryNotAvailableDescription
    /// 倒せなかった...
    case CoopHistoryNotDefeated
    /// p
    case CoopHistoryP
    /// バイト回数
    case CoopHistoryPlayCount
    /// 前のバイト
    case CoopHistoryPrevious
    /// プライベート
    case CoopHistoryPrivate
    /// スタッフ募集！
    case CoopHistoryRecruit
    /// 簡単
    case CoopHistoryRecruitTag1
    /// イクラ集め
    case CoopHistoryRecruitTag2
    /// ～イカした制服でイクラ集め～
    case CoopHistoryRecruitTitle
    /// いつものバイト
    case CoopHistoryRegular
    /// 現在のポイント
    case CoopHistoryRegularPoint
    /// 助けた回数
    case CoopHistoryRescueCount
    /// たすけてもらったかいすう
    case CoopHistoryRescuedCount
    /// ウロコ
    case CoopHistoryScale
    /// ドウウロコ
    case CoopHistoryScaleBronze
    /// キンウロコ
    case CoopHistoryScaleGold
    /// ギンウロコ
    case CoopHistoryScaleSilver
    /// バイトスコア
    case CoopHistoryScore
    /// スケジュールを見る
    case CoopHistorySeeSchedule
    /// オカシラゲージ
    case CoopHistorySmellMeter
    /// 支給ブキ
    case CoopHistorySupplyWeapon
    /// バイトチームコンテスト
    case CoopHistoryTeamContest
    /// サーモンラン
    case CoopHistoryTitle
    /// るいけいポイント
    case CoopHistoryTotalPoint
    /// WAVE
    case CoopHistoryWave
    /// 干潮
    case CoopHistoryWaveLevel0
    /// 普通
    case CoopHistoryWaveLevel1
    /// 満潮
    case CoopHistoryWaveLevel2
    /// ホームに戻る
    case ErrorBackToHome
    /// 現在利用できません。しばらくお待ちください
    case ErrorCurrentlyNotAvailable
    /// エラー
    case ErrorError
    /// エラーが発生しました
    case ErrorErrorOccurred
    /// 読みこみに失敗しました
    case ErrorErrorReopen
    /// ただいまサーバーのメンテナンス中です。時間をおいて再度アクセスしてください。
    case ErrorMaintenanceDescription
    /// しばらくお待ちください
    case ErrorMaintenanceTitle
    /// 再読みこみ
    case ErrorReload
    /// 最後に遊んだ
    case RecordLatestPlayed
    /// よく使う
    case RecordLatestUsed
    /// メイン
    case RecordMain
    /// じゅくれん度アップまで
    case RecordNextSkillLevel
    /// じゅくれん度
    case RecordSkillLevel
    /// 並び替え
    case RecordSort
    /// スペシャル
    case RecordSpecial
    /// ステージのきろく
    case RecordStageRecord
    /// ステージ
    case RecordStageRecordAppName
    /// サブ
    case RecordSub
    /// きろく
    case RecordTitle
    /// p
    case RecordTotalTurfPoint
    /// 塗りポイント
    case RecordTurfPoint
    /// 遊んでないステージ
    case RecordUnplayedStages
    /// 未所持のブキ
    case RecordUnusedWeapons
    /// チョーシ
    case RecordVibes
    /// ブキのきろく
    case RecordWeaponRecord
    /// ブキ
    case RecordWeaponRecordAppName
    /// 勝利数
    case RecordWinCount
    /// %
    case RecordWinRatio
    /// 権利表記
    case SettingsAcknowledgements
    /// 設定
    case SettingsAppName
    /// クレジット
    case SettingsCredits
    /// エキスパンション・パス 購入サイトへ
    case SettingsExpansionPass
    /// 設定
    case SettingsTitle
    /// バンカラマッチ
    case StageScheduleBankara
    /// オープン
    case StageScheduleBankaraOpen
    /// チャレンジ
    case StageScheduleBankaraOpenChallenge
    /// サーモンラン
    case StageScheduleCoop
    /// NOW OPEN！
    case StageScheduleCoopCurrentPeriodStart
    /// イベントマッチ
    case StageScheduleEvent
    /// いま
    case StageScheduleEventCurrentSchedule
    /// そのつぎ
    case StageScheduleEventFuture
    /// 開催中！
    case StageScheduleEventHolding
    /// 次回
    case StageScheduleEventNext
    /// つぎ
    case StageScheduleEventNextSchedule
    /// スケジュールが未定です
    case StageScheduleEventNoData
    /// ?????
    case StageScheduleEventUnknownData
    /// イベント開催！
    case StageScheduleEventmatch
    /// そのつぎ
    case StageScheduleFuture
    /// Webブラウザが開きます
    case StageScheduleGuideOpenBrowser
    /// つぎ
    case StageScheduleNext
    /// ビッグラン接近中！
    case StageScheduleNoticeBigrun
    /// バイトチームコンテスト開催予告！
    case StageScheduleNoticeLimited
    /// フェスマッチ開催中！
    case StageScheduleNowClosed
    /// オープン！
    case StageScheduleOpen
    /// ビッグラン発生中！
    case StageScheduleOpenBigrun
    /// バイトチームコンテスト開催中！
    case StageScheduleOpenLimited
    /// プライベートマッチ
    case StageSchedulePrivate
    /// ビッグランがやってくる！！バイト大募集
    case StageScheduleRecruit
    /// バイトチームコンテスト！チームを組んで参加しよう！
    case StageScheduleRecruitTeamContest
    /// レギュラーマッチ
    case StageScheduleRegular
    /// ルールを見る
    case StageScheduleRules
    /// 詳しいルールはこちら
    case StageScheduleSeeAllRules
    /// ランダム
    case StageScheduleSuppliedWeaponRandom
    /// 支給ブキ
    case StageScheduleSuppliedWeapons
    /// スケジュール
    case StageScheduleTitle
    /// ルールごとの勝率
    case StageScheduleWinRateByRules
    /// Xマッチ
    case StageScheduleXmatch
}
