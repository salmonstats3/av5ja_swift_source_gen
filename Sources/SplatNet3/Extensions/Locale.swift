//
//  Locale.swift
//  
//
//  Created by devonly on 2023/02/20.
//

import Foundation

extension Locale {
    static var languageSP3Code: LocaleType {
        LocaleType(rawValue: NSLocalizedString(LocalizedType.CommonLanguageCode.rawValue, bundle: .module, comment: "")) ?? .JP
    }

    public static var languageSP3Locale: String {
        NSLocalizedString(LocalizedType.CommonLocale.rawValue, bundle: .module, comment: "")
    }
}