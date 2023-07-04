//
//  Array.swift
//  SplatNet3
//
//  Created by devonly on 2022/12/31.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        stride(from: 0, to: count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }

    func add<T: Numeric>(_ input: [T]) -> [T] {
        // swiftlint:disable:next force_cast
        zip(self as! [T], input).map { $0.0 + $0.1 }
    }
}

public extension Array where Element: Numeric {
    mutating func add(_ input: [Element]) {
        self = Array(zip(self, input).map { $0.0 + $0.1 })
    }
}

public extension [[Int]] {
    func sum() -> [Int] {
        if let first {
            var sum: [Int] = Element(repeating: 0, count: first.count)
            _ = map { sum = sum.add($0) }
            return sum
        }
        return []
    }
}
