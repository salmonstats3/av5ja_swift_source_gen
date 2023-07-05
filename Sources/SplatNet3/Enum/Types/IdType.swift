//
//  IdType.swift
//  SplatNet3
//
//  Created by devonly on 2022/12/03.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum IdType: String, CaseIterable, Codable, Identifiable {
    public var id: String { rawValue }

    case CoopHistoryDetail
    case CoopPlayer
}
