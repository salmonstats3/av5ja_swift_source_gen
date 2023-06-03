//
//  CoopEventId.swift
//
//  Created by tkgstrator on 2023/06/02
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

extension CoopGradeId {
    public var description: String {
        NSLocalizedString("CoopGrade_Grade_0\(rawValue)", bundle: .module, comment: "")
    }
}

@available(iOS 16.0, *)
extension CoopGradeId: Plottable {
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
