//
//  Splatfont.swift
//  
//
//  Created by devonly on 2023/05/27.
//

import Foundation

public enum Splatfont: String, CaseIterable, Codable, Identifiable {
    public var id: String { rawValue }
    case Splatoon1JP
    case Splatoon2JP
    case Splatoon1CJK
    case Splatoon2CJK
}
