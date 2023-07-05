//
//  SPDecoder.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
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
