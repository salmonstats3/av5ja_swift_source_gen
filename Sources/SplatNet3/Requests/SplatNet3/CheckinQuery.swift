//
//  CheckinQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class CheckinQuery: GraphQL {
    typealias ResponseType = CheckinQuery.Response

    var hash: SHA256Hash = .CheckinQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?

    init() {}

    // MARK: - Response

    internal struct Response: Codable {
        let data: DataClass
    }

    // MARK: - DataClass

    internal struct DataClass: Codable {
        let checkinHistories: [CheckinHistory]
    }

    // MARK: - CheckinHistory

    internal struct CheckinHistory: Codable {
        let id: CheckinWithQRCodeMutation.CheckInEventId
        let title: String
        let checkinTime: String
        let reward: Reward

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try {
                guard let rawValue: String = try? container.decode(String.self, forKey: .id).base64DecodedString
                else {
                    throw DecodingError.keyNotFound(
                        CodingKeys.id,
                        .init(codingPath: container.codingPath, debugDescription: "RawValue is not found.")
                    )
                }

                guard let id: String = rawValue.capture(pattern: #"(T[a-f0-9-].*):"#, group: 1)
                else {
                    throw DecodingError.keyNotFound(
                        CodingKeys.id,
                        .init(codingPath: container.codingPath, debugDescription: "RawValue is not found.")
                    )
                }

                guard let eventId = CheckinWithQRCodeMutation.CheckInEventId(rawValue: id)
                else {
                    throw DecodingError.keyNotFound(
                        CodingKeys.id,
                        .init(codingPath: container.codingPath, debugDescription: "RawValue is not found.")
                    )
                }
                return eventId
            }()
            title = try container.decode(String.self, forKey: .title)
            checkinTime = try container.decode(String.self, forKey: .checkinTime)
            reward = try container.decode(CheckinQuery.Reward.self, forKey: .reward)
        }
    }

    // MARK: - Reward

    struct Reward: Codable {
        let nameplateBackground: NameplateBackground?
        let id: String
        let name: String?
        let image: Image?
        let amount: Int?
    }

    // MARK: - Image

    struct Image: Codable {
        let url: String
    }

    // MARK: - NameplateBackground

    struct NameplateBackground: Codable {
        let image: Image
        let id: String
    }
}
