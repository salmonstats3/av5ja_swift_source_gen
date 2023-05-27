//
//  SPAsset.swift
//  
//
//  Created by devonly on 2023/05/26.
//

import Foundation

public protocol SPRawRepresentable: RawRepresentable, Codable, CaseIterable where RawValue == Int {}

public struct SPAssetType<T: RawRepresentable>: Codable where T: Codable, T: Hashable, T: Equatable, T.RawValue == Int {
    init(key: T, url: URL) {
        self.key = key
        self.url = url
    }

    let key: T
    let url: URL

    var hash: String {
        url.absoluteString.capture(pattern: #"([\w\d]{64})_"#, group: 1) ?? ""
    }
}

public class SPAssetData<T: RawRepresentable>: Codable where T: Codable, T.RawValue == Int {
    init(key: T, data: Data) {
        self.key = key
        self.data = data
    }

    let key: T
    let data: Data
}

extension SPAssetType: Hashable, Equatable {
    public static func == (lhs: SPAssetType<T>, rhs: SPAssetType<T>) -> Bool {
        lhs.key == rhs.key
    }
}
