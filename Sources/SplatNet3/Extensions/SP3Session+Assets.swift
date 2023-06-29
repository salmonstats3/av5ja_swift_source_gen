//
//  SP3Session+Assets.swift
//  
//
//  Created by devonly on 2023/06/11.
//

import Foundation
import Alamofire

extension SP3Session {
    /// リザルトIDを取得する
    private func getCoopHistoryQueryResultIds(from playTime: Date? = nil) async throws -> [Common.ResultId] {
        try await request(CoopHistoryQuery()).getResultIds(from: playTime)
    }
    
    /// リザルトを取得する
    private func getAllCoopHistoryDetailQuery(from playTime: Date? = nil) async throws -> [CoopHistoryDetailQuery.Response] {
        let resultIds: [Common.ResultId] = try await getCoopHistoryQueryResultIds()
        return try await withThrowingTaskGroup(of: CoopHistoryDetailQuery.Response.self, body: { task in
            resultIds.forEach({ resultId in
                task.addTask(operation: { [self] in
                    try await request(CoopHistoryDetailQuery(resultId: resultId))
                })
            })
            return try await task.reduce(into: [CoopHistoryDetailQuery.Response]()) { results, result in
                results.append(result)
            }
        })
    }
    
    /// アセットのURLを取得する
    /// - Returns: アセットのURL配列
    private func getAssetURLsFromSplatNet3() async throws -> Set<URL> {
        SwiftyLogger.info("HashServer: SplatNet3")
        return try await getAllCoopHistoryDetailQuery().assetURLs
            .union(request(StageScheduleQuery()).assetURLs)
            .union(request(WeaponRecordQuery()).assetURLs)
    }
    
    /// アセットのURLを取得する
    /// - Parameter url: ハッシュサーバーのURL
    /// - Returns: アセットのURL配列
    private func getAssetURLsFromHashServer(url: URL) async throws -> Set<URL> {
        SwiftyLogger.info("HashServer: \(url)")
        return try await session.download(url)
            .serializingDecodable(ResourceType.self, decoder: decoder)
            .value
            .urls
    }
    
    /// アセットを保存する
    /// ハッシュサーバーが指定されていればそのURLから、なければイカリング3から取得する
    /// - Parameter url: ハッシュサーバー
    public func getAssetsFromServer(url: URL? = nil) async throws {
        let assetURLs: Set<URL> = try await {
            if let url: URL = url {
                return try await getAssetURLsFromHashServer(url: url)
            } else {
                return try await getAssetURLsFromSplatNet3()
            }
        }()
        print(assetURLs)
        try await getAssets(assetURLs: Array(assetURLs))
    }
       
    private func getAssets(assetURLs: [URL]) async throws {
        guard let document: URL = FileManager.default.document
        else {
            return
        }
        let assets: [ResourceType.Response] = try await withThrowingTaskGroup(of: ResourceType.Response?.self, body: { task in
            assetURLs.forEach({ url in
                task.addTask(operation: { [self] in
                    ResourceType.Response(url: url, data: try? await download(url))
                })
            })
            return try await task.reduce(into: [ResourceType.Response]()) { results, result in
                results.append(result)
            }
        }).compactMap({ $0 })
        try assets.forEach({ asset in
            let documentPath: URL = document.appendingPathComponent(asset.type.rawValue)
            try FileManager.default.createDirectory(atPath: documentPath.path, withIntermediateDirectories: true, attributes: nil)
            let destination: URL = documentPath.appendingPathComponent(asset.rawValue).appendingPathExtension(asset.ext.rawValue)
            try asset.data.write(to: destination, options: .noFileProtection)
        })
    }
}
