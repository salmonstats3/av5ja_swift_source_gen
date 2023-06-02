//
//  SwiftUI+Text.swift
//  
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import SwiftUI

public extension Text {
    init(bundle: LocalizedType) {
        self.init(NSLocalizedString(bundle.rawValue, bundle: .module, comment: ""))
    }

    init(_ value: CoopEnemyInfoId) {
        let index: Int = CoopEnemyInfoId.allCases.firstIndex(of: value) ?? 0
        let enemyKey = CoopEnemyInfoKey.allCases[index]
        self.init(NSLocalizedString("CoopEnemy_\(String(describing: enemyKey))", bundle: .module, comment: ""))
    }

    init(_ value: CoopEnemyInfoKey) {
        self.init(NSLocalizedString("CoopEnemy_\(String(describing: value))", bundle: .module, comment: ""))
    }

    /// 称号をテキストに変換
    init(_ value: CoopGradeId?) {
        if let value {
            self.init(NSLocalizedString("CoopGrade_Grade_0\(value.id)", bundle: .module, comment: ""))
        } else {
            self.init("-")
        }
    }

    init(_ waterLevel: CoopWaterLevelId) {
        self.init(NSLocalizedString("CoopHistory_WaveLevel\(waterLevel.rawValue)", bundle: .module, comment: ""))
    }

    init(_ eventType: CoopEventId) {
        if eventType == .WaterLevels {
            self.init("-")
        } else {
            self.init(NSLocalizedString("CoopEvent_\(String(describing: eventType))", bundle: .module, comment: ""))
        }
    }

    /// ステージ名をテキストに変換
    init(_ value: CoopStageId) {
        self.init(NSLocalizedString("CoopStage_\(String(describing: value))", bundle: .module, comment: ""))
    }

    /// 任意のオプショナル型を変換
    init<T: LosslessStringConvertible>(_ value: T?) {
        if let value {
            self.init(verbatim: String(value))
        } else {
            self.init("-")
        }
    }
}

public enum ImageSize: Int, CaseIterable {
    case Regular
    case Header
}
