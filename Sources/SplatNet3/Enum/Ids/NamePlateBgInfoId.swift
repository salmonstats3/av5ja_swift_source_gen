//
//  NamePlateBgInfo.swift
//
//  Created by tkgstrator on 2023/06/02
//  Copyright @2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum NamePlateBgInfoId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .NplTutorial00
    public var id: Int { rawValue }

    case NplTutorial00 = 1
    case NplFsodr00 = 800
    case NplTrgSeason01Lv01 = 901
    case NplTrgSeason01Lv02 = 902
    case NplTrgSeason03Lv01 = 911
    case NplTrgSeason03Lv02 = 912
    case NplMngLv01 = 1_001
    case NplMngLv02 = 1_002
    case NplMngLv03 = 1_003
    case NplCoopSeason01Lv01 = 2_001
    case NplCoopSeason01Lv02 = 2_002
    case NplCoopSeason01Lv03 = 2_003
    case NplCoopSeason01Lv04 = 2_004
    case NplCoopSeason01Lv05 = 2_005
    case NplCoopSeason01Lv06 = 2_006
    case NplCoopSeason01Lv07 = 2_007
    case NplCoopSeason01Lv08 = 2_008
    case NplCoopSeason01Lv09 = 2_009
    case NplCoopSeason01Lv10 = 2_010
    case NplCoopSeason03Lv01 = 2_101
    case NplCoopSeason03Lv02 = 2_102
    case NplCoopSeason03Lv03 = 2_103
    case NplCoopSeason03Lv04 = 2_104
    case NplLotSeason01Lv01 = 10_001
    case NplLotSeason02Lv01 = 10_002
    case NplLotSeason03Lv01 = 10_003
    case NplLotSeason04Lv01 = 10_004
    case NplCatalogSeason01Lv01 = 11_001
    case NplCatalogSeason01Lv02 = 11_002
    case NplCatalogSeason01Lv03 = 11_003
    case NplCatalogSeason01Lv04 = 11_004
    case NplCatalogSeason01Lv05 = 11_005
    case NplCatalogSeason01Lv06 = 11_006
    case NplCatalogSeason01Lv07 = 11_007
    case NplCatalogSeason01Lv08 = 11_008
    case NplCatalogSeason01Lv09 = 11_009
    case NplCatalogSeason01Lv10 = 11_010
    case NplCatalogSeason01Lv11 = 11_011
    case NplCatalogSeason01Lv12 = 11_012
    case NplCatalogSeason01Lv13 = 11_013
    case NplCatalogSeason01Lv14 = 11_014
    case NplCatalogSeason01Lv15 = 11_015
    case NplCatalogSeason01Lv16 = 11_016
    case NplCatalogSeason01Lv17 = 11_017
    case NplCatalogSeason01Lv18 = 11_018
    case NplCatalogSeason01Lv19 = 11_019
    case NplCatalogSeason01Lv20 = 11_020
    case NplCatalogSeason01Lv21 = 11_021
    case NplCatalogSeason01Lv22 = 11_022
    case NplCatalogSeason01Lv23 = 11_023
    case NplCatalogSeason01Lv24 = 11_024
    case NplCatalogSeason01Lv25 = 11_025
    case NplCatalogSeason01Lv26 = 11_026
    case NplCatalogSeason01Lv27 = 11_027
    case NplCatalogSeason01Lv28 = 11_028
    case NplCatalogSeason01Lv29 = 11_029
    case NplCatalogSeason01Lv30 = 11_030
    case NplCatalogSeason01Lv31 = 11_031
    case NplCatalogSeason01Lv32 = 11_032
    case NplCatalogSeason01Lv33 = 11_033
    case NplCatalogSeason01Lv34 = 11_034
    case NplCatalogSeason01Lv35 = 11_035
    case NplCatalogSeason01Lv36 = 11_036
    case NplCatalogSeason01Lv37 = 11_037
    case NplCatalogSeason01Lv38 = 11_038
    case NplCatalogSeason01Lv39 = 11_039
    case NplCatalogSeason01Lv40 = 11_040
    case NplCatalogSeason01Lv41 = 11_041
    case NplCatalogSeason01Lv42 = 11_042
    case NplCatalogSeason01Lv43 = 11_043
    case NplCatalogSeason01Lv44 = 11_044
    case NplCatalogSeason01Lv45 = 11_045
    case NplCatalogSeason01Lv46 = 11_046
    case NplCatalogSeason01Lv47 = 11_047
    case NplCatalogSeason01Lv48 = 11_048
    case NplCatalogSeason01Lv49 = 11_049
    case NplCatalogSeason01Lv50 = 11_050
    case NplCatalogSeason01Lv51 = 11_051
    case NplCatalogSeason01Lv52 = 11_052
    case NplCatalogSeason01Lv53 = 11_053
    case NplCatalogSeason01Lv54 = 11_054
    case NplCatalogSeason01Lv55 = 11_055
    case NplCatalogSeason01Lv56 = 11_056
    case NplCatalogSeason01Lv57 = 11_057
    case NplCatalogSeason01Lv58 = 11_058
    case NplCatalogSeason01Lv59 = 11_059
    case NplCatalogSeason01Lv60 = 11_060
    case NplCatalogSeason01Lv61 = 11_061
    case NplCatalogSeason01Lv62 = 11_062
    case NplCatalogSeason01Lv63 = 11_063
    case NplCatalogSeason01Lv64 = 11_064
    case NplCatalogSeason01Lv65 = 11_065
    case NplCatalogSeason01Lv66 = 11_066
    case NplCatalogSeason01Lv67 = 11_067
    case NplCatalogSeason01Lv68 = 11_068
    case NplCatalogSeason01Lv69 = 11_069
    case NplCatalogSeason01Lv70 = 11_070
    case NplCatalogSeason01Lv71 = 11_071
    case NplCatalogSeason01Lv72 = 11_072
    case NplCatalogSeason01Lv73 = 11_073
    case NplCatalogSeason01Lv74 = 11_074
    case NplCatalogSeason01Lv75 = 11_075
    case NplCatalogSeason01Lv76 = 11_076
    case NplCatalogSeason01Lv77 = 11_077
    case NplCatalogSeason01Lv78 = 11_078
    case NplCatalogSeason01Lv79 = 11_079
    case NplCatalogSeason01Lv80 = 11_080
    case NplCatalogSeason01Lv81 = 11_081
    case NplCatalogSeason01Lv82 = 11_082
    case NplCatalogSeason02Lv01 = 12_001
    case NplCatalogSeason02Lv02 = 12_002
    case NplCatalogSeason03Lv01 = 13_001
    case NplCatalogSeason03Lv02 = 13_002
    case NplCatalogSeason04Lv01 = 14_001
    case NplCatalogSeason04Lv02 = 14_002
}
