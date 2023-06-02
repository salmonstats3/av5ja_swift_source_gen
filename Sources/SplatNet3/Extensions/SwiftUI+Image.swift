//
//  SwiftUI+Image.swift
//  
//
//  Created by devonly on 2023/05/28.
//

import SwiftUI

final class SPImageService: ObservableObject {
    @Published var documentPath: URL?

    init<T: UnsafeRawRepresentable>(type: T.Type, rawValue: Int) {
        let documentURL: URL? = FileManager.default.document

        switch type {
        case is WeaponInfoMainId.Type:
            if let weaponId = WeaponInfoMainId(rawValue: rawValue),
               WeaponInfoMainId.regular.contains(weaponId) {
                self.documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.WeaponInfoMainIdllust.rawValue)/\(rawValue)", conformingTo: .png)
            } else {
                self.documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.UIImg.rawValue)/\(rawValue)", conformingTo: .png)
            }
        case is CoopStageId.Type:
            self.documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.StageImgIcon.rawValue)/\(rawValue)", conformingTo: .png)
        case is CoopStageBannerId.Type:
            self.documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.StageImgBanner.rawValue)/\(rawValue)", conformingTo: .png)
        case is CoopEnemyInfoId.Type:
            self.documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.CoopEnemyImg.rawValue)/\(rawValue)", conformingTo: .png)
        default:
            self.documentPath = documentURL
        }
    }

    init(id: StaticMediaKey) {
        let documentURL: URL? = FileManager.default.document
        self.documentPath = documentURL?.appendingPathComponent("\(ResourceURLType.Bundled.rawValue)/\(id.rawValue)", conformingTo: .png)
    }
}

public struct SPImage: View {
    @ObservedObject private var service: SPImageService

    public init<T: UnsafeRawRepresentable>(_ id: T) where T.RawValue == Int {
        self._service = ObservedObject(wrappedValue: SPImageService(type: T.self, rawValue: id.rawValue))
    }

    public init(_ id: StaticMediaKey) {
        self._service = ObservedObject(wrappedValue: SPImageService(id: id))
    }

    public var body: some View {
        Image(url: service.documentPath)
            .resizable()
            .scaledToFit()
    }
}

public extension Image {
    init(url: URL?) {
        if let url: URL,
           let data: Data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            self.init(uiImage: uiImage)
        } else {
            self.init(uiImage: UIImage())
        }
    }

    init(_ value: CoopStageId) {
        self.init("", bundle: .module)
    }

    init(_ value: CoopStageId, size: ImageSize = .Regular) {
        let namespace: String = size == .Regular ? "CoopStage" : "CoopStageHeader"
        self.init("\(namespace)/\(value.rawValue)", bundle: .module)
    }

    init(_ value: ScaleType) {
        self.init("Scale/\(value.rawValue)", bundle: .module)
    }
}
