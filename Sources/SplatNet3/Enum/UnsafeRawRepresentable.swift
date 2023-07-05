//
//  UnsafeRawRepresentable.swift
//  SplatNet3
//
//  Created by devonly on 2023/02/28.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public protocol UnsafeRawRepresentable: Identifiable, RawRepresentable, Codable, CaseIterable, Hashable, Equatable
    where RawValue: LosslessStringConvertible {
    static var defaultValue: Self { get }
}

@propertyWrapper
public struct UnsafeSHA256Hash<T: UnsafeRawRepresentable>: Codable {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue: String = try container.decode(String.self)

        guard let capture: String = stringValue.capture(pattern: #"([\w\d]{64})_"#, group: 1),
              let rawValue = T.RawValue(capture),
              let value = T(rawValue: rawValue)
        else {
            wrappedValue = T.defaultValue
            return
        }
        wrappedValue = value
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

@propertyWrapper
public struct UnsafeRawValue<T: UnsafeRawRepresentable>: Codable {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue: String = try container.decode(String.self)

        guard let data = Data(base64Encoded: stringValue),
              let stringValue = String(data: data, encoding: .utf8),
              let capture: String = stringValue.capture(pattern: "-([0-9-]*)$", group: 1),
              let rawValue = T.RawValue(capture),
              let value = T(rawValue: rawValue)
        else {
            wrappedValue = T.defaultValue
            return
        }
        wrappedValue = value
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}
