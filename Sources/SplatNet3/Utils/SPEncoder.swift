//
//  SPDecoder.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public class SPEncoder: JSONEncoder {
    override public init() {
        super.init()
        dateEncodingStrategy = .iso8601
        keyEncodingStrategy = .convertToSnakeCase
    }
}
