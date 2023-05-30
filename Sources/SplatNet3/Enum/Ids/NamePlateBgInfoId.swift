//
//  NamePlateBgInfoId.swift
//
//  Created by tkgstrator on 2023/01/30
//  Copyright @2022 Magi, Corporation. All rights reserved.
//

import Foundation

public enum NamePlateBgInfoId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Npl_Tutorial00
	public var id: Int { rawValue }

	case Npl_Tutorial00 = 1
	case Npl_Fsodr00 = 800
	case Npl_Trg_Season01_Lv01 = 901
	case Npl_Trg_Season01_Lv02 = 902
	case Npl_Trg_Season03_Lv01 = 911
	case Npl_Trg_Season03_Lv02 = 912
	case Npl_Mng_Lv01 = 1001
	case Npl_Mng_Lv02 = 1002
	case Npl_Mng_Lv03 = 1003
	case Npl_Coop_Season01_Lv01 = 2001
	case Npl_Coop_Season01_Lv02 = 2002
	case Npl_Coop_Season01_Lv03 = 2003
	case Npl_Coop_Season01_Lv04 = 2004
	case Npl_Coop_Season01_Lv05 = 2005
	case Npl_Coop_Season01_Lv06 = 2006
	case Npl_Coop_Season01_Lv07 = 2007
	case Npl_Coop_Season01_Lv08 = 2008
	case Npl_Coop_Season01_Lv09 = 2009
	case Npl_Coop_Season01_Lv10 = 2010
	case Npl_Coop_Season03_Lv01 = 2101
	case Npl_Coop_Season03_Lv02 = 2102
	case Npl_Coop_Season03_Lv03 = 2103
	case Npl_Coop_Season03_Lv04 = 2104
	case Npl_Lot_Season01_Lv01 = 10_001
	case Npl_Lot_Season02_Lv01 = 10_002
	case Npl_Lot_Season03_Lv01 = 10_003
	case Npl_Catalog_Season01_Lv01 = 11_001
	case Npl_Catalog_Season01_Lv02 = 11_002
	case Npl_Catalog_Season01_Lv03 = 11_003
	case Npl_Catalog_Season01_Lv04 = 11_004
	case Npl_Catalog_Season01_Lv05 = 11_005
	case Npl_Catalog_Season01_Lv06 = 11_006
	case Npl_Catalog_Season01_Lv07 = 11_007
	case Npl_Catalog_Season01_Lv08 = 11_008
	case Npl_Catalog_Season01_Lv09 = 11_009
	case Npl_Catalog_Season01_Lv10 = 11_010
	case Npl_Catalog_Season01_Lv11 = 11_011
	case Npl_Catalog_Season01_Lv12 = 11_012
	case Npl_Catalog_Season01_Lv13 = 11_013
	case Npl_Catalog_Season01_Lv14 = 11_014
	case Npl_Catalog_Season01_Lv15 = 11_015
	case Npl_Catalog_Season01_Lv16 = 11_016
	case Npl_Catalog_Season01_Lv17 = 11_017
	case Npl_Catalog_Season01_Lv18 = 11_018
	case Npl_Catalog_Season01_Lv19 = 11_019
	case Npl_Catalog_Season01_Lv20 = 11_020
	case Npl_Catalog_Season01_Lv21 = 11_021
	case Npl_Catalog_Season01_Lv22 = 11_022
	case Npl_Catalog_Season01_Lv23 = 11_023
	case Npl_Catalog_Season01_Lv24 = 11_024
	case Npl_Catalog_Season01_Lv25 = 11_025
	case Npl_Catalog_Season01_Lv26 = 11_026
	case Npl_Catalog_Season01_Lv27 = 11_027
	case Npl_Catalog_Season01_Lv28 = 11_028
	case Npl_Catalog_Season01_Lv29 = 11_029
	case Npl_Catalog_Season01_Lv30 = 11_030
	case Npl_Catalog_Season01_Lv31 = 11_031
	case Npl_Catalog_Season01_Lv32 = 11_032
	case Npl_Catalog_Season01_Lv33 = 11_033
	case Npl_Catalog_Season01_Lv34 = 11_034
	case Npl_Catalog_Season01_Lv35 = 11_035
	case Npl_Catalog_Season01_Lv36 = 11_036
	case Npl_Catalog_Season01_Lv37 = 11_037
	case Npl_Catalog_Season01_Lv38 = 11_038
	case Npl_Catalog_Season01_Lv39 = 11_039
	case Npl_Catalog_Season01_Lv40 = 11_040
	case Npl_Catalog_Season01_Lv41 = 11_041
	case Npl_Catalog_Season01_Lv42 = 11_042
	case Npl_Catalog_Season01_Lv43 = 11_043
	case Npl_Catalog_Season01_Lv44 = 11_044
	case Npl_Catalog_Season01_Lv45 = 11_045
	case Npl_Catalog_Season01_Lv46 = 11_046
	case Npl_Catalog_Season01_Lv47 = 11_047
	case Npl_Catalog_Season01_Lv48 = 11_048
	case Npl_Catalog_Season01_Lv49 = 11_049
	case Npl_Catalog_Season01_Lv50 = 11_050
	case Npl_Catalog_Season01_Lv51 = 11_051
	case Npl_Catalog_Season01_Lv52 = 11_052
	case Npl_Catalog_Season01_Lv53 = 11_053
	case Npl_Catalog_Season01_Lv54 = 11_054
	case Npl_Catalog_Season01_Lv55 = 11_055
	case Npl_Catalog_Season01_Lv56 = 11_056
	case Npl_Catalog_Season01_Lv57 = 11_057
	case Npl_Catalog_Season01_Lv58 = 11_058
	case Npl_Catalog_Season01_Lv59 = 11_059
	case Npl_Catalog_Season01_Lv60 = 11_060
	case Npl_Catalog_Season01_Lv61 = 11_061
	case Npl_Catalog_Season01_Lv62 = 11_062
	case Npl_Catalog_Season01_Lv63 = 11_063
	case Npl_Catalog_Season01_Lv64 = 11_064
	case Npl_Catalog_Season01_Lv65 = 11_065
	case Npl_Catalog_Season01_Lv66 = 11_066
	case Npl_Catalog_Season01_Lv67 = 11_067
	case Npl_Catalog_Season01_Lv68 = 11_068
	case Npl_Catalog_Season01_Lv69 = 11_069
	case Npl_Catalog_Season01_Lv70 = 11_070
	case Npl_Catalog_Season01_Lv71 = 11_071
	case Npl_Catalog_Season01_Lv72 = 11_072
	case Npl_Catalog_Season01_Lv73 = 11_073
	case Npl_Catalog_Season01_Lv74 = 11_074
	case Npl_Catalog_Season01_Lv75 = 11_075
	case Npl_Catalog_Season01_Lv76 = 11_076
	case Npl_Catalog_Season01_Lv77 = 11_077
	case Npl_Catalog_Season01_Lv78 = 11_078
	case Npl_Catalog_Season01_Lv79 = 11_079
	case Npl_Catalog_Season01_Lv80 = 11_080
	case Npl_Catalog_Season01_Lv81 = 11_081
	case Npl_Catalog_Season01_Lv82 = 11_082
	case Npl_Catalog_Season02_Lv01 = 12_001
	case Npl_Catalog_Season02_Lv02 = 12_002
	case Npl_Catalog_Season03_Lv01 = 13_001
	case Npl_Catalog_Season03_Lv02 = 13_002
}
