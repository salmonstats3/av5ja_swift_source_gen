//
//  CoopStageHeader.swift
//  SplatNet3
//
//  Created by devonly on 2023/01/30.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

public extension CoopStageId {
    var description: String {
        NSLocalizedString(String(describing: self), bundle: .module, comment: "")
    }

    static let allCases: [CoopStageId] = [
        .Shakeup,
        .Shakespiral,
        .Shakeship,
        .Shakedent,
        .Shakehighway,
        .Carousel,
        .Upland,
        .Temple
    ]

    /// 通常のステージ
    static let regular: [CoopStageId] = allCases.filter { $0.rawValue > 0 && $0.rawValue < 100 }
    /// ビッグラン用のステージ
    static let bigRun: [CoopStageId] = allCases.filter { $0.rawValue >= 100 }
}

public extension CoopStageKey {
    static let allCases: [Self] = [
        .Shakeup,
        .Shakespiral,
        .Shakeship,
        .Shakedent,
        .Shakehighway,
        .Carousel,
        .Upland,
        .Temple
    ]
}

@available(iOS 16.0, *)
extension CoopStageKey: Plottable {}

@available(iOS 16.0, *)
extension CoopStageId: Plottable {
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
