//
//  WKWebView.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

internal class SPWebView: WKWebView, WKNavigationDelegate {
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(SPColor.SplatNet3.SPOrange)
        indicator.style = .large
        indicator.startAnimating()
        return indicator
    }()

    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        isOpaque = false
        backgroundColor = .clear
        allowsLinkPreview = false
        navigationDelegate = self
        scrollView.alwaysBounceVertical = false
        addSubview(indicator)
    }

    func webView(
        _: WKWebView,
        decidePolicyFor _: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        indicator.center = center
        decisionHandler(.allow)
    }

    func webView(_: WKWebView, didFinish _: WKNavigation!) {
        indicator.stopAnimating()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
