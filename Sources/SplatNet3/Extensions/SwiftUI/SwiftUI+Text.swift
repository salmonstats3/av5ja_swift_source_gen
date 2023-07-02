//
//  SwiftUI+Text.swift
//
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import SwiftUI

public extension Text {
    init<T: UnsafeRawRepresentable>(_ rawValue: T) {
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
