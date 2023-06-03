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
        self.init(verbatim: NSLocalizedString(String(describing: rawValue), comment: ""))
    }
}
