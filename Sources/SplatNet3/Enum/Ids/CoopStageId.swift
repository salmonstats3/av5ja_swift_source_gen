//
//  CoopStageId.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Charts
import Foundation

public enum CoopStageId: Int, UnsafeRawRepresentable {
    public static var defaultValue: Self = .Dummy
    public var id: Int { rawValue }

    case Unknown        = -1
    case Tutorial       = 0
    case Shakeup        = 1
    case Shakespiral    = 2
    case Shakehouse     = 3
    case Shakelift      = 4
    case Shakeride      = 5
    case Shakeship      = 6
    case Shakedent      = 7
    case Shakehighway   = 8
    case Carousel       = 100
    case Upland         = 102
    case Temple         = 103
    case Dummy          = -999

    public var description: String {
        NSLocalizedString("CoopStage_\(String(describing: self))", bundle: .module, comment: "")
    }

    public static let allCases: [CoopStageId] = [
        .Shakeup,
        .Shakespiral,
        .Shakeship,
        .Shakedent,
        .Shakehighway,
        .Carousel,
        .Upland,
        .Temple
    ]

    /// 通常のステージ
    public static let regular: [CoopStageId] = allCases.filter({ $0.rawValue > 0 && $0.rawValue < 100 })
    /// ビッグラン用のステージ
    public static let bigRun: [CoopStageId] = allCases.filter({ $0.rawValue >= 100 })
}

@available(iOS 16.0, *)
extension CoopStageId: Plottable {
    public var primitivePlottable: String {
        String(self.rawValue)
    }

    public init?(primitivePlottable: String) {
        guard let rawValue = Int(primitivePlottable) else {
            return nil
        }
        self.init(rawValue: rawValue)
    }

    public typealias PrimitivePlottable = String
}
