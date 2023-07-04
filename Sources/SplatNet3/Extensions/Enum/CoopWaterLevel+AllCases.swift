//
//  CoopEvent+AllCases.swift
//  SplatNet3
//
//  Created by devonly on 2023/01/30.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

public extension CoopWaterLevelId {
    var description: String {
        NSLocalizedString("CoopHistoryWaveLevel\(rawValue)", bundle: .module, comment: "")
    }

    static var allCases: [CoopWaterLevelId] = [
        .HighTide,
        .NormalTide,
        .LowTide
    ]

    static func allTides(_ eventId: CoopEventId, isBigRun: Bool = false) -> [CoopWaterLevelId] {
        switch eventId {
        case .WaterLevels:
            return [.HighTide, .NormalTide, .LowTide]
        case .Rush, .GoldieSeeking, .Griller:
            return isBigRun ? [.HighTide, .NormalTide, .LowTide] : [.HighTide, .NormalTide]
        case .TheMothership, .Fog:
            return [.HighTide, .NormalTide, .LowTide]
        case .CohockCharge:
            return [.LowTide]
        case .Giant:
            return [.LowTide]
        case .Mudmouth:
            return [.HighTide, .NormalTide]
        }
    }
}
