//
//  StaticMediaKey.swift
//
//
//  Created by devonly on 2023/05/27.
//

import Foundation

public enum StaticMediaKey: String, UnsafeRawRepresentable {
    public var id: String { rawValue }
    public static var defaultValue: StaticMediaKey = .Ikura

    case Ikura = "efe826cfd1d44d19153f08e19f6caa2a"
    case GoldenIkura = "3aa6fb4ec1534196ede450667c1183dc"
    case Rescue = "c003ffe0a5580e4c8b1bc9df1e0a30d2"
    case Death = "5d447dcfcb3b0c31ffb2efca58a6e799"
    case Coop = "2e4ca1b65a2eb7e4aacf38a8eb88b456"
    case Badge_Gold = "3a55655cdacd6027cb8e559df5b0e1f8"
    case Badge_Silver = "31d659dfdfb16897755cc845d54e5a2e"
    case Badge_Bronze = "c279bbea3ba44b2668c12c201f9f7792"
}
