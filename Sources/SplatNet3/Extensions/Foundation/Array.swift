//
//  Array.swift
//  
//
//  Created by devonly on 2022/12/31.
//

import Foundation

public extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }

    func add<T: Numeric>(_ input: [T]) -> [T] {
        zip(self as! [T], input).map({ $0.0 + $0.1 })
    }
}

public extension Array where Element: Numeric {
    mutating func add(_ input: [Element]) {
        self = Array(zip(self, input).map({ $0.0 + $0.1 }))
    }
}

public extension Array where Element == [Int] {
    func sum() -> [Int] {
        if let first = self.first {
            var sum: [Int] = Element(repeating: 0, count: first.count)
            _ = self.map({ sum = sum.add($0) })
            return sum
        }
        return []
    }
}
