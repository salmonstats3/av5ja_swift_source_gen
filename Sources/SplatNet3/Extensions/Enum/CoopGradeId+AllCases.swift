//
//  CoopGradeId+AllCases.swift
//  SplatNet3
//
//  Created by devonly on 2023/06/02.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

public extension CoopGradeId {
    var description: String {
        NSLocalizedString(String(describing: self), bundle: .module, comment: "")
    }
}

@available(iOS 16.0, *)
extension CoopGradeId: Plottable {
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
