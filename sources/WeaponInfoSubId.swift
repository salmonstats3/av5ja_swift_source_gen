//
//  WeaponInfoSub.swift
//
//  Created by tkgstrator on 2023/06/02
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum WeaponInfoSubId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Bomb_Splash
    public var id: Int { rawValue }

    case BombSplash = 0
    case BombSuction = 1
    case BombQuick = 2
    case Sprinkler = 3
    case Shield = 4
    case BombFizzy = 5
    case BombCurling = 6
    case BombRobot = 7
    case Beacon = 8
    case PointSensor = 9
    case Trap = 10
    case PoisonMist = 11
    case LineMarker = 12
    case BombTorpedo = 13
    case BombSplashMission = 10000
    case BombSuctionMission = 10001
    case BombQuickMission = 10002
    case BombCurlingMission = 10006
    case BombRobotMission = 10007
    case TrapMission = 10010
    case LineMarkerMission = 10012
    case SalmonBuddy = 10100
    case BombSplashHero = 11000
    case BombQuickHero = 11002
    case BombCurlingHero = 11006
    case BombSplashCoop = 20000
    case BombSplashBigCoop = 21000
    case BombSplashRival = 30000
    case BombQuickRival = 30002
    case BombCurlingRival = 30006
    case BombRobotRival = 30007
}