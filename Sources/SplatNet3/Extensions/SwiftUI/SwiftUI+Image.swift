//
//  SwiftUI+Image.swift
//
//
//  Created by devonly on 2023/05/28.
//

import SwiftUI

internal final class SPImageService: ObservableObject {
    @Published var documentPath: URL?

    /// 絶対重いよなあと思いながら使っている
    init<T: UnsafeRawRepresentable>(type: T.Type, rawValue: Int) {
        let documentURL: URL? = FileManager.default.document

        switch type {
        case is WeaponInfoMainId.Type:
            if let weaponId = WeaponInfoMainId(rawValue: rawValue),
               (WeaponInfoMainId.regular + WeaponInfoMainId.rare).contains(weaponId) {
                documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.WeaponInfoMainIdllust.rawValue)/\(rawValue)", conformingTo: .png)
            } else {
                documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.UIImg.rawValue)/\(rawValue)", conformingTo: .png)
            }
        case is CoopStageId.Type:
            documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.StageImgIcon.rawValue)/\(rawValue)", conformingTo: .png)
        case is CoopStageBannerId.Type:
            documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.StageImgBanner.rawValue)/\(rawValue)", conformingTo: .png)
        case is CoopEnemyInfoId.Type:
            documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.CoopEnemyImg.rawValue)/\(rawValue)", conformingTo: .png)
        case is WeaponInfoSpecialId.Type:
            documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.SpecialImg.rawValue)/\(rawValue)", conformingTo: .png)
        case is ScaleId.Type:
            documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.ScaleImg.rawValue)/\(rawValue)", conformingTo: .png)
        default:
            documentPath = documentURL
        }
    }

    init(id: StaticMediaKey) {
        let documentURL: URL? = FileManager.default.document
        documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.Bundled.rawValue)/\(id.rawValue)", conformingTo: .png)
    }
}

public struct SPImage: View {
    @ObservedObject private var service: SPImageService

    public init<T: UnsafeRawRepresentable>(_ id: T) where T.RawValue == Int {
        _service = ObservedObject(wrappedValue: SPImageService(type: T.self, rawValue: id.rawValue))
    }

    public init(_ id: StaticMediaKey) {
        _service = ObservedObject(wrappedValue: SPImageService(id: id))
    }

    public var body: some View {
        Image(url: service.documentPath)
            .resizable()
            .scaledToFit()
    }
}

public extension Image {
    /// URLから初期化
    init(url: URL?) {
        if let url: URL,
           let data: Data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            self.init(uiImage: UIImage())
        }
    }
}
