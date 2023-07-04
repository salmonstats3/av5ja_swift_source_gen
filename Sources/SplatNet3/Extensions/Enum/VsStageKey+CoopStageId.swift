//
//  VsStageKey+CoopStageId.swift
//  SplatNet3
//
//  Created by devonly on 2023/06/11.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation

extension VsStageKey {
    var coopStageId: Int? {
        CoopStageId.allCases.first(where: { String(describing: $0) == String(describing: self) })?.id
    }
}
