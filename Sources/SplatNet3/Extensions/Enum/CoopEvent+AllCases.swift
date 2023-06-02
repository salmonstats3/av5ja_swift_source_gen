//
//  CoopEvent+AllCases.swift
//
//  Created by tkgstrator on 2023/01/30
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

public extension CoopEventId {
    var description: String {
        NSLocalizedString("CoopEvent_\(String(describing: self))", bundle: .module, comment: "")
    }

    static func allEvents(isBigRun: Bool = false) -> [Self] {
        switch isBigRun {
        case true:
            return [
                .WaterLevels,
                .Rush,
                .Griller,
                .TheMothership,
                .Fog,
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
        String(self.rawValue)
    }

    public init?(primitivePlottable: String) {
        guard let rawValue = Int(primitivePlottable) else {
            return nil
        }
        self.init(rawValue: rawValue)
    }

    public typealias PrimitivePlottable = String
}
