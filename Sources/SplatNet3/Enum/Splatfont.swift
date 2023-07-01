//
//  Splatfont.swift
//  
//
//  Created by devonly on 2023/05/27.
//

import Foundation
import SwiftUI

public protocol SPFont: RawRepresentable, CaseIterable, Identifiable where RawValue == String {
    var baseURL: URL { get }
    var fontURL: CFURL { get }
    var fontDescriptor: UIFontDescriptor? { get }
    static func locale(_ locale: LocaleType) -> UIFontDescriptor
    static var fontName: String { get }
}

extension SPFont {
    public var id: String { rawValue }

    public var baseURL: URL {
        URL(unsafeString: "https://api.lp1.av5ja.srv.nintendo.net/static/media")
    }

    public var fontURL: CFURL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            .appendingPathComponent(ResourceURLType.StaticMedia.rawValue, conformingTo: .url)
            .appendingPathComponent(rawValue, conformingTo: .url)
            .appendingPathExtension("woff2") as CFURL
    }

    public var fontDescriptor: UIFontDescriptor? {
        guard let array: CFArray = CTFontManagerCreateFontDescriptorsFromURL(self.fontURL),
              let fonts: [CTFontDescriptor] = array as? [CTFontDescriptor],
              let font: CTFontDescriptor = fonts.first
        else {
            return nil
        }
        return (font as UIFontDescriptor)
    }

    public static var fontName: String {
        String(describing: Self.self)
    }
}

public enum FontType: String, CaseIterable {
    case Splatfont1 = "Splatfont1"
    case Splatfont2 = "Splatfont2"
}

public enum LocaleType: String, CaseIterable {
    case JP = "0"
    case CN = "1"
    case TW = "2"
}

public class Splatfont {
    var splatfont1: UIFontDescriptor
    var splatfont2: UIFontDescriptor

    public static let shared = Splatfont(locale: LocaleType(rawValue: LocalizedType.CommonLanguageCode.description) ?? .JP)

    private init(locale: LocaleType) {
        self.splatfont1 = Splatfont1.locale(locale)
        self.splatfont2 = Splatfont2.locale(locale)
    }

    public func configure(locale: LocaleType) {
        self.splatfont1 = Splatfont1.locale(locale)
        self.splatfont2 = Splatfont2.locale(locale)
    }
}

public enum Splatfont1: String, SPFont {
    case Splatoon1Common                = "3b7ce8b3c19f74921f51"
    case Splatoon1SymbolCommon          = "38ddb9a11cb1f225e092"
    case Splatoon1CJKCommon             = "62441e2d3263b7141ca0"
    case Splatoon1JPHiraganaKatakana    = "7650dccc9af86f19f094"
    case Splatoon1JPLevel1              = "fafc97f04a568e26ba52"
    case Splatoon1JPLevel2              = "225bb1db5962c9d61773"
    case Splatoon1KRkoLevel1            = "a94dd3748648749f4583"
    case Splatoon1KRkoLevel2            = "fcce77dce5655afed7d2"
    case Splatoon1CHzhLevel1            = "6b6af277c3dc45a8cf10"
    case Splatoon1CHzhLevel2            = "a24ca5d538d0b6a0d086"
    case Splatoon1TWzhLevel1            = "e991c1b3c2084df56d18"
    case Splatoon1TWzhLevel2            = "054b111fb7118a083ff7"

    static let Common: [Self] = [
        Splatfont1.Splatoon1Common,
        Splatfont1.Splatoon1SymbolCommon,
        Splatfont1.Splatoon1CJKCommon,
        Splatfont1.Splatoon1JPHiraganaKatakana,
    ]

    public static func locale(_ locale: LocaleType) -> UIFontDescriptor {
        switch locale {
        case .JP:
            return UIFontDescriptor.from(fonts: Splatfont1.Common + [
                Splatfont1.Splatoon1JPLevel1,
                Splatfont1.Splatoon1JPLevel2,
            ])
        case .CN:
            return UIFontDescriptor.from(fonts: Splatfont1.Common + [
                Splatfont1.Splatoon1CHzhLevel1,
                Splatfont1.Splatoon1CHzhLevel2,
            ])
        case .TW:
            return UIFontDescriptor.from(fonts: Splatfont1.Common + [
                Splatfont1.Splatoon1TWzhLevel1,
                Splatfont1.Splatoon1TWzhLevel2,
            ])
        }
    }
}

