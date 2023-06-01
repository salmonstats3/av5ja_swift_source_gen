//
//  WeaponInfoMain.swift
//
//  Created by tkgstrator on 2023/06/02
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum WeaponInfoMainId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Dummy
    public var id: Int { rawValue }

    case Dummy = -999
    case RandomGold = -2
    case RandomGreen = -1
    case ShooterShortCoop = 0
    case ShooterFirstCoop = 10
    case ShooterPrecisionCoop = 20
    case ShooterBlazeCoop = 30
    case ShooterNormalCoop = 40
    case ShooterGravityCoop = 50
    case ShooterQuickMiddleCoop = 60
    case ShooterExpertCoop = 70
    case ShooterHeavyCoop = 80
    case ShooterLongCoop = 90
    case ShooterQuickLongCoop = 100
    case BlasterShortCoop = 200
    case BlasterMiddleCoop = 210
    case BlasterLongCoop = 220
    case BlasterLightShortCoop = 230
    case BlasterLightCoop = 240
    case BlasterLightLongCoop = 250
    case BlasterPrecisionCoop = 260
    case ShooterTripleQuickCoop = 300
    case ShooterTripleMiddleCoop = 310
    case ShooterFlashCoop = 400
    case RollerCompactCoop = 1000
    case RollerNormalCoop = 1010
    case RollerHeavyCoop = 1020
    case RollerHunterCoop = 1030
    case RollerWideCoop = 1040
    case BrushMiniCoop = 1100
    case BrushNormalCoop = 1110
    case BrushHeavyCoop = 1120
    case ChargerQuickCoop = 2000
    case ChargerNormalCoop = 2010
    case ChargerLongCoop = 2030
    case ChargerLightCoop = 2050
    case ChargerKeeperCoop = 2060
    case ChargerPencilCoop = 2070
    case SlosherStrongCoop = 3000
    case SlosherDiffusionCoop = 3010
    case SlosherLauncherCoop = 3020
    case SlosherBathtubCoop = 3030
    case SlosherWashtubCoop = 3040
    case SpinnerQuickCoop = 4000
    case SpinnerStandardCoop = 4010
    case SpinnerHyperCoop = 4020
    case SpinnerDownpourCoop = 4030
    case SpinnerSereinCoop = 4040
    case ManeuverShortCoop = 5000
    case ManeuverNormalCoop = 5010
    case ManeuverGallonCoop = 5020
    case ManeuverDualCoop = 5030
    case ManeuverStepperCoop = 5040
    case ShelterNormalCoop = 6000
    case ShelterWideCoop = 6010
    case ShelterCompactCoop = 6020
    case StringerNormalCoop = 7010
    case StringerShortCoop = 7020
    case SaberNormalCoop = 8000
    case SaberLiteCoop = 8010
    case BlasterBearCoop = 20900
    case ChargerBearCoop = 22900
    case SlosherBearCoop = 23900
    case ShelterBearCoop = 26900
    case StringerBearCoop = 27900
    case SaberBearCoop = 28900
}