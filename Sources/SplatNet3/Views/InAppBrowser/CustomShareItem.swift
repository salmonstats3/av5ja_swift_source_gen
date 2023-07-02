//
//  CustomShareItem.swift
//
//
//  Created by devonly on 2023/03/09.
//

import Foundation
import LinkPresentation

internal class CustomShareItem: NSObject, UIActivityItemSource {
    private let metadata = LPLinkMetadata()

    init(content _: ShareURL) {
        metadata.title = "Salmonia3+"
    }

    init(content _: ShareImg) {
        metadata.title = "Salmonia3+"
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func activityViewControllerPlaceholderItem(_: UIActivityViewController) -> Any {
        ""
    }

    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType _: UIActivity.ActivityType?) -> Any? {
        activityViewControllerPlaceholderItem(activityViewController)
    }

    func activityViewControllerLinkMetadata(_: UIActivityViewController) -> LPLinkMetadata? {
        metadata
    }
}
