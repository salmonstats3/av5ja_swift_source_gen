//
//  Typealias.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/25.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public typealias SpecialType = CoopHistory.SPWeapon<WeaponInfoSpecialKey, WeaponInfoSpecialId>
public typealias SpecialTypes = CoopHistory.Content<WeaponInfoSpecialKey, WeaponInfoSpecialId>
public typealias EnemyType = CoopHistory.Content<CoopEnemyInfoKey, CoopEnemyInfoId>
public typealias WeaponType = Common.Image<WeaponInfoMainKey>
public typealias SkinType = CoopHistory.Content<CoopSkinInfoKey, CoopSkinInfoId>
public typealias GradeType = CoopHistory.Element<CoopGradeId>
// public typealias GearType = Common.Image<GearInfoKey>
public typealias CoopStageType = CoopHistory.Content<CoopStageKey, CoopStageId>
