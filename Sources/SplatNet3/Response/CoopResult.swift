//
//  CoopResult.swift
//
//
//  Created by devonly on 2022/11/26.
//

import Foundation

// swiftlint:disable:next type_body_length
public struct CoopResult: Codable {
    public let id: Common.ResultId
    public let scale: [Int?]
    @NullCodable public var jobScore: Int?
    @NullCodable public var gradeId: CoopGradeId?
    @NullCodable public var kumaPoint: Int?
    public let waveDetails: [WaveResult]
    public let jobResult: JobResult
    public let myResult: PlayerResult
    public let otherResults: [PlayerResult]
    @NullCodable public var gradePoint: Int?
    @NullCodable public var jobRate: Decimal?
    public let playTime: Date
    public let bossCounts: [Int]
    public let bossKillCounts: [Int]
    public let dangerRate: Decimal
    @NullCodable public var jobBonus: Int?
    public let schedule: Schedule
    public let goldenIkuraNum: Int
    public let goldenIkuraAssistNum: Int
    public let ikuraNum: Int
    @NullCodable public var smellMeter: Int?
    @NullCodable public var scenarioCode: String?
    let enemyURLs: [SPAssetType<CoopEnemyInfoId>]
    let weaponURLs: [SPAssetType<WeaponInfoMainId>]

    public struct Schedule: Codable, Hashable {
        public let startTime: Date?
        public let endTime: Date?
        public let mode: ModeType
        public let rule: RuleType
        public let weaponList: [WeaponInfoMainId]
        public let stageId: CoopStageId

        init(schedule: CoopHistoryQuery.CoopSchedule, content: CoopHistoryDetailQuery.CoopHistoryDetail) {
            startTime = schedule.startTime
            endTime = schedule.endTime
            mode = schedule.mode
            rule = schedule.rule
            weaponList = content.weapons.map { WeaponInfoMainId(key: $0.image.hash) }
            stageId = content.coopStage.id
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            if let startTime {
                try container.encode(startTime, forKey: .startTime)
            } else {
                try container.encodeNil(forKey: .startTime)
            }
            if let endTime {
                try container.encode(endTime, forKey: .endTime)
            } else {
                try container.encodeNil(forKey: .endTime)
            }
            try container.encode(mode, forKey: .mode)
            try container.encode(rule, forKey: .rule)
            try container.encode(weaponList, forKey: .weaponList)
            try container.encode(stageId, forKey: .stageId)
        }

        public init(
            startTime: Date? = nil,
            endTime: Date? = nil,
            mode: ModeType,
            rule: RuleType,
            weaponList: [WeaponInfoMainId],
            stageId: CoopStageId
        ) {
            self.startTime = startTime
            self.endTime = endTime
            self.mode = mode
            self.rule = rule
            self.weaponList = weaponList
            self.stageId = stageId
        }
    }

    public struct PlayerResult: Codable {
        public let id: String
        public let nplnUserId: String
        public let isMyself: Bool
        public let byname: String
        public let name: String
        public let nameId: String
        public let nameplate: Nameplate
        public let goldenIkuraAssistNum: Int
        public let goldenIkuraNum: Int
        public let ikuraNum: Int
        public let deadCount: Int
        public let helpCount: Int
        public let weaponList: [WeaponInfoMainId]
        @NullCodable public var specialId: WeaponInfoSpecialId?
        public let specialCounts: [Int]
        public let bossKillCounts: [Int]
        public let bossKillCountsTotal: Int
        public let uniform: CoopSkinInfoId
        public let species: SpeciesType

        init(
            content: CoopHistoryDetailQuery.MemberResult,
            results: [CoopHistoryDetailQuery.EnemyResult],
            specialCounts: [[WeaponInfoSpecialId]],
            isMyself: Bool
        ) {
            id = content.player.id.description
            nplnUserId = content.player.id.nplnUserId
            self.isMyself = isMyself
            byname = content.player.byname
            name = content.player.name
            nameId = content.player.nameId
            nameplate = Nameplate(
                badges: content.player.nameplate.badges.map { $0?.id },
                background: Background(
                    textColor: content.player.nameplate.background.textColor,
                    id: content.player.nameplate.background.id
                )
            )
            goldenIkuraNum = content.goldenDeliverCount
            goldenIkuraAssistNum = content.goldenAssistCount
            ikuraNum = content.deliverCount
            deadCount = content.rescuedCount
            helpCount = content.rescueCount
            weaponList = content.weapons.map { WeaponInfoMainId(key: $0.image.hash) }
            specialId = content.specialWeapon?.weaponId
            self.specialCounts = specialCounts.map { $0.filter { $0 == content.specialWeapon?.weaponId }.count }
            bossKillCounts = isMyself ? results.bossKillCounts() : Array(repeating: -1, count: 14)
            uniform = content.player.uniform.id
            bossKillCountsTotal = content.defeatEnemyCount
            species = content.player.species
        }

