//
//  CoopEvent+AllCases.swift
//
//  Created by tkgstrator on 2023/01/30
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

public extension CoopWaterLevelId {
    var description: String {
        NSLocalizedString("CoopEvent_\(String(describing: self))", bundle: .module, comment: "")
    }

    public static var allCases: [WaterLevelId] = [
        .HighTide,
        .NormalTide,
        .LowTide
    ]

    public static func allTides(_ eventId: EventId, isBigRun: Bool = false) -> [WaterLevelId] {
        switch eventId {
        case .WaterLevels:
            return [.HighTide, .NormalTide, .LowTide]
        case .Rush, .Goldie_Seeking, .Griller:
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
