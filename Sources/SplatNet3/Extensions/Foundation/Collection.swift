//
//  Collection.swift
//  SplatNet3
//
//  Created by devonly on 2023/02/21.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation

public extension Collection where Self.Iterator.Element: RandomAccessCollection {
    // PRECONDITION: `self` must be rectangular, i.e. every row has equal size.
    var transposed: [[Self.Iterator.Element.Iterator.Element]] {
        guard let firstRow = first else { return [] }
        return firstRow.indices.map { index in
            self.map { $0[index] }
        }
    }
}
