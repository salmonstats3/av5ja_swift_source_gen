//
//  LocalizedType+String.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/27.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

extension LocalizedType: CustomStringConvertible, ExpressibleByStringLiteral {
    public typealias StringLiteralType = String

    /// 翻訳されたデータが返る
    public var description: String {
        NSLocalizedString(rawValue, bundle: .module, comment: "")
    }

    public init(stringLiteral value: StringLiteralType) {
        let value = LocalizedType(rawValue: value) ?? .CommonCancel
        self = value
    }
}

public extension String {
    init(_ bundle: LocalizedType) {
        self = NSLocalizedString(bundle.rawValue, bundle: .module, comment: "")
    }
}
