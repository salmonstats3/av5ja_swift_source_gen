//
//  SwiftUI+Text.swift
//  
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

public extension Text {
    init(bundle: LocalizedType) {
        self.init(NSLocalizedString(bundle.rawValue, bundle: .module, comment: ""))
    }

    init(_ value: EnemyId) {
        let index: Int = EnemyId.allCases.firstIndex(of: value) ?? 0
        let enemyKey: EnemyKey = EnemyKey.allCases[index]
        self.init(NSLocalizedString("CoopEnemy_\(String(describing: enemyKey))", bundle: .module, comment: ""))
    }

    init(_ value: EnemyKey) {
        self.init(NSLocalizedString("CoopEnemy_\(String(describing: value))", bundle: .module, comment: ""))
    }

    /// 称号をテキストに変換
    init(_ value: GradeId?) {
        if let value = value {
            self.init(NSLocalizedString("CoopGrade_Grade_0\(value.id)", bundle: .module, comment: ""))
        } else {
            self.init("-")
        }
    }

    init(_ waterLevel: WaterLevelId) {
        self.init(NSLocalizedString("CoopHistory_WaveLevel\(waterLevel.rawValue)", bundle: .module, comment: ""))
    }

    init(_ eventType: EventId) {
        if eventType == .Water_Levels {
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
        if let value = value {
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

extension FileManager {
    var document: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}

extension WebImage {
    public init<T: RawRepresentable>(_ value: T) where T: Codable, T.RawValue == Int {
        self.init(url: FileManager.default.document?.appendingPathComponent("\(String(describing: T.self))/\(value.rawValue)", conformingTo: .png))
    }
}

public extension Image {
    init(_ value: CoopStageId) {
        self.init("CoopStage/\(value.rawValue)", bundle: .module)
    }

    init(_ value: CoopStageId, size: ImageSize = .Regular) {
        let namespace: String = size == .Regular ? "CoopStage" : "CoopStageHeader"
        self.init("\(namespace)/\(value.rawValue)", bundle: .module)
    }

    init(_ value: ScaleType) {
        self.init("Scale/\(value.rawValue)", bundle: .module)
    }
}
