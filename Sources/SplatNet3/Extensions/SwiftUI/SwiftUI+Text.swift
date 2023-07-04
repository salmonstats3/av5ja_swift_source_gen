//
//  SwiftUI+Text.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/27.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI

public extension Text {
    init(_ rawValue: some UnsafeRawRepresentable) {
        self.init(verbatim: NSLocalizedString(String(describing: rawValue), bundle: .module, comment: ""))
    }

    init<T: UnsafeRawRepresentable>(_ rawValue: T?) {
        if let rawValue: T = rawValue {
            self.init(rawValue)
        } else {
            self.init(verbatim: "-")
        }
    }
}
