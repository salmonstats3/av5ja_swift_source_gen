//
//  ProgressType.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI

public enum ProgressType: Int, CaseIterable {
    case PROGRESS = 0
    case SUCCESS = 1
    case FAILURE = 2
}

public enum ProgressAPIType: String, CaseIterable {
    case NSO
    case APP
    case API
    case IMINK
    case FLAPG
    case NXAPI
}
