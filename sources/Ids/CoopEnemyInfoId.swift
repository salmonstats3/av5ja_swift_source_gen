//
//  CoopEnemyInfo.swift
//
//  Created by tkgstrator on 2023/06/11
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopEnemyInfoId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .SakelienBomber
    public var id: Int { rawValue }

    case SakelienBomber = 4
    case SakelienCupTwins = 5
    case SakelienShield = 6
    case SakelienSnake = 7
    case SakelienTower = 8
    case Sakediver = 9
    case Sakerocket = 10
    case SakePillar = 11
    case SakeDolphin = 12
    case SakeArtillery = 13
    case SakeSaucer = 14
    case SakelienGolden = 15
    case Sakedozer = 17
    case SakeBigMouth = 20
    case SakelienGiant = 23
    case SakeRope = 24
}