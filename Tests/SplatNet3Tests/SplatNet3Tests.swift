//
//  SplatNet3Tests.swift
//  SplatNet3Tests
//
//  Created by devonly on 2023/05/27.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

@testable import Alamofire
@testable import SplatNet3
import XCTest

internal enum JSONType: String, CaseIterable, Codable {
    case CoopHistory
    case CoopHistoryDetail
    case FriendList
    case StageSchedule
    case Schedule
    case SplatNet3
    case HistoryRecord
    case Internal
}

internal enum OutputType: String, CaseIterable {
    case Key
    case Id

    var type: String {
        switch self {
        case .Key:
            return "String"
        case .Id:
            return "Int"
        }
    }
}

internal struct EnumType: Codable {
    let root: [Entry]

    struct Entry: Codable {
        let id: Int
        let rowId: String

        var hash: String { rowId.sha256Hash }

        enum CodingKeys: String, CodingKey {
            case id = "Id"
            case rowId = "__RowId"
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(Int.self, forKey: .id)
            rowId = try {
                let rawValue: String = try container.decode(String.self, forKey: .rowId)
                return rawValue.capture(pattern: #"_(.+?)\."#, group: 1) ?? rawValue
            }()
        }
    }

    func asSourceCode(type: OutputType, filename: String) -> String {
        let contents: String = root.sorted(by: { $0.id < $1.id })
            .map { entry in
                switch type {
                case .Key:
                    return "\tcase \(entry.rowId) = \"\(entry.hash)\""
                case .Id:
                    return "\tcase \(entry.rowId) = \(entry.id)"
                }
            }
            .joined(separator: "\n")

        return """
        //
        //  \(filename)\(String(describing: type)).swift
        //
        //  Created by devonly on 2023/01/30
        //  Copyright © 2022 Magi, Corporation. All rights reserved.
        //

        import Foundation

        public enum \(filename)\(String(describing: type)): \(type.type), CaseIterable, Identifiable, Codable {
        \tpublic var id: \(type.type) { rawValue }
        \(contents)
        }
        """
    }
}

internal final class SplatNet3Tests: XCTestCase {
    private let decoder = SPDecoder()

    private func getListContents(_ type: JSONType) -> [URL] {
        Bundle.module.urls(forResourcesWithExtension: "json", subdirectory: "JSON/\(type.rawValue)") ?? []
    }

    func testHistoryRecord() throws {
        do {
            let paths: [URL] = getListContents(.HistoryRecord)
            for path in paths {
                let data: Data = try Data(contentsOf: path)
                let response = try decoder.decode(HistoryRecordQuery.Response.self, from: data)
                dump(response)
            }
        } catch {
            SwiftyLogger.error(error.localizedDescription)
            throw error
        }
    }

    func testCoopHistory() throws {
        do {
            let paths: [URL] = getListContents(.CoopHistory)
            for path in paths {
                let data: Data = try Data(contentsOf: path)
                let response = try decoder.decode(CoopHistoryQuery.Response.self, from: data)
                dump(response)
            }
        } catch {
            SwiftyLogger.error(error.localizedDescription)
            throw error
        }
    }

    func testCoopHistoryDetail() throws {
        do {
            let paths: [URL] = getListContents(.CoopHistoryDetail).sorted(by: { $0.absoluteString < $1.absoluteString })
            print("Test Case: \(paths.count)")
            for path in paths {
                try autoreleasepool {
                    SwiftyLogger.error("Tested: \(path.lastPathComponent)")
                    let data: Data = try Data(contentsOf: path)
                    let result = try decoder.decode(CoopHistoryDetailQuery.Response.self, from: data)
                    let players = [result.data.coopHistoryDetail.myResult] + result.data.coopHistoryDetail.memberResults
                    players.forEach { player in
                        let textColor: Common.TextColor = player.player.nameplate.background.textColor
                        if textColor.a != 1 || textColor.b != 1 || textColor.g != 1 || textColor.r != 1 {
                            print(player.player.nameplate.background.textColor)
                        }
                    }
                }
            }
        } catch {
            SwiftyLogger.error(error.localizedDescription)
            throw error
        }
    }

    func testSplatNet3() throws {
        do {
            let paths: [URL] = getListContents(.SplatNet3).sorted(by: { $0.absoluteString < $1.absoluteString })

            for path in paths {
                try autoreleasepool {
                    let data: Data = try Data(contentsOf: path)
                    print(data)
                }
            }
        } catch {
            print(error)
            SwiftyLogger.error(error.localizedDescription)
            throw error
        }
    }

    // swiftlint:disable:next empty_xctest_method
    func testFriendList() throws {}

    func testStageSchedule() throws {
        let paths: [URL] = getListContents(.StageSchedule).sorted(by: { $0.absoluteString < $1.absoluteString })
        for path in paths {
            do {
                try autoreleasepool {
                    let data: Data = try Data(contentsOf: path)
                    let response: StageScheduleQuery.Response = try decoder.decode(StageScheduleQuery.Response.self, from: data)
                    print(response)
                }
            } catch {
                SwiftyLogger.error(error)
                throw error
            }
        }
    }

    func testEnumContent() throws {
        do {
            let paths: [URL] = getListContents(.Internal)

            for path in paths {
                guard let filename: Substring = path.lastPathComponent.split(separator: ".").first,
                      let url: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                else {
                    return
                }
                try autoreleasepool {
                    let data: Data = try Data(contentsOf: path)
                    let response: EnumType = try decoder.decode(EnumType.self, from: data)
                    try OutputType.allCases.forEach { type in
                        let destination: URL = url.appendingPathComponent("\(filename)\(type.rawValue).swift")
                        try response.asSourceCode(type: type, filename: String(filename)).data(using: .utf8)?.write(to: destination)
                    }
                }
            }
        } catch {
            SwiftyLogger.error(error.localizedDescription)
            throw error
        }
    }
}