public enum Splatfont2: String, SPFont {
    case Splatoon2Common                = "4e7b2cad208fa2fc42ca"
    case Splatoon2SymbolCommon          = "93fd6ce98e21ffcf60bb"
    case Splatoon2CJKCommon             = "7dc791c403ed7f33d73e"
    case Splatoon2JPHiraganaKatakana    = "f423b5ce60b7456df1b3"
    case Splatoon2JPLevel1              = "1f43f499aa71ee002067"
    case Splatoon2JPLevel2              = "9742567c70e359573d6d"
    case Splatoon2KRkoLevel1            = "43823c36f04880c807a5"
    case Splatoon2KRkoLevel2            = "5f8850c8a0ecb0e0bad0"
    case Splatoon2CHzhLevel1            = "2b5402a3e1871d28d815"
    case Splatoon2CHzhLevel2            = "f1fae9e976006ec600e1"
    case Splatoon2TWzhLevel1            = "e7cd7449c1194b2e74fc"
    case Splatoon2TWzhLevel2            = "c6e3984575483b178a4f"

    static let Common: [Self] = [
        Splatfont2.Splatoon2SymbolCommon,
        Splatfont2.Splatoon2CJKCommon,
        Splatfont2.Splatoon2JPHiraganaKatakana,
        Splatfont2.Splatoon2Common,
    ]

    public static func locale(_ locale: LocaleType) -> UIFontDescriptor {
        switch locale {
        case .JP:
            return UIFontDescriptor.from(fonts: Splatfont2.Common + [
                Splatfont2.Splatoon2JPLevel1,
                Splatfont2.Splatoon2JPLevel2,
            ])
        case .CN:
            return UIFontDescriptor.from(fonts: Splatfont2.Common + [
                Splatfont2.Splatoon2CHzhLevel1,
                Splatfont2.Splatoon2CHzhLevel2,
            ])
        case .TW:
            return UIFontDescriptor.from(fonts: Splatfont2.Common + [
                Splatfont2.Splatoon2TWzhLevel1,
                Splatfont2.Splatoon2TWzhLevel2,
            ])
        }
    }
}

extension UIFontDescriptor {
    static func from<T: SPFont>(fonts: [T]) -> UIFontDescriptor {
        guard let font: UIFontDescriptor = fonts.first?.fontDescriptor
        else {
            return UIFontDescriptor()
        }
        let descriptor = font
            .addingAttributes([UIFontDescriptor.AttributeName.cascadeList: fonts.map({ $0.fontDescriptor })])
            .addingAttributes([UIFontDescriptor.AttributeName.family: T.fontName])
            .addingAttributes([UIFontDescriptor.AttributeName.matrix: CGAffineTransform(scaleX: 1.0, y: 1.0)])
        print(descriptor.fontAttributes)
        return descriptor
    }
}

struct SplatfontModifier: ViewModifier {
    let fontName: String
    let size: CGFloat
    let locale = LocaleType(rawValue: LocalizedType.CommonLanguageCode.rawValue) ?? .JP

    init(fontName: FontType, size: CGFloat) {
        self.fontName = fontName.rawValue
        self.size = size
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: size))
    }
}

extension UIFont {
    convenience init(_ fontName: FontType, size: CGFloat, locale: LocaleType) {
        switch fontName {
        case .Splatfont1:
            self.init(descriptor: Splatfont1.locale(locale), size: size)
        case .Splatfont2:
            self.init(descriptor: Splatfont2.locale(locale), size: size)
        }
    }
}

extension Font {
    init(_ fontName: FontType, size: CGFloat, locale: LocaleType) {
        self.init(UIFont(fontName, size: size, locale: locale))
    }
}

extension Text {
    /// スプラトゥーンフォントを読み込む
    /// - Parameters:
    ///   - fontName: 1/2
    ///   - size: フォントサイズ
    /// - Returns: View
    public func font(systemName: FontType, size: CGFloat = UIFont.systemFontSize) -> some View {
        switch systemName {
        case .Splatfont1:
            return self.font(Font(UIFont(descriptor: Splatfont.shared.splatfont1, size: size))).frame(height: size)
        case .Splatfont2:
            return self.font(Font(UIFont(descriptor: Splatfont.shared.splatfont2, size: size))).frame(height: size)
        }
    }
}
