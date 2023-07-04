//
//  FileManager.swift
//  SplatNet3
//
//  Created by devonly on 2023/05/27.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public extension FileManager {
    var document: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}
