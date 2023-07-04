//
//  CoopStatsResultsQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/12/04.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

public class CoopStatsResultsQuery: RequestType {
    public typealias ResponseType = [Response]
    #if targetEnvironment(simulator)
        public var baseURL = URL(unsafeString: "http://localhost:3000/")
    #else
        public var baseURL = URL(unsafeString: "https://api.splatnet3.com/")
    #endif
    public var path: String = "v1/results"
    public var parameters: Parameters?
    public var method: HTTPMethod = .post
    public var headers: HTTPHeaders?

    init(results: [[String: Any]]) {
        parameters = [
            "results": results
        ]
    }

    init(result: CoopResult) {
        parameters = [
            "results": [result].map { $0.asJSON() }
        ]
    }

    init(results: [CoopResult]) {
        headers = [
            "ClientVersion": UIDevice.current.version
        ]
        #if targetEnvironment(simulator)
            if let result: CoopResult = results.last {
                let encoder = JSONEncoder()
                encoder.dateEncodingStrategy = .iso8601
                parameters = [
                    "results": [result].map { $0.asJSON() }
                ]
            } else {
                parameters = [
                    "results": results.map { $0.asJSON() }
                ]
            }
        #else
            parameters = [
                "results": results.map { $0.asJSON() }
            ]
        #endif
    }

    public struct Response: Codable {
        enum CodingKeys: String, CodingKey {
            case salmonId = "resultId"
            case uuid
            case playTime
        }

        public let salmonId: Int
        public let uuid: UUID
        public let playTime: Date

        public var id: Int {
            Int(playTime.timeIntervalSince1970)
        }

        public init(from decoder: Decoder) throws {
            let dateFormatter = ISO8601DateFormatter()
            dateFormatter.formatOptions.insert(.withFractionalSeconds)
            let container = try decoder.container(keyedBy: CodingKeys.self)
            salmonId = try container.decode(Int.self, forKey: .salmonId)
            uuid = try container.decode(UUID.self, forKey: .uuid)
            guard let playTime: String = try? container.decode(String.self, forKey: .playTime),
                  let playTime: Date = dateFormatter.date(from: playTime)
            else {
                throw DecodingError.typeMismatch(Date.self, .init(codingPath: [], debugDescription: "Given value could not be decoded as Date"))
            }
            self.playTime = playTime
        }
    }
}

public extension Encodable {
    func asJSON() -> [String: Any] {
        let encoder: JSONEncoder = {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .withoutEscapingSlashes
            encoder.dateEncodingStrategy = .iso8601
            return encoder
        }()
        guard let data: Data = try? encoder.encode(self) else {
            return [:]
        }
        guard var dictionary: [String: Any] = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        else {
            return [:]
        }

        dictionary.forEach { key, value in
            if value is Double, !(value is Int) {
                if let value = value as? Decimal {
                    dictionary[key] = value
                }
            }
        }

        return dictionary
    }
}
