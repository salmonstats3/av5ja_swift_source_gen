//
//  CoopEventId.swift
//  SplatNet3
//
//  Created by devonly on 2023/01/30.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

public extension CoopEventId {
    var description: String {
        switch self {
        case .WaterLevels:
            return "-"
        case .Rush:
            return NSLocalizedString("CoopEventRush", bundle: .module, comment: "")
        case .GoldieSeeking:
            return NSLocalizedString("CoopEventGeyser", bundle: .module, comment: "")
        case .Griller:
            return NSLocalizedString("CoopEventDozer", bundle: .module, comment: "")
        case .TheMothership:
            return NSLocalizedString("CoopEventHakobiya", bundle: .module, comment: "")
        case .Fog:
            return NSLocalizedString("CoopEventFog", bundle: .module, comment: "")
        case .CohockCharge:
            return NSLocalizedString("CoopEventMissile", bundle: .module, comment: "")
        case .Giant:
            return NSLocalizedString("CoopEventRelay", bundle: .module, comment: "")
        case .Mudmouth:
            return NSLocalizedString("CoopEventTamaire", bundle: .module, comment: "")
        }
    }

    static func allEvents(isBigRun: Bool = false) -> [Self] {
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
            return allCases
        }
    }
}

@available(iOS 16.0, *)
extension EventKey: Plottable {}

@available(iOS 16.0, *)
extension CoopEventId: Plottable {
    public var primitivePlottable: String {
        String(rawValue)
    }

    public init?(primitivePlottable: String) {
        guard let rawValue = Int(primitivePlottable) else {
            return nil
        }
        self.init(rawValue: rawValue)
    }

    public typealias PrimitivePlottable = String
}
