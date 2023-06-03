//
//  NamePlateBgInfo.swift
//
//  Created by tkgstrator on 2023/06/04
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
    case NplMngLv01 = 1001
    case NplMngLv02 = 1002
    case NplMngLv03 = 1003
    case NplCoopSeason01Lv01 = 2001
    case NplCoopSeason01Lv02 = 2002
    case NplCoopSeason01Lv03 = 2003
    case NplCoopSeason01Lv04 = 2004
    case NplCoopSeason01Lv05 = 2005
    case NplCoopSeason01Lv06 = 2006
    case NplCoopSeason01Lv07 = 2007
    case NplCoopSeason01Lv08 = 2008
    case NplCoopSeason01Lv09 = 2009
    case NplCoopSeason01Lv10 = 2010
    case NplCoopSeason03Lv01 = 2101
    case NplCoopSeason03Lv02 = 2102
    case NplCoopSeason03Lv03 = 2103
    case NplCoopSeason03Lv04 = 2104
    case NplLotSeason01Lv01 = 10001
    case NplLotSeason02Lv01 = 10002
    case NplLotSeason03Lv01 = 10003
    case NplLotSeason04Lv01 = 10004
    case NplCatalogSeason01Lv01 = 11001
    case NplCatalogSeason01Lv02 = 11002
    case NplCatalogSeason01Lv03 = 11003
    case NplCatalogSeason01Lv04 = 11004
    case NplCatalogSeason01Lv05 = 11005
    case NplCatalogSeason01Lv06 = 11006
    case NplCatalogSeason01Lv07 = 11007
    case NplCatalogSeason01Lv08 = 11008
    case NplCatalogSeason01Lv09 = 11009
    case NplCatalogSeason01Lv10 = 11010
    case NplCatalogSeason01Lv11 = 11011
    case NplCatalogSeason01Lv12 = 11012
    case NplCatalogSeason01Lv13 = 11013
    case NplCatalogSeason01Lv14 = 11014
    case NplCatalogSeason01Lv15 = 11015
    case NplCatalogSeason01Lv16 = 11016
    case NplCatalogSeason01Lv17 = 11017
    case NplCatalogSeason01Lv18 = 11018
    case NplCatalogSeason01Lv19 = 11019
    case NplCatalogSeason01Lv20 = 11020
    case NplCatalogSeason01Lv21 = 11021
    case NplCatalogSeason01Lv22 = 11022
    case NplCatalogSeason01Lv23 = 11023
    case NplCatalogSeason01Lv24 = 11024
    case NplCatalogSeason01Lv25 = 11025
    case NplCatalogSeason01Lv26 = 11026
    case NplCatalogSeason01Lv27 = 11027
    case NplCatalogSeason01Lv28 = 11028
    case NplCatalogSeason01Lv29 = 11029
    case NplCatalogSeason01Lv30 = 11030
    case NplCatalogSeason01Lv31 = 11031
    case NplCatalogSeason01Lv32 = 11032
    case NplCatalogSeason01Lv33 = 11033
    case NplCatalogSeason01Lv34 = 11034
    case NplCatalogSeason01Lv35 = 11035
    case NplCatalogSeason01Lv36 = 11036
    case NplCatalogSeason01Lv37 = 11037
    case NplCatalogSeason01Lv38 = 11038
    case NplCatalogSeason01Lv39 = 11039
    case NplCatalogSeason01Lv40 = 11040
    case NplCatalogSeason01Lv41 = 11041
    case NplCatalogSeason01Lv42 = 11042
    case NplCatalogSeason01Lv43 = 11043
    case NplCatalogSeason01Lv44 = 11044
    case NplCatalogSeason01Lv45 = 11045
    case NplCatalogSeason01Lv46 = 11046
    case NplCatalogSeason01Lv47 = 11047
    case NplCatalogSeason01Lv48 = 11048
    case NplCatalogSeason01Lv49 = 11049
    case NplCatalogSeason01Lv50 = 11050
    case NplCatalogSeason01Lv51 = 11051
    case NplCatalogSeason01Lv52 = 11052
    case NplCatalogSeason01Lv53 = 11053
    case NplCatalogSeason01Lv54 = 11054
    case NplCatalogSeason01Lv55 = 11055
    case NplCatalogSeason01Lv56 = 11056
    case NplCatalogSeason01Lv57 = 11057
    case NplCatalogSeason01Lv58 = 11058
    case NplCatalogSeason01Lv59 = 11059
    case NplCatalogSeason01Lv60 = 11060
    case NplCatalogSeason01Lv61 = 11061
    case NplCatalogSeason01Lv62 = 11062
    case NplCatalogSeason01Lv63 = 11063
    case NplCatalogSeason01Lv64 = 11064
    case NplCatalogSeason01Lv65 = 11065
    case NplCatalogSeason01Lv66 = 11066
    case NplCatalogSeason01Lv67 = 11067
    case NplCatalogSeason01Lv68 = 11068
    case NplCatalogSeason01Lv69 = 11069
    case NplCatalogSeason01Lv70 = 11070
    case NplCatalogSeason01Lv71 = 11071
    case NplCatalogSeason01Lv72 = 11072
    case NplCatalogSeason01Lv73 = 11073
    case NplCatalogSeason01Lv74 = 11074
    case NplCatalogSeason01Lv75 = 11075
    case NplCatalogSeason01Lv76 = 11076
    case NplCatalogSeason01Lv77 = 11077
    case NplCatalogSeason01Lv78 = 11078
    case NplCatalogSeason01Lv79 = 11079
    case NplCatalogSeason01Lv80 = 11080
    case NplCatalogSeason01Lv81 = 11081
    case NplCatalogSeason01Lv82 = 11082
    case NplCatalogSeason02Lv01 = 12001
    case NplCatalogSeason02Lv02 = 12002
    case NplCatalogSeason03Lv01 = 13001
    case NplCatalogSeason03Lv02 = 13002
    case NplCatalogSeason04Lv01 = 14001
    case NplCatalogSeason04Lv02 = 14002
}