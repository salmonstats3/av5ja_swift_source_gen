//
//  VsStageKey+CoopStageId.swift
//  
//
//  Created by devonly on 2023/06/11.
//

import Foundation

extension VsStageKey {
    var coopStageId: Int? {
        CoopStageId.allCases.first(where: { String(describing: $0) == String(describing: self) })?.id
    }
}