        public init(
            id: String,
            nplnUserId: String,
            isMyself: Bool,
            byname: String,
            name: String,
            nameId: String,
            nameplate: CoopResult.Nameplate,
            goldenIkuraAssistNum: Int,
            goldenIkuraNum: Int,
            ikuraNum: Int,
            deadCount: Int,
            helpCount: Int,
            weaponList: [WeaponInfoMainId],
            specialId: WeaponInfoSpecialId? = nil,
            specialCounts: [Int],
            bossKillCounts: [Int],
            bossKillCountsTotal: Int,
            uniform: CoopSkinInfoId,
            species: SpeciesType
        ) {
            self.id = id
            self.nplnUserId = nplnUserId
            self.isMyself = isMyself
            self.byname = byname
            self.name = name
            self.nameId = nameId
            self.nameplate = nameplate
            self.goldenIkuraAssistNum = goldenIkuraAssistNum
            self.goldenIkuraNum = goldenIkuraNum
            self.ikuraNum = ikuraNum
            self.deadCount = deadCount
            self.helpCount = helpCount
            self.weaponList = weaponList
            self.specialId = specialId
            self.specialCounts = specialCounts
            self.bossKillCounts = bossKillCounts
            self.bossKillCountsTotal = bossKillCountsTotal
            self.uniform = uniform
            self.species = species
        }
    }

    public struct WaveResult: Codable, Identifiable {
        public let id: Int
        public let isClear: Bool
        public let waterLevel: CoopWaterLevelId
        public let eventType: CoopEventId
        @NullCodable public var goldenIkuraNum: Int?
        @NullCodable public var quotaNum: Int?
        public let goldenIkuraPopNum: Int

        // swiftlint:disable:next discouraged_optional_boolean
        init(content: CoopHistoryDetailQuery.WaveResult, resultWave: Int, bossDefeated: Bool?) {
            id = content.waveNumber
            isClear = {
                // EX-WAVEがあれば
                if let bossDefeated {
                    // ノルマがnullならEX-WAVEはbossDefeated、それ以外はクリア
                    return content.deliverNorm == nil ? bossDefeated : true
                }
                // それ以外は失敗したWAVEかどうか
                return !(content.waveNumber == resultWave)
            }()
            waterLevel = content.waterLevel
            eventType = content.eventWave?.id ?? .WaterLevels
            goldenIkuraNum = content.teamDeliverCount
            quotaNum = content.deliverNorm
            goldenIkuraPopNum = content.goldenPopCount
        }

        public init(
            id: Int,
            isClear: Bool,
            waterLevel: CoopWaterLevelId,
            eventType: CoopEventId,
            goldenIkuraNum: Int? = nil,
            quotaNum: Int? = nil,
            goldenIkuraPopNum: Int
        ) {
            self.id = id
            self.isClear = isClear
            self.waterLevel = waterLevel
            self.eventType = eventType
            self.goldenIkuraNum = goldenIkuraNum
            self.quotaNum = quotaNum
            self.goldenIkuraPopNum = goldenIkuraPopNum
        }
    }

    public struct JobResult: Codable {
        public let isClear: Bool
        @NullCodable public var failureWave: Int?
        // swiftlint:disable:next discouraged_optional_boolean
        @NullCodable public var isBossDefeated: Bool?
        @NullCodable public var bossId: CoopEnemyInfoId?

        init(content: CoopHistoryDetailQuery.CoopHistoryDetail) {
            isClear = content.resultWave == 0
            failureWave = content.resultWave == 0 ? nil : content.resultWave
            isBossDefeated = content.bossResult?.hasDefeatBoss
            bossId = content.bossResult?.boss.id
        }

        public init(
            isClear: Bool,
            failureWave: Int? = nil,
            // swiftlint:disable:next discouraged_optional_boolean
            isBossDefeated: Bool? = nil,
            bossId: CoopEnemyInfoId? = nil
        ) {
            self.isClear = isClear
            self.failureWave = failureWave
            self.isBossDefeated = isBossDefeated
            self.bossId = bossId
        }
    }

    public struct Nameplate: Codable {
        public let badges: [BadgeInfoId?]
        public let background: Background

        public init(
            badges: [BadgeInfoId?],
            background: CoopResult.Background
        ) {
            self.badges = badges
            self.background = background
        }
    }

    public struct Background: Codable {
        public let textColor: Common.TextColor
        public let id: NamePlateBgInfoId

        public init(
            textColor: Common.TextColor,
            id: NamePlateBgInfoId
        ) {
            self.textColor = textColor
            self.id = id
        }
    }

