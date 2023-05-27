//
//  Common.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

/// SplatNet3のBase64化されたIdに対応するプロトコル
protocol SP3IdType: Codable, CustomStringConvertible, Equatable, Identifiable {
    /// Base64エンコードした文字列
    var id: String { get }
    /// APIのエンドポイント
    var type: IdType { get }
    /// NPLNユーザーID
    var nplnUserId: String { get }
    /// 遊んだ時間
    var playTime: Date { get }
    /// ランダムに生成されたUUID
    var uuid: UUID { get }
}

public enum Common {
    static let dateFormatter: SPDateFormatter = SPDateFormatter()

    // MARK: - PlayerId
    public struct PlayerId: SP3IdType {
        /// Base64デコードした文字列
        public var id: String {
            let playTime: String = Common.dateFormatter.string(from: playTime)
            return "\(playTime):\(nplnUserId)"
        }

        /// 常にCoopPlayer
        public let type: IdType = .CoopPlayer
        /// NPLNユーザーID(マッチングしたユーザー)
        public let nplnUserId: String
        /// NPLNユーザーID(自分)
        public let parentNplnUserId: String
        /// 遊んだ時間
        public let playTime: Date
        /// リザルトごとのランダムUUID
        public let uuid: UUID

        /// Base64エンコードされた文字列
        public var description: String {
            id
        }

        /// 失敗しないと思われるが、失敗した場合はエラーで落とす
        public init(description: String) throws {
            let rawValue: [String] = description.capture(pattern: #"^([A-z]*)-u-([a-z0-9]*):([T0-9]*)_([a-z0-9-]*):u-([a-z0-9]*)$"#, group: [0, 1, 2, 3, 4, 5])
            guard let playTime: Date = Common.dateFormatter.date(from: rawValue[3]),
                  let uuid: UUID = UUID(uuidString: rawValue[4])
            else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Given playerId could not decode."))
            }

            self.playTime = playTime
            self.uuid = uuid
            self.nplnUserId = rawValue[5]
            self.parentNplnUserId = rawValue[2]
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            // 復元された文字列を取得するところ
            let description = try {
                let stringValue: String = try container.decode(String.self)
                guard let value: String = stringValue.base64DecodedString else {
                    return stringValue
                }
                return value
            }()
            try self.init(description: description)
        }
    }

    // MARK: - ResultId
    public struct ResultId: SP3IdType {
        /// Base64エンコードした文字列
        public var id: String {
            let playTime: String = Common.dateFormatter.string(from: playTime)
            return "\(type.rawValue)-u-\(nplnUserId):\(playTime)_\(uuid.uuidString.lowercased())"
        }
        public let type: IdType
        public let nplnUserId: String
        public let playTime: Date
        public let uuid: UUID

        /// Base64エンコードされた文字列
        public var description: String {
            id.base64EncodedString
        }

        public init(nplnUserId: String, playTime: Date, uuid: UUID) {
            self.type = .CoopHistoryDetail
            self.nplnUserId = nplnUserId
            self.playTime = playTime
            self.uuid = uuid
        }

        public init(description: String) throws {

            let rawValue: [String] = description.capture(pattern: #"^([A-z]*)-u-([a-z0-9]*):([T0-9]*)_([a-z0-9\-]*)$"#, group: [0, 1, 2, 3, 4])

            guard let type: IdType = IdType(rawValue: rawValue[1])
            else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid Type"))
            }
            guard let playTime: Date = Common.dateFormatter.date(from: rawValue[3])
            else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid Date"))
            }

            guard let uuid: UUID = UUID(uuidString: rawValue[4])
            else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid UUID"))
            }

            self.type = type
            self.nplnUserId = rawValue[2]
            self.playTime = playTime
            self.uuid = uuid
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            guard let stringValue = try container.decode(String.self).base64DecodedString else {
                throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Could not decoded."))
            }
            try self.init(description: stringValue)
        }
    }

    // MARK: - Node
    public struct Node<T: Codable>: Codable {
        public let nodes: [T]
    }

    // MARK: - URL
    public struct URL<T: UnsafeRawRepresentable>: Codable where T.RawValue == String {
        let url: Foundation.URL

        public var hash: T {
            guard let rawValue: String = url.absoluteString.capture(pattern: #"([\w\d]{64})_"#, group: 1),
                  let value: T = T(rawValue: rawValue)
            else {
                return T.defaultValue
            }
            return value
        }
    }

    // MARK: - Image
    public struct Image<T: UnsafeRawRepresentable>: Codable where T.RawValue == String {
        public let name: String
        public let image: Common.URL<T>
    }

    // MARK: - TextColor
    public struct TextColor: Codable {
        public let a: Decimal
        public let b: Decimal
        public let g: Decimal
        public let r: Decimal

        public init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
            self.a = try container.decode(Decimal.self, forKey: .a)
            self.r = try container.decode(Decimal.self, forKey: .r)
            self.g = try container.decode(Decimal.self, forKey: .g)
            self.b = try container.decode(Decimal.self, forKey: .b)
        }

        public init(r: Decimal, g: Decimal, b: Decimal, a: Decimal) {
            self.r = r
            self.g = g
            self.b = b
            self.a = a
        }
    }
}

extension KeyedDecodingContainer {
    public func decode(_ type: Decimal.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Decimal {
        let doubleValue: Double = try decode(Double.self, forKey: key)
        guard let decimalValue: Decimal = Decimal(string: doubleValue.description)
        else {
            throw DecodingError.typeMismatch(Decimal.self, .init(codingPath: codingPath, debugDescription: "Given value \(doubleValue) could not cast as Decimal"))
        }
        return decimalValue
    }

    public func decodeIfPresent(_ type: Decimal.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Decimal? {
        guard let doubleValue: Double = try decodeIfPresent(Double.self, forKey: key)
        else {
            return nil
        }
        guard let decimalValue: Decimal = Decimal(string: doubleValue.description)
        else {
            throw DecodingError.typeMismatch(Decimal.self, .init(codingPath: codingPath, debugDescription: "Given value \(doubleValue) could not cast as Decimal"))
        }
        return decimalValue
    }
}
