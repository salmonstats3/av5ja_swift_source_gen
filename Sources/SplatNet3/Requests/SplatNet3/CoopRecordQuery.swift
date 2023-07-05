//
//  CoopRecordQuery.swift
//  SplatNet3
//
//  Created by devonly on 2022/09/22.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

internal final class CoopRecordQuery: GraphQL {
    typealias ResponseType = CoopRecordQuery.Response

    var hash: SHA256Hash = .CoopRecordQuery
    var variables: [String: String] = [:]
    var parameters: Parameters?

    init() {}

    // MARK: - Response

    struct Response: Codable {
        let data: DataClass
    }

    // MARK: - DataClass

    struct DataClass: Codable {
        let coopRecord: CoopRecord
    }

    // MARK: - CoopRecord

    struct CoopRecord: Codable {
        let bigRunRecord: BigRunRecord
//        let teamContestRecord: JSONNull?
    }

    // MARK: - BigRunRecord

    struct BigRunRecord: Codable {
        let records: Records
    }

    // MARK: - Records

    struct Records: Codable {
        let edges: [Edge]
        let pageInfo: PageInfo
    }

    // MARK: - Edge

    struct Edge: Codable {
        let node: Node
        let cursor: String
    }

    // MARK: - Node

    struct Node: Codable {
//        let startTime: String
//        let endTime: String
//        let trophy: String
        let coopStage: CoopStage
//        let highestGrade: HighestGrade
//        let highestGradePoint: Int
//        let highestJobScore: Int
//        let typename: String
    }

    // MARK: - CoopStage

    struct CoopStage: Codable {
        let name: String
        let image: CoopStageURL
        @IntegerRawValue var id: CoopStageId
    }

    // MARK: - Image

    struct CoopStageURL: Codable {
        let url: URL
    }

    // MARK: - HighestGrade

    struct HighestGrade: Codable {
        let name: String
        let id: String
    }

    // MARK: - PageInfo

    struct PageInfo: Codable {
        let endCursor: String
        let hasNextPage: Bool
    }
}

extension CoopRecordQuery.Response {
    /// 1. CoopStageId
    var assets: Set<URL> {
        Set(data.coopRecord.bigRunRecord.records.edges.map(\.node.coopStage.image.url))
    }
}
