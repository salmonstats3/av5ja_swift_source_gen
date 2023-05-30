//
//  ResourceType.swift
//  
//
//  Created by devonly on 2023/05/28.
//

import Foundation

public struct ResourceType: Codable {
    let stageImg: StageImage
    let uiImg: [URL]
    let weaponIllust: [URL]
    let staticMedia: [URL]
    let specialImg: [URL]
    let coopEnemyImg: [URL]

    struct StageImage: Codable {
        let banner: [URL]
        let icon: [URL]
    }

    var urls: [URL] {
        stageImg.banner + stageImg.icon + uiImg + weaponIllust + staticMedia + specialImg + coopEnemyImg
    }

    struct Response: Codable {
        let type: ResourceURLType
        let hash: String
        let rawValue: String
        let data: Data

        static func getHash(url: URL) -> String? {
            if let hash: String = url.lastPathComponent.capture(pattern: #"^([\w\d]{64})_0"#, group: 1) {
                return hash
            }
            if let hash: String = url.lastPathComponent.capture(pattern: #"^([\w\d]{32})"#, group: 1) {
                return hash
            }
            return nil
        }

        init?(url: URL, data: Data?) {
            guard let data: Data,
                  let type = ResourceURLType(url: url),
                  let hash: String = ResourceType.Response.getHash(url: url)
            else {
                print(url, data == nil)
                return nil
            }

            self.type = type
            self.data = data
            self.hash = hash

            /// WeaponKey
            if let rawValue: String = WeaponKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            /// StageKey
            if let rawValue: String = CoopStageKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            /// StageBannerKey
            if let rawValue: String = CoopBannerKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            /// EnemyKey
            if let rawValue: String = EnemyKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            /// SpecialKey
            if let rawValue: String = SpecialKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }

            /// StaticMediaKey
            if let rawValue: String = StaticMediaKey(rawValue: hash)?.id.description {
                self.rawValue = rawValue
                return
            }
            print(url, hash)
            return nil
        }
    }
}

public enum ResourceURLType: String, CaseIterable, Codable {
    case StageImgBanner     = "stage_img/banner"
    case StageImgIcon       = "stage_img/icon"
    case UIImg              = "ui_img"
    case WeaponIllust       = "weapon_illust"
    case CoopEnemyImg       = "coop_enemy_img"
    case SpecialImg         = "special_img"
    case StaticMedia        = "static/media"
    case Bundled            = "bundled"

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
        if url.absoluteString.contains(ResourceURLType.WeaponIllust.rawValue) {
            self.init(rawValue: ResourceURLType.WeaponIllust.rawValue)
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
        return nil
    }
}
