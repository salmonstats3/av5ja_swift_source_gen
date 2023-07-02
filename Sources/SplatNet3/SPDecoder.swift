//
//  SPDecoder.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public class SPDecoder: JSONDecoder {
    override public init() {
        super.init()
        dateDecodingStrategy = .iso8601
        keyDecodingStrategy = .convertFromSnakeCase
    }

    static let `default`: SPDecoder = .init()
}

public class SPEncoder: JSONEncoder {
    override public init() {
        super.init()
        dateEncodingStrategy = .iso8601
        keyEncodingStrategy = .convertToSnakeCase
    }
}
