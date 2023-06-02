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

    static func allEvents(isBigRun: Bool = false) -> [CoopEventId] {
        switch isBigRun {
        case true:
            return [
                .WaterLevels,
                .Rush,
                .Griller,
                .TheMothership,
                .Fog
            ]
        case false:
            return CoopEventId.allCases
        }
    }
}
