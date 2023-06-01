//
//  WeaponInfoSub.swift
//
//  Created by tkgstrator on 2023/06/02
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum WeaponInfoSubkey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Bomb_Splash
    public var id: Int { WeaponInfoSubId.allCases[WeaponInfoSubKey.allCases.firstIndex(of: self) ?? 0].rawValue }

    case BombSplash = "fadb7b55199cfb362911b342fee45a3525e66b7a9a02dc46442e40f3551ad924"
    case BombSuction = "519ab1a9489d2002d96ad3c60880eb5393e994c859b21de1eb11536638f80056"
    case BombQuick = "9e108076aa22eb256fb1ff7cfc7dfbd0bb0e82c8dc260ec80732403a453be237"
    case Sprinkler = "7ed7237e4f4213cd36205eb4e01dd03e5ce95a2eb888a2127abbd7ce9379876c"
    case Shield = "480d4be7d61fe52bc31768ffaaffea7ad5db66ba8b699d30623c4726704cc646"
    case BombFizzy = "7f4c10a805aed858940ef0f579c4ce798998d1fcb8ad53d8d9c11a8431f16f2b"
    case BombCurling = "f57319df4b7cb74f27b29da329c50659d6b4a9f5d46efb08a23d279df5ea0ee1"
    case BombRobot = "f402a8f304d6a43c671914b53ebe646fd4e06c9c7ef91d87a7a42948da56ab55"
    case Beacon = "c0973e9afb7dacf07ec29ee321072f4f8cdbec6aab6245ef6a37e3e381451d1e"
    case PointSensor = "290457cfa63d948e0ad3dd245fcdf4c0a7d071e8028cca743bf26994e45f66cf"
    case Trap = "e52817818a06d588d6ba37f52bd9309c61d68dcf08d81b9295a0926c8725c392"
    case PoisonMist = "bece19f4e32dc5a0d9099ab59691bf9a58ac8b7fbff7ea953827d95ca0fb1f90"
    case LineMarker = "b14d213e2077af0df4e393a5904692d7e648879871954420b14a7eb264e61da4"
    case BombTorpedo = "0c31ba142c21d816a857927885914ab91ae836e0b55a9e2bc77ca581fa69ae25"
    case BombSplashMission = "a7faf6665b905e0d97be1f8a2108a259c0e1458f86c1d9df839b0f23d5bfc3c2"
    case BombSuctionMission = "44d3c3fb690ad6754160a45ad0a62f284c667d2a7bb0b83f782efaf448daa44f"
    case BombQuickMission = "fe4d8ba4c46eab9601638dda3992ebe71d3efc4550cf02b87ac2aaad5a44083a"
    case BombCurlingMission = "8d31879c8692155c9ecb213fb5d75c8cdef49c4f4e8f13a1ee732ace9eef2a58"
    case BombRobotMission = "e432f914e71f75ba9d8a15ff9138e4b4672257ac777c6b9ddbe8d8e35303d0ee"
    case TrapMission = "28df583370e9698ec426b3ed852efc362f1c196a865a295af6867af5a25d18f3"
    case LineMarkerMission = "53f737afce1ef706439e3c983d96ab57f6cf26d97db18b68f86046c92350e211"
    case SalmonBuddy = "6a3658b06814b814fec802d77d9f336808c621f95eae9de044cc8353d13e251d"
    case BombSplashHero = "0f9f28f1c020c3d452344b60c18ca0787a76a495102d749ca598e102311bc4e9"
    case BombQuickHero = "c14a89f0aaeeab8af0fba8adf968b83182a6e384ad7eeae662e32c8fb7ae2f95"
    case BombCurlingHero = "b067d0297dfeea326e0e0402a2dd7187ded597373d52d1739be51e7314357168"
    case BombSplashCoop = "5390f37e3318d2382980089d0bd183ee2dbb095bf31bda5446d4e72c99f8fe40"
    case BombSplashBigCoop = "26fc83daaf40ea652d64fb3ef4051189f5b36c033a25385e8186384d24055337"
    case BombSplashRival = "a020b419081d2099b56d80fa34160493f6e7e9f790010283a4a2be3070909f54"
    case BombQuickRival = "5a09f74bf06710f15818423ee2ecd97550669e04d62f8ecf143d8119757eaa2e"
    case BombCurlingRival = "7fe3f76de535c339480869fde891a1b73248a832b3c0dd5681146ad3b9c28429"
    case BombRobotRival = "2724ef40605748e2bc7140543b15665bc19528f342f2210861e880cd8279b25a"
}