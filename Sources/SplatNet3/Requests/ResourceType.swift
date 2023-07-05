//
//  ResourceType.swift
//  SplatNet3
//
//  Created by devonly on 2023/05/28.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation
import UniformTypeIdentifiers

public struct ResourceType: Codable {
    let stageImg: StageImage
    let uiImg: [URL]
    let weaponIllust: [URL]
    let staticMedia: [URL]
    let specialImg: [URL]
    let coopEnemyImg: [URL]
    let scaleImg: [URL]
    let fonts: [URL]

    public enum ExtType: String, CaseIterable, Codable {
        case GIF = "gif"
        case SVG = "svg"
        case PNG = "png"
        case WOFF = "woff"
        case WOFF2 = "woff2"
    }

    struct StageImage: Codable {
        let banner: [URL]
        let icon: [URL]
    }

    var urls: Set<URL> {
        Set(stageImg.banner + stageImg.icon + uiImg + weaponIllust + staticMedia + specialImg + coopEnemyImg + fonts + scaleImg)
    }

    struct Response: Codable {
        let type: ResourceURLType
        let hash: String
        let rawValue: String
        let data: Data
        let ext: ExtType

        static func getHash(url: URL) -> String? {
            if let hash: String = url.lastPathComponent.capture(pattern: #"^([\w\d]{64})_\d"#, group: 1) {
                return hash
            }
            if let hash: String = url.lastPathComponent.capture(pattern: #"^([\w\d]{32})"#, group: 1) {
                return hash
            }
            if let hash: String = url.lastPathComponent.capture(pattern: #"([\w\d]{20})\.(woff2|woff)$"#, group: 1) {
                return hash
            }
            if let host: String = url.host,
               let rowId: String = url.lastPathComponent.capture(pattern: #"([\w\d_].*).png"#, group: 1),
               host == "leanny.github.io" {
                return rowId.contains("_Bear") ? "\(rowId.replacingOccurrences(of: "Path_Wst_", with: ""))_Coop".sha256Hash : rowId.sha256Hash
            }
            return nil
        }

        init?(url: URL, data: Data?) {
            guard let data: Data,
                  let type = ResourceURLType(url: url),
                  let hash: String = ResourceType.Response.getHash(url: url),
                  let ext = ExtType(rawValue: url.pathExtension)
            else {
                SwiftyLogger.error("Invalid hash value. \(url)")
                return nil
            }

            self.type = type
            self.data = data
            self.hash = hash
            self.ext = ext

            // WeaponInfoMainKey
            if let rawValue: String = WeaponInfoMainKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            // VsStageKey
            if let rawValue: String = VsStageKey(rawValue: hash)?.coopStageId?.description {
                self.rawValue = rawValue
                return
            }

            // StageKey
            if let rawValue: String = CoopStageKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            // StageBannerKey
            if let rawValue: String = CoopStageBannerKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            // CoopEnemyInfoKey
            if let rawValue: String = CoopEnemyInfoKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            // WeaponInfoSpecialKey
            if let rawValue: String = WeaponInfoSpecialKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            // StaticMediaKey
            if let rawValue: String = StaticMediaKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            // SP3WOFFKey
            if let rawValue: String = SP3WOFFKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            // SP3WOFF2Key
            if let rawValue: String = SP3WOFF2Key(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            // Scale
            if let rawValue: String = ScaleKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            SwiftyLogger.error("Could not recognized hash value. \(url)")
            return nil
        }
    }
}

public enum ResourceURLType: String, CaseIterable, Codable {
    case StageImgBanner = "stage_img/banner"
    case StageImgIcon = "stage_img/icon"
    case UIImg = "ui_img"
    case ScaleImg = "scale_img"
    case CoopEnemyImg = "coop_enemy_img"
    case SpecialImg = "special_img"
    case WeaponInfoMainIdllust = "weapon_illust"
    case StaticMedia = "static/media"
    case Bundled = "bundled"
    case StageL = "stageL"
    case StageBanner = "stageBanner"
    case CoopEnemy = "coopEnemy"
    case WeaponInfoMainFlat = "weapon_flat"
    case Scale = "images/coop/"

    init?(url: URL) {
        if url.absoluteString.contains(ResourceURLType.StageImgBanner.rawValue) {
            self.init(rawValue: ResourceURLType.StageImgBanner.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.StageImgIcon.rawValue) {
            self.init(rawValue: ResourceURLType.StageImgIcon.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.UIImg.rawValue) {
            self.init(rawValue: ResourceURLType.UIImg.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.WeaponInfoMainIdllust.rawValue) {
            self.init(rawValue: ResourceURLType.WeaponInfoMainIdllust.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.CoopEnemyImg.rawValue) {
            self.init(rawValue: ResourceURLType.CoopEnemyImg.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.SpecialImg.rawValue) {
            self.init(rawValue: ResourceURLType.SpecialImg.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.StaticMedia.rawValue) {
            self.init(rawValue: ResourceURLType.StaticMedia.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.Bundled.rawValue) {
            self.init(rawValue: ResourceURLType.Bundled.rawValue)
            return
        }
        // Leanny
        if url.absoluteString.contains(ResourceURLType.StageL.rawValue) {
            self.init(rawValue: ResourceURLType.StageImgIcon.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.WeaponInfoMainFlat.rawValue) {
            self.init(rawValue: ResourceURLType.WeaponInfoMainIdllust.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.StageBanner.rawValue) {
            self.init(rawValue: ResourceURLType.StageImgBanner.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.CoopEnemy.rawValue) {
            self.init(rawValue: ResourceURLType.CoopEnemyImg.rawValue)
            return
        }
        if url.absoluteString.contains(ResourceURLType.Scale.rawValue) {
            self.init(rawValue: ResourceURLType.ScaleImg.rawValue)
            return
        }
        SwiftyLogger.error("Invalid url. \(url)")
        return nil
    }
}
