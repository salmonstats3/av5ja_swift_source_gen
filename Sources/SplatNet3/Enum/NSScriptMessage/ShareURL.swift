//
//  ShareURL.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

internal struct ShareURL: Codable {
    let text: String
    let imageUrl: URL
    let hashtags: [String]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decode(String.self, forKey: .text)
        imageUrl = try container.decode(URL.self, forKey: .imageUrl)
        hashtags = try container.decode([String].self, forKey: .hashtags)
    }
}
