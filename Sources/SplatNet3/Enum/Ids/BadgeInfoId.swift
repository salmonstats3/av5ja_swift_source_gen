//
//  BadgeInfoId.swift
//  SplatNet3
//
//  Created by tkgstrator on 2023/06/02.
//  Copyright 2023 Magi, Corporation. All rights reserved.
//

import Foundation

// swiftlint:disable type_body_length file_length
public enum BadgeInfoId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .WeaponLevelShooterShort00Lv00
    public var id: Int { rawValue }

    case WeaponLevelShooterShort00Lv00 = 1_000_000
    case WeaponLevelShooterShort00Lv01 = 1_000_001
    case WeaponLevelShooterShort01Lv00 = 1_000_010
    case WeaponLevelShooterShort01Lv01 = 1_000_011
    case WeaponLevelShooterFirst00Lv00 = 1_000_100
    case WeaponLevelShooterFirst00Lv01 = 1_000_101
    case WeaponLevelShooterFirst01Lv00 = 1_000_110
    case WeaponLevelShooterFirst01Lv01 = 1_000_111
    case WeaponLevelShooterPrecision00Lv00 = 1_000_200
    case WeaponLevelShooterPrecision00Lv01 = 1_000_201
    case WeaponLevelShooterPrecision01Lv00 = 1_000_210
    case WeaponLevelShooterPrecision01Lv01 = 1_000_211
    case WeaponLevelShooterBlaze00Lv00 = 1_000_300
    case WeaponLevelShooterBlaze00Lv01 = 1_000_301
    case WeaponLevelShooterBlaze01Lv00 = 1_000_310
    case WeaponLevelShooterBlaze01Lv01 = 1_000_311
    case WeaponLevelShooterNormal00Lv00 = 1_000_400
    case WeaponLevelShooterNormal00Lv01 = 1_000_401
    case WeaponLevelShooterNormal01Lv00 = 1_000_410
    case WeaponLevelShooterNormal01Lv01 = 1_000_411
    case WeaponLevelShooterNormalHLv00 = 1_000_450
    case WeaponLevelShooterNormalHLv01 = 1_000_451
    case WeaponLevelShooterGravity00Lv00 = 1_000_500
    case WeaponLevelShooterGravity00Lv01 = 1_000_501
    case WeaponLevelShooterQuickMiddle00Lv00 = 1_000_600
    case WeaponLevelShooterQuickMiddle00Lv01 = 1_000_601
    case WeaponLevelShooterQuickMiddle01Lv00 = 1_000_610
    case WeaponLevelShooterQuickMiddle01Lv01 = 1_000_611
    case WeaponLevelShooterExpert00Lv00 = 1_000_700
    case WeaponLevelShooterExpert00Lv01 = 1_000_701
    case WeaponLevelShooterExpert01Lv00 = 1_000_710
    case WeaponLevelShooterExpert01Lv01 = 1_000_711
    case WeaponLevelShooterHeavy00Lv00 = 1_000_800
    case WeaponLevelShooterHeavy00Lv01 = 1_000_801
    case WeaponLevelShooterHeavy01Lv00 = 1_000_810
    case WeaponLevelShooterHeavy01Lv01 = 1_000_811
    case WeaponLevelShooterLong00Lv00 = 1_000_900
    case WeaponLevelShooterLong00Lv01 = 1_000_901
    case WeaponLevelShooterLong01Lv00 = 1_000_910
    case WeaponLevelShooterLong01Lv01 = 1_000_911
    case WeaponLevelShooterQuickLong00Lv00 = 1_001_000
    case WeaponLevelShooterQuickLong00Lv01 = 1_001_001
    case WeaponLevelShooterQuickLong01Lv00 = 1_001_010
    case WeaponLevelShooterQuickLong01Lv01 = 1_001_011
    case WeaponLevelBlasterShort00Lv00 = 1_002_000
    case WeaponLevelBlasterShort00Lv01 = 1_002_001
    case WeaponLevelBlasterShort01Lv00 = 1_002_010
    case WeaponLevelBlasterShort01Lv01 = 1_002_011
    case WeaponLevelBlasterMiddle00Lv00 = 1_002_100
    case WeaponLevelBlasterMiddle00Lv01 = 1_002_101
    case WeaponLevelBlasterLong00Lv00 = 1_002_200
    case WeaponLevelBlasterLong00Lv01 = 1_002_201
    case WeaponLevelBlasterLightShort00Lv00 = 1_002_300
    case WeaponLevelBlasterLightShort00Lv01 = 1_002_301
    case WeaponLevelBlasterLightShort01Lv00 = 1_002_310
    case WeaponLevelBlasterLightShort01Lv01 = 1_002_311
    case WeaponLevelBlasterLight00Lv00 = 1_002_400
    case WeaponLevelBlasterLight00Lv01 = 1_002_401
    case WeaponLevelBlasterLight01Lv00 = 1_002_410
    case WeaponLevelBlasterLight01Lv01 = 1_002_411
    case WeaponLevelBlasterLightLong00Lv00 = 1_002_500
    case WeaponLevelBlasterLightLong00Lv01 = 1_002_501
    case WeaponLevelBlasterLightLong01Lv00 = 1_002_510
    case WeaponLevelBlasterLightLong01Lv01 = 1_002_511
    case WeaponLevelBlasterPrecision00Lv00 = 1_002_600
    case WeaponLevelBlasterPrecision00Lv01 = 1_002_601
    case WeaponLevelShooterTripleQuick00Lv00 = 1_003_000
    case WeaponLevelShooterTripleQuick00Lv01 = 1_003_001
    case WeaponLevelShooterTripleQuick01Lv00 = 1_003_010
    case WeaponLevelShooterTripleQuick01Lv01 = 1_003_011
    case WeaponLevelShooterTripleMiddle00Lv00 = 1_003_100
    case WeaponLevelShooterTripleMiddle00Lv01 = 1_003_101
    case WeaponLevelShooterTripleMiddle01Lv00 = 1_003_110
    case WeaponLevelShooterTripleMiddle01Lv01 = 1_003_111
    case WeaponLevelShooterFlash00Lv00 = 1_004_000
    case WeaponLevelShooterFlash00Lv01 = 1_004_001
    case WeaponLevelRollerCompact00Lv00 = 1_010_000
    case WeaponLevelRollerCompact00Lv01 = 1_010_001
    case WeaponLevelRollerCompact01Lv00 = 1_010_010
    case WeaponLevelRollerCompact01Lv01 = 1_010_011
    case WeaponLevelRollerNormal00Lv00 = 1_010_100
    case WeaponLevelRollerNormal00Lv01 = 1_010_101
    case WeaponLevelRollerNormal01Lv00 = 1_010_110
    case WeaponLevelRollerNormal01Lv01 = 1_010_111
    case WeaponLevelRollerHeavy00Lv00 = 1_010_200
    case WeaponLevelRollerHeavy00Lv01 = 1_010_201
    case WeaponLevelRollerHunter00Lv00 = 1_010_300
    case WeaponLevelRollerHunter00Lv01 = 1_010_301
    case WeaponLevelRollerWide00Lv00 = 1_010_400
    case WeaponLevelRollerWide00Lv01 = 1_010_401
    case WeaponLevelRollerWide01Lv00 = 1_010_410
    case WeaponLevelRollerWide01Lv01 = 1_010_411
    case WeaponLevelBrushMini00Lv00 = 1_011_000
    case WeaponLevelBrushMini00Lv01 = 1_011_001
    case WeaponLevelBrushMini01Lv00 = 1_011_010
    case WeaponLevelBrushMini01Lv01 = 1_011_011
    case WeaponLevelBrushNormal00Lv00 = 1_011_100
    case WeaponLevelBrushNormal00Lv01 = 1_011_101
    case WeaponLevelBrushHeavy00Lv00 = 1_011_200
    case WeaponLevelBrushHeavy00Lv01 = 1_011_201
    case WeaponLevelChargerQuick00Lv00 = 1_020_000
    case WeaponLevelChargerQuick00Lv01 = 1_020_001
    case WeaponLevelChargerNormal00Lv00 = 1_020_100
    case WeaponLevelChargerNormal00Lv01 = 1_020_101
    case WeaponLevelChargerNormal01Lv00 = 1_020_110
    case WeaponLevelChargerNormal01Lv01 = 1_020_111
    case WeaponLevelChargerNormalScope00Lv00 = 1_020_200
    case WeaponLevelChargerNormalScope00Lv01 = 1_020_201
    case WeaponLevelChargerNormalScope01Lv00 = 1_020_210
    case WeaponLevelChargerNormalScope01Lv01 = 1_020_211
    case WeaponLevelChargerLong00Lv00 = 1_020_300
    case WeaponLevelChargerLong00Lv01 = 1_020_301
    case WeaponLevelChargerLongScope00Lv00 = 1_020_400
    case WeaponLevelChargerLongScope00Lv01 = 1_020_401
    case WeaponLevelChargerLight00Lv00 = 1_020_500
    case WeaponLevelChargerLight00Lv01 = 1_020_501
    case WeaponLevelChargerKeeper00Lv00 = 1_020_600
    case WeaponLevelChargerKeeper00Lv01 = 1_020_601
    case WeaponLevelChargerPencil00Lv00 = 1_020_700
    case WeaponLevelChargerPencil00Lv01 = 1_020_701
    case WeaponLevelSlosherStrong00Lv00 = 1_030_000
    case WeaponLevelSlosherStrong00Lv01 = 1_030_001
    case WeaponLevelSlosherStrong01Lv00 = 1_030_010
    case WeaponLevelSlosherStrong01Lv01 = 1_030_011
    case WeaponLevelSlosherDiffusion00Lv00 = 1_030_100
    case WeaponLevelSlosherDiffusion00Lv01 = 1_030_101
    case WeaponLevelSlosherDiffusion01Lv00 = 1_030_110
    case WeaponLevelSlosherDiffusion01Lv01 = 1_030_111
    case WeaponLevelSlosherLauncher00Lv00 = 1_030_200
    case WeaponLevelSlosherLauncher00Lv01 = 1_030_201
    case WeaponLevelSlosherBathtub00Lv00 = 1_030_300
    case WeaponLevelSlosherBathtub00Lv01 = 1_030_301
    case WeaponLevelSlosherWashtub00Lv00 = 1_030_400
    case WeaponLevelSlosherWashtub00Lv01 = 1_030_401
    case WeaponLevelSpinnerQuick00Lv00 = 1_040_000
    case WeaponLevelSpinnerQuick00Lv01 = 1_040_001
    case WeaponLevelSpinnerQuick01Lv00 = 1_040_010
    case WeaponLevelSpinnerQuick01Lv01 = 1_040_011
    case WeaponLevelSpinnerStandard00Lv00 = 1_040_100
    case WeaponLevelSpinnerStandard00Lv01 = 1_040_101
    case WeaponLevelSpinnerStandard01Lv00 = 1_040_110
    case WeaponLevelSpinnerStandard01Lv01 = 1_040_111
    case WeaponLevelSpinnerHyper00Lv00 = 1_040_200
    case WeaponLevelSpinnerHyper00Lv01 = 1_040_201
    case WeaponLevelSpinnerDownpour00Lv00 = 1_040_300
    case WeaponLevelSpinnerDownpour00Lv01 = 1_040_301
    case WeaponLevelSpinnerSerein00Lv00 = 1_040_400
    case WeaponLevelSpinnerSerein00Lv01 = 1_040_401
    case WeaponLevelManeuverShort00Lv00 = 1_050_000
    case WeaponLevelManeuverShort00Lv01 = 1_050_001
    case WeaponLevelManeuverShort01Lv00 = 1_050_010
    case WeaponLevelManeuverShort01Lv01 = 1_050_011
    case WeaponLevelManeuverNormal00Lv00 = 1_050_100
    case WeaponLevelManeuverNormal00Lv01 = 1_050_101
    case WeaponLevelManeuverGallon00Lv00 = 1_050_200
    case WeaponLevelManeuverGallon00Lv01 = 1_050_201
    case WeaponLevelManeuverDual00Lv00 = 1_050_300
    case WeaponLevelManeuverDual00Lv01 = 1_050_301
    case WeaponLevelManeuverDual01Lv00 = 1_050_310
    case WeaponLevelManeuverDual01Lv01 = 1_050_311
    case WeaponLevelManeuverStepper00Lv00 = 1_050_400
    case WeaponLevelManeuverStepper00Lv01 = 1_050_401
    case WeaponLevelManeuverStepper01Lv00 = 1_050_410
    case WeaponLevelManeuverStepper01Lv01 = 1_050_411
    case WeaponLevelShelterNormal00Lv00 = 1_060_000
    case WeaponLevelShelterNormal00Lv01 = 1_060_001
    case WeaponLevelShelterWide00Lv00 = 1_060_100
    case WeaponLevelShelterWide00Lv01 = 1_060_101
    case WeaponLevelShelterWide01Lv00 = 1_060_110
    case WeaponLevelShelterWide01Lv01 = 1_060_111
    case WeaponLevelShelterCompact00Lv00 = 1_060_200
    case WeaponLevelShelterCompact00Lv01 = 1_060_201
    case WeaponLevelStringerNormal00Lv00 = 1_070_100
    case WeaponLevelStringerNormal00Lv01 = 1_070_101
    case WeaponLevelStringerShort00Lv00 = 1_070_200
    case WeaponLevelStringerShort00Lv01 = 1_070_201
    case WeaponLevelSaberNormal00Lv00 = 1_080_000
    case WeaponLevelSaberNormal00Lv01 = 1_080_001
    case WeaponLevelSaberLite00Lv00 = 1_080_100
    case WeaponLevelSaberLite00Lv01 = 1_080_101
    case WeaponLevelSaberLite01Lv00 = 1_080_110
    case WeaponLevelSaberLite01Lv01 = 1_080_111
    case WinCountWeaponSpSpUltraShotLv00 = 2_000_010
    case WinCountWeaponSpSpUltraShotLv01 = 2_000_011
    case WinCountWeaponSpSpUltraShotLv02 = 2_000_012
    case WinCountWeaponSpSpGreatBarrierLv00 = 2_000_020
    case WinCountWeaponSpSpGreatBarrierLv01 = 2_000_021
    case WinCountWeaponSpSpGreatBarrierLv02 = 2_000_022
    case WinCountWeaponSpSpSuperHookLv00 = 2_000_030
    case WinCountWeaponSpSpSuperHookLv01 = 2_000_031
    case WinCountWeaponSpSpSuperHookLv02 = 2_000_032
    case WinCountWeaponSpSpMultiMissileLv00 = 2_000_040
    case WinCountWeaponSpSpMultiMissileLv01 = 2_000_041
    case WinCountWeaponSpSpMultiMissileLv02 = 2_000_042
    case WinCountWeaponSpSpInkStormLv00 = 2_000_050
    case WinCountWeaponSpSpInkStormLv01 = 2_000_051
    case WinCountWeaponSpSpInkStormLv02 = 2_000_052
    case WinCountWeaponSpSpNiceBallLv00 = 2_000_060
    case WinCountWeaponSpSpNiceBallLv01 = 2_000_061
    case WinCountWeaponSpSpNiceBallLv02 = 2_000_062
    case WinCountWeaponSpSpShockSonarLv00 = 2_000_070
    case WinCountWeaponSpSpShockSonarLv01 = 2_000_071
    case WinCountWeaponSpSpShockSonarLv02 = 2_000_072
    case WinCountWeaponSpSpBlowerLv00 = 2_000_080
    case WinCountWeaponSpSpBlowerLv01 = 2_000_081
    case WinCountWeaponSpSpBlowerLv02 = 2_000_082
    case WinCountWeaponSpSpMicroLaserLv00 = 2_000_090
    case WinCountWeaponSpSpMicroLaserLv01 = 2_000_091
    case WinCountWeaponSpSpMicroLaserLv02 = 2_000_092
    case WinCountWeaponSpSpJetpackLv00 = 2_000_100
    case WinCountWeaponSpSpJetpackLv01 = 2_000_101
    case WinCountWeaponSpSpJetpackLv02 = 2_000_102
    case WinCountWeaponSpSpUltraStampLv00 = 2_000_110
    case WinCountWeaponSpSpUltraStampLv01 = 2_000_111
    case WinCountWeaponSpSpUltraStampLv02 = 2_000_112
    case WinCountWeaponSpSpChariotLv00 = 2_000_120
    case WinCountWeaponSpSpChariotLv01 = 2_000_121
    case WinCountWeaponSpSpChariotLv02 = 2_000_122
    case WinCountWeaponSpSpSkewerLv00 = 2_000_130
    case WinCountWeaponSpSpSkewerLv01 = 2_000_131
    case WinCountWeaponSpSpSkewerLv02 = 2_000_132
    case WinCountWeaponSpSpTripleTornadoLv00 = 2_000_140
    case WinCountWeaponSpSpTripleTornadoLv01 = 2_000_141
    case WinCountWeaponSpSpTripleTornadoLv02 = 2_000_142
    case WinCountWeaponSpSpEnergyStandLv00 = 2_000_150
    case WinCountWeaponSpSpEnergyStandLv01 = 2_000_151
    case WinCountWeaponSpSpEnergyStandLv02 = 2_000_152
    case WinCountWeaponSpSpFireworkLv00 = 2_000_160
    case WinCountWeaponSpSpFireworkLv01 = 2_000_161
    case WinCountWeaponSpSpFireworkLv02 = 2_000_162
    case WinCountWeaponSpSpCastleLv00 = 2_000_170
    case WinCountWeaponSpSpCastleLv01 = 2_000_171
    case WinCountWeaponSpSpCastleLv02 = 2_000_172
    case WinCountPntLv00 = 3_000_000
    case WinCountPntLv01 = 3_000_001
    case WinCountPntLv02 = 3_000_002
    case WinCountVarLv00 = 3_000_100
    case WinCountVarLv01 = 3_000_101
    case WinCountVlfLv00 = 3_000_200
    case WinCountVlfLv01 = 3_000_201
    case WinCountVglLv00 = 3_000_300
    case WinCountVglLv01 = 3_000_301
    case WinCountVclLv00 = 3_000_400
    case WinCountVclLv01 = 3_000_401
    case WinCountTclAtkLv00 = 3_001_000
    case WinCountTclAtkLv01 = 3_001_001
    case WinCountTclDefLv00 = 3_002_000
    case WinCountTclDefLv01 = 3_002_001
    case UdemaeLv00 = 3_100_000
    case UdemaeLv01 = 3_100_001
    case UdemaeLv02 = 3_100_002
    case XRankLv00 = 3_101_000
    case XRankLv01 = 3_101_001
    case XRankLv02 = 3_101_002
    case EventMatchLv00 = 3_101_500
    case EventMatchLv01 = 3_101_501
    case EventMatchLv02 = 3_101_502
    case CatalogueLevelLv00 = 3_102_000
    case CatalogueLevelLv01 = 3_102_001
    case FestRankMax = 3_103_001
    case GearTotalRarityB00Lv00 = 4_000_000
    case GearTotalRarityB00Lv01 = 4_000_001
    case GearTotalRarityB01Lv00 = 4_000_010
    case GearTotalRarityB01Lv01 = 4_000_011
    case GearTotalRarityB02Lv00 = 4_000_020
    case GearTotalRarityB02Lv01 = 4_000_021
    case GearTotalRarityB03Lv00 = 4_000_030
    case GearTotalRarityB03Lv01 = 4_000_031
    case GearTotalRarityB04Lv00 = 4_000_040
    case GearTotalRarityB04Lv01 = 4_000_041
    case GearTotalRarityB05Lv00 = 4_000_050
    case GearTotalRarityB05Lv01 = 4_000_051
    case GearTotalRarityB06Lv00 = 4_000_060
    case GearTotalRarityB06Lv01 = 4_000_061
    case GearTotalRarityB07Lv00 = 4_000_070
    case GearTotalRarityB07Lv01 = 4_000_071
    case GearTotalRarityB08Lv00 = 4_000_080
    case GearTotalRarityB08Lv01 = 4_000_081
    case GearTotalRarityB09Lv00 = 4_000_090
    case GearTotalRarityB09Lv01 = 4_000_091
    case GearTotalRarityB10Lv00 = 4_000_100
    case GearTotalRarityB10Lv01 = 4_000_101
    case GearTotalRarityB11Lv00 = 4_000_110
    case GearTotalRarityB11Lv01 = 4_000_111
    case GearTotalRarityB15Lv00 = 4_000_150
    case GearTotalRarityB15Lv01 = 4_000_151
    case GearTotalRarityB16Lv00 = 4_000_160
    case GearTotalRarityB16Lv01 = 4_000_161
    case GearTotalRarityB17Lv00 = 4_000_170
    case GearTotalRarityB17Lv01 = 4_000_171
    case GearTotalRarityB18Lv00 = 4_000_180
    case GearTotalRarityB18Lv01 = 4_000_181
    case GearTotalRarityB19Lv00 = 4_000_190
    case GearTotalRarityB19Lv01 = 4_000_191
    case GearTotalRarityB20Lv00 = 4_000_200
    case GearTotalRarityB20Lv01 = 4_000_201
    case SpendShopHeadLv00 = 4_100_000
    case SpendShopHeadLv01 = 4_100_001
    case SpendShopHeadFsodrLv00 = 4_100_010
    case SpendShopHeadFsodrLv01 = 4_100_011
    case SpendShopClothesLv00 = 4_100_100
    case SpendShopClothesLv01 = 4_100_101
    case SpendShopClothesFsodrLv00 = 4_100_110
    case SpendShopClothesFsodrLv01 = 4_100_111
    case SpendShopShoesLv00 = 4_100_200
    case SpendShopShoesLv01 = 4_100_201
    case SpendShopShoesFsodrLv00 = 4_100_210
    case SpendShopShoesFsodrLv01 = 4_100_211
    case SpendShopGoodsLv00 = 4_100_300
    case SpendShopGoodsLv01 = 4_100_301
    case OrderVendorLv00 = 4_100_400
    case OrderVendorLv01 = 4_100_401
    case OrderVendorFsodrLv00 = 4_100_410
    case OrderVendorFsodrLv01 = 4_100_411
    case OrderFoodLv00 = 4_100_500
    case OrderFoodLv01 = 4_100_501
    case OrderFoodLv02 = 4_100_502
    case SpendLotteryLv00 = 4_100_600
    case SpendLotteryLv01 = 4_100_601
    case SpendLotteryLv02 = 4_100_602
    case LimitedRewardLotteryLv00 = 4_100_700
    case LimitedRewardLotteryLv01 = 4_100_701
    case LimitedRewardLotteryLv02 = 4_100_702
    case PlayerRankLv00 = 4_100_800
    case PlayerRankLv01 = 4_100_801
    case PlayerRankLv02 = 4_100_802
    case PlayerRankLv03 = 4_100_803
    case PlayerRankLv04 = 4_100_804
    case PlayerRankLv05 = 4_100_805
    case PlayerRankLv06 = 4_100_806
    case PlayerRankLv07 = 4_100_807
    case PlayerRankLv08 = 4_100_808
    case PlayerRankLv09 = 4_100_809
    case PlayerRankLv10 = 4_100_810
    case PlayerRankLv11 = 4_100_811
    case CoopGradeNormalShakeupLv00 = 5_000_010
    case CoopGradeNormalShakeupLv01 = 5_000_011
    case CoopGradeNormalShakeupLv02 = 5_000_012
    case CoopGradeNormalShakeupLv03 = 5_000_013
    case CoopGradeNormalShakespiralLv00 = 5_000_020
    case CoopGradeNormalShakespiralLv01 = 5_000_021
    case CoopGradeNormalShakespiralLv02 = 5_000_022
    case CoopGradeNormalShakespiralLv03 = 5_000_023
    case CoopGradeNormalShakeshipLv00 = 5_000_060
    case CoopGradeNormalShakeshipLv01 = 5_000_061
    case CoopGradeNormalShakeshipLv02 = 5_000_062
    case CoopGradeNormalShakeshipLv03 = 5_000_063
    case CoopGradeNormalShakedentLv00 = 5_000_070
    case CoopGradeNormalShakedentLv01 = 5_000_071
    case CoopGradeNormalShakedentLv02 = 5_000_072
    case CoopGradeNormalShakedentLv03 = 5_000_073
    case CoopGradeNormalShakehighwayLv00 = 5_000_080
    case CoopGradeNormalShakehighwayLv01 = 5_000_081
    case CoopGradeNormalShakehighwayLv02 = 5_000_082
    case CoopGradeNormalShakehighwayLv03 = 5_000_083
    case TotalKumaPointLv00 = 5_100_000
    case TotalKumaPointLv01 = 5_100_001
    case TotalKumaPointLv02 = 5_100_002
    case CoopClearDangerRateMax = 5_110_000
    case CoopRareEnemyKillNumSakelienBomberLv00 = 5_200_000
    case CoopRareEnemyKillNumSakelienBomberLv01 = 5_200_001
    case CoopRareEnemyKillNumSakelienBomberLv02 = 5_200_002
    case CoopRareEnemyKillNumSakelienSnakeLv00 = 5_200_010
    case CoopRareEnemyKillNumSakelienSnakeLv01 = 5_200_011
    case CoopRareEnemyKillNumSakelienSnakeLv02 = 5_200_012
    case CoopRareEnemyKillNumSakelienShieldLv00 = 5_200_020
    case CoopRareEnemyKillNumSakelienShieldLv01 = 5_200_021
    case CoopRareEnemyKillNumSakelienShieldLv02 = 5_200_022
    case CoopRareEnemyKillNumSakelienTowerLv00 = 5_200_030
    case CoopRareEnemyKillNumSakelienTowerLv01 = 5_200_031
    case CoopRareEnemyKillNumSakelienTowerLv02 = 5_200_032
    case CoopRareEnemyKillNumSakediverLv00 = 5_200_040
    case CoopRareEnemyKillNumSakediverLv01 = 5_200_041
    case CoopRareEnemyKillNumSakediverLv02 = 5_200_042
    case CoopRareEnemyKillNumSakerocketLv00 = 5_200_050
    case CoopRareEnemyKillNumSakerocketLv01 = 5_200_051
    case CoopRareEnemyKillNumSakerocketLv02 = 5_200_052
    case CoopRareEnemyKillNumSakelienCupTwinsLv00 = 5_200_060
    case CoopRareEnemyKillNumSakelienCupTwinsLv01 = 5_200_061
    case CoopRareEnemyKillNumSakelienCupTwinsLv02 = 5_200_062
    case CoopRareEnemyKillNumSakePillarLv00 = 5_200_070
    case CoopRareEnemyKillNumSakePillarLv01 = 5_200_071
    case CoopRareEnemyKillNumSakePillarLv02 = 5_200_072
    case CoopRareEnemyKillNumSakeDolphinLv00 = 5_200_080
    case CoopRareEnemyKillNumSakeDolphinLv01 = 5_200_081
    case CoopRareEnemyKillNumSakeDolphinLv02 = 5_200_082
    case CoopRareEnemyKillNumSakeSaucerLv00 = 5_200_090
    case CoopRareEnemyKillNumSakeSaucerLv01 = 5_200_091
    case CoopRareEnemyKillNumSakeSaucerLv02 = 5_200_092
    case CoopRareEnemyKillNumSakeArtilleryLv00 = 5_200_100
    case CoopRareEnemyKillNumSakeArtilleryLv01 = 5_200_101
    case CoopRareEnemyKillNumSakeArtilleryLv02 = 5_200_102
    case CoopBossKillNumSakelienGiantLv00 = 5_210_000
    case CoopBossKillNumSakelienGiantLv01 = 5_210_001
    case CoopBossKillNumSakelienGiantLv02 = 5_210_002
    case CoopBossKillNumSakeRopeLv00 = 5_210_100
    case CoopBossKillNumSakeRopeLv01 = 5_210_101
    case CoopBossKillNumSakeRopeLv02 = 5_210_102
    case CoopBigRunTrophyLv00 = 5_220_000
    case CoopBigRunTrophyLv01 = 5_220_001
    case CoopBigRunTrophyLv02 = 5_220_002
    case CoopContestTrophyLv00 = 5_230_000
    case CoopContestTrophyLv01 = 5_230_001
    case CoopContestTrophyLv02 = 5_230_002
    case MissionLv00 = 6_000_000
    case MissionLv01 = 6_000_001
    case MissionLv02 = 6_000_002
    case MissionLv03 = 6_000_003
    case MissionLv04 = 6_000_004
    case NawaBattlerRankLv00 = 7_000_000
    case NawaBattlerRankLv01 = 7_000_001
    case NawaBattlerRankLv02 = 7_000_002
    case NawaBattlerRankLv03 = 7_000_003
    case NawaBattlerRankLv04 = 7_000_004
    case NawaBattlerRankLv05 = 7_000_005
    case NawaBattlerRankLv06 = 7_000_006
    case NawaBattlerRankLv07 = 7_000_007
    case NawaBattlerRankLv08 = 7_000_008
    case NawaBattlerRankLv09 = 7_000_009
    case NawaBattlerRankLv10 = 7_000_010
    case NawaBattlerRankLv11 = 7_000_011
    case NawaBattlerRankLv12 = 7_000_012
    case NawaBattlerCardNumLv00 = 7_000_100
    case NawaBattlerCardNumLv01 = 7_000_101
    case NawaBattlerCardNumLv02 = 7_000_102
    case NawaBattlerWinAllNpcLevel3 = 7_000_200
}

// swiftlint:enable type_body_length file_length
