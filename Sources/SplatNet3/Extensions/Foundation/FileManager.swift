//
//  WebImage.swift
//
//
//  Created by devonly on 2023/05/27.
//

import Foundation

public extension FileManager {
    var document: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}
