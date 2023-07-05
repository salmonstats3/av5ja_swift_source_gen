//
//  CoopEnemyInfoId+AllCases.swift
//  SplatNet3
//
//  Created by devonly on 2023/01/30.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

public extension CoopEnemyInfoId {
    var description: String {
        NSLocalizedString(String(describing: self), bundle: .module, comment: "")
    }

    static let regular: [CoopEnemyInfoId] = [
        .SakelienBomber,
        .SakelienCupTwins,
        .SakelienShield,
        .SakelienSnake,
        .SakelienTower,
        .Sakediver,
        .Sakerocket,
        .SakePillar,
        .SakeDolphin,
        .SakeArtillery,
        .SakeSaucer,
        .SakelienGolden,
        .Sakedozer,
        .SakeBigMouth
    ]

    static let boss: [CoopEnemyInfoId] = [
        .SakelienGiant,
        .SakeRope
    ]
}

public extension CoopEnemyInfoKey {
    var localized: String {
        NSLocalizedString(String(describing: self), bundle: .module, comment: "")
    }
}

@available(iOS 16.0, *)
extension CoopEnemyInfoId: Plottable {
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

@available(iOS 16.0, *)
extension CoopEnemyInfoKey: Plottable {}