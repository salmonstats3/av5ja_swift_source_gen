//
//  CoopSetting.swift
//  SplatNet3
//
//  Created by devonly on 2022/12/04.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

public enum CoopSetting: String, CaseIterable, Codable, Identifiable {
    public var id: String { rawValue }

    /// いつものバイト
    case CoopNormalSetting
    /// ビッグラン
    case CoopBigRunSetting
    /// コンテスト
    case CoopTeamContestSetting
}
