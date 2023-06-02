//
//  SHA256HashRawValue.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation

@propertyWrapper
public struct SHA256HashRawValue<T: RawRepresentable>: Codable where T.RawValue == String {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let baseURL = URL(unsafeString: try container.decode(String.self))
        let component: String = baseURL.lastPathComponent

        let hash = String(component.dropLast(6))
        guard let value = T(rawValue: hash) else {
            throw DecodingError.valueNotFound(T.self, .init(codingPath: container.codingPath, debugDescription: "Given value \(hash) is not associated for \(T.self)"))
        }
        self.wrappedValue = value
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let hash = String(self.wrappedValue.rawValue)
        try container.encode(hash)
    }
}
