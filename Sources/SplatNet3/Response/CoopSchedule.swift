//
//  CoopSchedule.swift
//
//
//  Created by devonly on 2022/12/03.
//

import Foundation

// Salmon Statsから取得したスケジュール
public struct CoopSchedule: Codable {
    public let stageId: CoopStageId
    public let startTime: Date
    public let endTime: Date
    public let weaponList: [WeaponInfoMainId]
    public let rareWeapon: WeaponInfoMainId?
    public let mode: ModeType
    public let rule: RuleType
    public let estimatedKingSalmonId: CoopEnemyInfoId?
    public let setting: CoopSetting

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        stageId = try container.decode(CoopStageId.self, forKey: .stageId)
        startTime = try container.decode(Date.self, forKey: .startTime)
        endTime = try container.decode(Date.self, forKey: .endTime)
        weaponList = try container.decode([WeaponInfoMainId].self, forKey: .weaponList)
        rareWeapon = try container.decodeIfPresent(WeaponInfoMainId.self, forKey: .rareWeapon)
        let setting: CoopSetting = try container.decode(CoopSetting.self, forKey: .setting)
        mode = setting == .CoopTeamContestSetting ? .LIMITED : .REGULAR
        rule = {
            switch setting {
            case .CoopBigRunSetting:
                return .BIG_RUN
            case .CoopNormalSetting:
                return .REGULAR
            case .CoopTeamContestSetting:
                return .TEAM_CONTEST
            }
        }()
        self.setting = setting
        estimatedKingSalmonId = try container.decodeIfPresent(CoopEnemyInfoId.self, forKey: .estimatedKingSalmonId)
    }

    init(schedule: StageScheduleQuery.CoopSchedule) {
        stageId = schedule.setting.coopStage.id
        startTime = schedule.startTime
        endTime = schedule.endTime
        mode = schedule.setting.isCoopSetting == .CoopTeamContestSetting ? .LIMITED : .REGULAR
        rule = {
            switch schedule.setting.isCoopSetting {
            case .CoopBigRunSetting:
                return .BIG_RUN
            case .CoopNormalSetting:
                return .REGULAR
            case .CoopTeamContestSetting:
                return .TEAM_CONTEST
            }
        }()
        weaponList = schedule.setting.weapons.map { WeaponInfoMainId(key: $0.image.hash) }
        rareWeapon = nil
        setting = schedule.setting.isCoopSetting
        estimatedKingSalmonId = nil
    }
}
