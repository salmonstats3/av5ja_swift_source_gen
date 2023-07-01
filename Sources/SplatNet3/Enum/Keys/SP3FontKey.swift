//
//  SP3FontKey.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum SP3WOFFKey: String, UnsafeRawRepresentable {
    public var id: String { rawValue }
    public static var defaultValue: SP3WOFFKey = .Splatoon1Common

    case Splatoon1CHzhLevel1            = "022989c06c63abe87bc3"
    case Splatoon1CHzhLevel2            = "de4ed433f3a563a77d39"
    case Splatoon1CjkCommon             = "5cc9a80c28465394d4c0"
    case Splatoon1Common                = "7d51c9a5ceb62acdef87"
    case Splatoon1JPHiraganaKatakana    = "5dfd95a8f287f6011346"
    case Splatoon1JPLevel1              = "18f96a4da7baed2ce8d3"
    case Splatoon1JPLevel2              = "ff1f78f29c63225e5f03"
    case Splatoon1KRkoLevel1            = "8ebc14686e3acc00cef6"
    case Splatoon1KRkoLevel2            = "760904f7f9d2ba3c443b"
    case Splatoon1SymbolCommon          = "87afad06d2e135f3a7e2"
    case Splatoon1TWzhLevel1            = "e0f81aaccee336db8aed"
    case Splatoon1TWzhLevel2            = "d2dc7d756f3980f72248"
    case Splatoon2CHzhLevel1            = "ffb4c30f4e3d1e8f02b5"
    case Splatoon2CHzhLevel2            = "0c52a2d37a35324f889f"
    case Splatoon2CjkCommon             = "20811cd9b213e088b184"
    case Splatoon2Common                = "cc8d441b26472eca4107"
    case Splatoon2JPHiraganaKatakana    = "f423b5ce60b7456df1b3"
    case Splatoon2JPLevel1              = "f09adb8a9e2d6a941b2c"
    case Splatoon2JPLevel2              = "51068c13ea9a12ab92b8"
    case Splatoon2KRkoLevel1            = "4a9b5fc10e05c91424a3"
    case Splatoon2KRkoLevel2            = "a90266de47158f786c3a"
    case Splatoon2SymbolCommon          = "5d9a97b5292987570b10"
    case Splatoon2TWzhLevel1            = "e0abf1316b5f0818fdb1"
    case Splatoon2TWzhLevel2            = "17e2542547c5bc0f8cde"
}

public enum SP3WOFF2Key: String, UnsafeRawRepresentable {
    public var id: String { rawValue }
    public static var defaultValue: SP3WOFF2Key = .Splatoon1Common

    case Splatoon1CHzhLevel1            = "6b6af277c3dc45a8cf10"
    case Splatoon1CHzhLevel2            = "a24ca5d538d0b6a0d086"
    case Splatoon1CjkCommon             = "62441e2d3263b7141ca0"
    case Splatoon1Common                = "3b7ce8b3c19f74921f51"
    case Splatoon1JPHiraganaKatakana    = "7650dccc9af86f19f094"
    case Splatoon1JPLevel1              = "fafc97f04a568e26ba52"
    case Splatoon1JPLevel2              = "225bb1db5962c9d61773"
    case Splatoon1KRkoLevel1            = "a94dd3748648749f4583"
    case Splatoon1KRkoLevel2            = "fcce77dce5655afed7d2"
    case Splatoon1SymbolCommon          = "38ddb9a11cb1f225e092"
    case Splatoon1TWzhLevel1            = "e991c1b3c2084df56d18"
    case Splatoon1TWzhLevel2            = "054b111fb7118a083ff7"
    case Splatoon2CHzhLevel1            = "2b5402a3e1871d28d815"
    case Splatoon2CHzhLevel2            = "f1fae9e976006ec600e1"
    case Splatoon2CjkCommon             = "7dc791c403ed7f33d73e"
    case Splatoon2Common                = "4e7b2cad208fa2fc42ca"
    case Splatoon2JPHiraganaKatakana    = "f423b5ce60b7456df1b3"
    case Splatoon2JPLevel1              = "1f43f499aa71ee002067"
    case Splatoon2JPLevel2              = "9742567c70e359573d6d"
    case Splatoon2KRkoLevel1            = "43823c36f04880c807a5"
    case Splatoon2KRkoLevel2            = "5f8850c8a0ecb0e0bad0"
    case Splatoon2SymbolCommon          = "93fd6ce98e21ffcf60bb"
    case Splatoon2TWzhLevel1            = "e7cd7449c1194b2e74fc"
    case Splatoon2TWzhLevel2            = "c6e3984575483b178a4f"
}
