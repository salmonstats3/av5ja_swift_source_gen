//
//  EnemyKey.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation
import Charts

public enum EnemyKey: String, UnsafeRawRepresentable {
    public static var defaultValue: Self = .SakelienBomber
    public var id: String { rawValue }

    case SakelienBomber     = "f59fe344bd941f90dc8d3458ffd29b6586c1cffd00864967e7766a5a931dc4f6"
    case SakelienCupTwins   = "03c31763738c5628db6d8e7dd3ba0fd2fcb79a1f47694488b51969375148edde"
    case SakelienShield     = "3a3e2c87b96b92e31ffc59a273b7d6aca20f9941e05ad84d6ae26092a627aa34"
    case SakelienSnake      = "999097a0908a4560f05a16e3f97c07b5d10bed22bee6d2ce0eedb2e6a6dcb9d0"
    case SakelienTower      = "2d740da6f03364c3c289625455374f734fd8a96b25c26fde13912e90f3aea68c"
    case Sakediver          = "fd5abb7a9087c528e45a7a4e29c9c03d673b69d6f0ba2f424f6df8b732d9919a"
    case Sakerocket         = "faed7977b2144ac5979de0ca7d23aefd507e517c3fbe19431054ac5a6ba300fa"
    case SakePillar         = "fb4851c75f62b8b50d9bac2128d6ef1c703c7884b63402762ddf78c1555e364a"
    case SakeDolphin        = "dbbf89da359fd880db49730ecc4f66150b148274aa005e22c1152cbf1a45e378"
    case SakeArtillery      = "2c7a648b4c73f291b5ede9c55f33d4e3f99c263d3a27ef3d2eb2a96d328d66ac"
    case SakeSaucer         = "2185696079cc39328cd69f0570e219f09b61d4a56508260fe97b16347ae8a55f"
    case SakelienGolden     = "a35aa2982499e9a404fdb81f72fbaf553bc47f7682cc67f9b8c32ca9910e2cbf"
    case Sakedozer          = "8cd6dd3e1bb480e2897afdb434315bc78876204a0995c1552084e1d3edfe0536"
    case SakeBigMouth       = "f0dd8c7eb5c2e96f347564cac71affe055f6c45a3339145ecc81287f800759d2"
    case SakelienGiant      = "75f39ca054c76c0c33cd71177780708e679d088c874a66101e9b76b001df8254"
    case SakeRope           = "b742da3433609ceb66aeab20827fefac63c1c1ddbf25c97ae709922e5c04ad77"
}


extension EnemyKey {
    public var localized: String {
        NSLocalizedString("CoopEnemy_\(String(describing: self))", bundle: .module, comment: "")
    }
}

@available(iOS 16.0, *)
extension EnemyKey: Plottable {}
