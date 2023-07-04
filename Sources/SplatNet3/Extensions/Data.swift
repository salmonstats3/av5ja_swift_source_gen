//
//  Data.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

extension Data {
    init(unsafeString: String) {
        // swiftlint:disable:next force_unwrapping
        self = unsafeString.data(using: .utf8, allowLossyConversion: true)!
    }
}