    public init(history: CoopHistoryQuery.CoopSchedule, content: CoopHistoryDetailQuery.CoopHistoryDetail) {
        id = content.id
        scale = [content.scale?.bronze, content.scale?.silver, content.scale?.gold]
        jobScore = content.jobScore
        kumaPoint = content.jobPoint
        waveDetails = content.waveResults.map { WaveResult(content: $0, resultWave: content.resultWave, bossDefeated: content.bossResult?.hasDefeatBoss) }
        jobResult = JobResult(content: content)
        let specialCounts: [[WeaponInfoSpecialId]] = content.waveResults.map { $0.specialWeapons.map(\.id) }
        myResult = PlayerResult(content: content.myResult, results: content.enemyResults, specialCounts: specialCounts, isMyself: true)
        otherResults = content.memberResults.map { PlayerResult(content: $0, results: [], specialCounts: specialCounts, isMyself: false) }
        gradeId = content.afterGrade?.id
        gradePoint = content.afterGradePoint
        jobRate = content.jobRate
        playTime = content.playedTime
        bossCounts = content.enemyResults.bossCounts()
        bossKillCounts = content.enemyResults.teamBossKillCounts()
        dangerRate = content.dangerRate
        jobBonus = content.jobBonus
        schedule = Schedule(schedule: history, content: content)
        ikuraNum = ([content.myResult] + content.memberResults).map(\.deliverCount).reduce(0, +)
        goldenIkuraNum = content.waveResults.compactMap(\.teamDeliverCount).reduce(0, +)
        goldenIkuraAssistNum = ([content.myResult] + content.memberResults).map(\.goldenAssistCount).reduce(0, +)
        smellMeter = content.smellMeter
        scenarioCode = content.scenarioCode
        if let bossResult = content.bossResult {
            enemyURLs = content.enemyResults.map { SPAssetType(key: $0.enemy.id, url: $0.enemy.image.url) } + [SPAssetType(key: bossResult.boss.id, url: bossResult.boss.image.url)]
        } else {
            enemyURLs = content.enemyResults.map { SPAssetType(key: $0.enemy.id, url: $0.enemy.image.url) }
        }
        weaponURLs =
            ([content.myResult] + content.memberResults).flatMap { $0.weapons.map { SPAssetType(key: WeaponInfoMainId(key: $0.image.hash), url: $0.image.url) } }
                + content.weapons.map { SPAssetType(key: WeaponInfoMainId(key: $0.image.hash), url: $0.image.url) }
    }

    public init(
        id: Common.ResultId,
        scale: [Int?],
        jobScore: Int? = nil,
        gradeId: CoopGradeId? = nil,
        kumaPoint: Int? = nil,
        waveDetails: [CoopResult.WaveResult],
        jobResult: CoopResult.JobResult,
        myResult: CoopResult.PlayerResult,
        otherResults: [CoopResult.PlayerResult],
        gradePoint: Int? = nil,
        jobRate: Decimal? = nil,
        playTime: Date,
        bossCounts: [Int],
        bossKillCounts: [Int],
        dangerRate: Decimal,
        jobBonus: Int? = nil,
        schedule: CoopResult.Schedule,
        goldenIkuraNum: Int,
        goldenIkuraAssistNum: Int,
        ikuraNum: Int,
        smellMeter: Int? = nil,
        scenarioCode: String? = nil
    ) {
        self.id = id
        self.scale = scale
        self.jobScore = jobScore
        self.gradeId = gradeId
        self.kumaPoint = kumaPoint
        self.waveDetails = waveDetails
        self.jobResult = jobResult
        self.myResult = myResult
        self.otherResults = otherResults
        self.gradePoint = gradePoint
        self.jobRate = jobRate
        self.playTime = playTime
        self.bossCounts = bossCounts
        self.bossKillCounts = bossKillCounts
        self.dangerRate = dangerRate
        self.jobBonus = jobBonus
        self.schedule = schedule
        self.goldenIkuraNum = goldenIkuraNum
        self.goldenIkuraAssistNum = goldenIkuraAssistNum
        self.ikuraNum = ikuraNum
        self.smellMeter = smellMeter
        self.scenarioCode = scenarioCode
        enemyURLs = []
        weaponURLs = []
    }
}

extension Collection where Element == CoopHistoryDetailQuery.EnemyResult {
    func bossKillCounts() -> [Int] {
        CoopEnemyInfoId.regular.compactMap { element in
            self.first(where: { $0.enemy.id == element })?.defeatCount ?? .zero
        }
    }

    func teamBossKillCounts() -> [Int] {
        CoopEnemyInfoId.regular.compactMap { element in
            self.first(where: { $0.enemy.id == element })?.teamDefeatCount ?? .zero
        }
    }

    func bossCounts() -> [Int] {
        CoopEnemyInfoId.regular.compactMap { element in
            self.first(where: { $0.enemy.id == element })?.popCount ?? .zero
        }
    }
}
