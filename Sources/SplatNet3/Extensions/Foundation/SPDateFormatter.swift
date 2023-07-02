//
//  SPDateFormatter.swift
//
//
//  Created by devonly on 2023/04/01.
//

import Foundation

public class SPDateFormatter: DateFormatter {
    override public init() {
        super.init()
        dateFormat = #"yyyyMMdd'T'HHmmss"#
        locale = Locale(identifier: "en_US_POSIX")
        timeZone = TimeZone(identifier: "UTC")
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
