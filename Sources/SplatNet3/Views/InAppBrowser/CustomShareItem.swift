//
//  CustomShareItem.swift
//  
//
//  Created by devonly on 2023/03/09.
//

import Foundation
import LinkPresentation

class CustomShareItem: NSObject, UIActivityItemSource {
    private let metadata = LPLinkMetadata()

    init(content: ShareURL) {
        self.metadata.title = "Salmonia3+"
    }

    init(content: ShareImg) {
        self.metadata.title = "Salmonia3+"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        ""
    }

    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        activityViewControllerPlaceholderItem(activityViewController)
    }

    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        metadata
    }
}
