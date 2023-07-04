//
//  ServerType.swift
//  SplatNet3
//
//  Created by devonly on 2023/05/25.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum ServerType: String, CaseIterable, Identifiable, Codable {
    public var id: String { rawValue }

    case Imink = "https://api.imink.app"
    case Nxapi = "https://nxapi-znca-api.fancy.org.uk"

    var path: String {
        switch self {
        case .Imink:
            return "f"
        case .Nxapi:
            return "api/znca/f"
        }
    }
}

internal enum IminkType: Int, CaseIterable {
    case app = 2
    case nso = 1
}
