//
//  WeaponInfoMain.swift
//  SplatNet3
//
//  Created by devonly on 2023/01/30.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Charts
import Foundation

public extension WeaponInfoMainId {
    init(key: WeaponInfoMainKey) {
        self = WeaponInfoMainId.allCases[WeaponInfoMainKey.allCases.firstIndex(of: key) ?? 0]
    }

    static let regular: [WeaponInfoMainId] = allCases.filter { $0.rawValue >= 0 && $0.rawValue <= 20000 }

    static let rare: [WeaponInfoMainId] = allCases.filter { $0.rawValue >= 20000 }
}

public extension WeaponInfoMainKey {}
