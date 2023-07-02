//
//  Encodable.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public extension Encodable {
    func asData() throws -> Data {
        let encoder = JSONEncoder() as JSONEncoder

        return try encoder.encode(self)
    }
}
