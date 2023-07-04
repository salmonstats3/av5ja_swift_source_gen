//
//  Sequence.swift
//  SplatNet3
//
//  Created by devonly on 2023/01/01.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }

    func asyncFlatMap<T>(
        _ transform: (Element) async throws -> [T]
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(contentsOf: transform(element))
        }

        return values
    }
}
