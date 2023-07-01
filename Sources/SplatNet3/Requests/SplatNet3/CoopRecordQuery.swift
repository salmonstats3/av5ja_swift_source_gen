//
//  CoopRecordQuery.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
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
    public struct Response: Codable {
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        public let coopRecord: CoopRecord
    }

    // MARK: - CoopRecord
    public struct CoopRecord: Codable {
        public let bigRunRecord: BigRunRecord
//        public let teamContestRecord: JSONNull?
    }

    // MARK: - BigRunRecord
    public struct BigRunRecord: Codable {
        public let records: Records
    }

    // MARK: - Records
    public struct Records: Codable {
        public let edges: [Edge]
        public let pageInfo: PageInfo
    }

    // MARK: - Edge
    public struct Edge: Codable {
        public let node: Node
        public let cursor: String
    }

    // MARK: - Node
    public struct Node: Codable {
//        public let startTime: String
//        public let endTime: String
//        public let trophy: String
        public let coopStage: CoopStage
//        public let highestGrade: HighestGrade
//        public let highestGradePoint: Int
//        public let highestJobScore: Int
//        public let typename: String
    }

    // MARK: - CoopStage
    public struct CoopStage: Codable {
        public let name: String
        public let image: CoopStageURL
        @IntegerRawValue public var id: CoopStageId
    }

    // MARK: - Image
    public struct CoopStageURL: Codable {
        public let url: URL
    }

    // MARK: - HighestGrade
    public struct HighestGrade: Codable {
        public let name: String
        public let id: String
    }

    // MARK: - PageInfo
    public struct PageInfo: Codable {
        public let endCursor: String
        public let hasNextPage: Bool
    }
}

extension CoopRecordQuery.Response {
    /// 1. CoopStageId
    var assets: Set<URL> {
        Set(data.coopRecord.bigRunRecord.records.edges.map({ $0.node.coopStage.image.url }))
    }
}
