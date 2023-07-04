//
//  SwiftUIView.swift
//
//
//  Created by devonly on 2022/11/28.
//
//

import Alamofire
import LinkPresentation
import SDBridgeSwift
import SwiftUI
import UIKit
import WebKit

internal struct SplatNetView: UIViewControllerRepresentable {
    let contentId: ContentId

    init(contentId: ContentId) {
        self.contentId = contentId
    }

    func makeUIViewController(context _: Context) -> WebViewController {
        WebViewController(contentId: contentId)
    }

    func updateUIViewController(_: WebViewController, context _: Context) {}

    final class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
        private var bridge: WebViewJavascriptBridge
        private var observer: NSKeyValueObservation?
        private let session = SP3Session()
        private let contentId: ContentId
        private let configuration = WKWebViewConfiguration()

        override func viewDidLoad() {
            super.viewDidLoad()
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let button = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(close))
            /// イカリング3の場合はナビゲーションバーを表示しない
            parent?.navigationController?.setNavigationBarHidden(contentId == .SP3, animated: true)
            parent?.navigationItem.rightBarButtonItem = button
            parent?.navigationItem.rightBarButtonItem?.tintColor = .white
        }

        @objc func close() {
            dismiss(animated: true)
        }

        init(contentId: ContentId) {
            /// リクエスト
            let locale: String = NSLocalizedString(LocalizedType.CommonLocale.rawValue, bundle: .module, comment: "")
            var baseURL: URL = contentId.requestURL
            baseURL.queryItems([URLQueryItem(name: "lang", value: locale)])
            var request = URLRequest(url: baseURL)
            self.contentId = contentId
            let webView = WKWebView(frame: .zero, configuration: configuration)
            let indicator = UIActivityIndicatorView()
            indicator.hidesWhenStopped = true
            indicator.translatesAutoresizingMaskIntoConstraints = false
            bridge = WebViewJavascriptBridge(webView: webView)

            super.init(nibName: nil, bundle: nil)
            /// コンソールでデータを受け取ったらJavaScriptを実行する
            bridge.consolePipeClosure = { content in
                self.evaluateJavaScript(content)
            }

            // WebViewの見た目の変更
            webView.isOpaque = false
            webView.backgroundColor = UIColor(SPColor.SplatNet3.SPBackground)
            webView.uiDelegate = self
            webView.navigationDelegate = self
            indicator.center = view.center
            webView.addSubview(indicator)

            Task(priority: .utility, operation: {
                /// どちらの場合でもX-GameWebTokenを利用してアクセスする
                if let gameWebToken = session.account?.gameWebToken {
                    indicator.startAnimating()
                    do {
                        let account: UserInfo = try await session.refreshIfNeeded(contentId: contentId)
                        switch contentId {
                        case .SP2:
                            /// ヘッダーを更新
                            request.headers.add(name: "X-GameWebToken", value: gameWebToken)
                            indicator.stopAnimating()
                            webView.load(request)
                        case .SP3:
                            if let host: String = contentId.requestURL.host,
                               /// クッキーを設定
                               let cookie = HTTPCookie(properties: [
                                   HTTPCookiePropertyKey.name: "_gtoken",
                                   HTTPCookiePropertyKey.value: account.gameWebToken,
                                   HTTPCookiePropertyKey.domain: host,
                                   HTTPCookiePropertyKey.path: "/",
                               ]) {
                                await webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
                            }
                            indicator.stopAnimating()
                            webView.load(request)
                        }
                    } catch {
                        webView.load(request)
                    }
                } else {
                    webView.load(request)
                }
            })
            view = webView
        }

        @available(*, unavailable)
        required init?(coder _: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        /// リクエスト前に呼ばれる
        func webView(
            _: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping (WKNavigationActionPolicy
            ) -> Void
        ) {
            guard let url: URL = navigationAction.request.url
            else {
                decisionHandler(.cancel)
                return
            }

            /// Nintendo Storeへのリンクは開かない
            if url.pathComponents.contains("store") {
                decisionHandler(.cancel)
                return
            }

            decisionHandler(.allow)
        }

        // swiftlint:disable:next implicitly_unwrapped_optional
        func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {}

        // swiftlint:disable:next implicitly_unwrapped_optional
        func webView(_: WKWebView, didFinish _: WKNavigation!) {}

        // swiftlint:disable:next implicitly_unwrapped_optional
        func webView(_: WKWebView, didFailProvisionalNavigation _: WKNavigation!, withError _: Error) {}

        // swiftlint:disable:next implicitly_unwrapped_optional
        func webView(_: WKWebView, didFail _: WKNavigation!, withError _: Error) {}

        // swiftlint:disable:next implicitly_unwrapped_optional
        func webView(_: WKWebView, didReceiveServerRedirectForProvisionalNavigation _: WKNavigation!) {}

        /// JavaScriptを実行する
        private func evaluateJavaScript(_ content: Any?) {
            guard let script = NSScriptMessage(rawValue: content) else {
                return
            }

            switch script {
            case .closeWebView:
                dismiss(animated: true)
            case .reloadExtension:
                break
            case .completeLoading:
                break
            case let .invokeNativeShare(content):
                let session = Alamofire.Session()
                Task(priority: .utility, operation: {
                    guard let data: Data = try? await session.download(content.imageUrl).serializingData().value,
                          let image = UIImage(data: data)
                    else {
                        return
                    }
                    let hashTag: String = (["Salmonia3"] + content.hashtags).map { "#\($0)" }.joined(separator: " ")
                    let controller = UIActivityViewController(
                        activityItems: [CustomShareItem(content: content), image, hashTag],
                        applicationActivities: nil
                    )
                    self.popover(controller, animated: true)
                })
            case let .invokeNativeShareUrl(content):
                let hashTag: String = ["Salmonia3"].map { "#\($0)" }.joined(separator: " ")
                let controller = UIActivityViewController(
                    activityItems: [CustomShareItem(content: content), content.url, hashTag],
                    applicationActivities: nil
                )
                popover(controller, animated: true)
            case let .copyToClipboard(content):
                UIPasteboard.general.string = content
            case let .downloadImages(content):
                Task(priority: .utility, operation: {
                    _ = await content.asyncMap { imageURL in
                        let session: Alamofire.Session = .init()
                        guard let data: Data = try? await session.download(imageURL).serializingData().value,
                              let image = UIImage(data: data)
                        else {
                            return
                        }
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    }
                    let alert = UIAlertController(
                        title: LocalizedType.CommonDownload.description,
                        message: LocalizedType.CommonSaveToPhotoLibrary.description,
                        preferredStyle: .alert
                    )
                    let action = UIAlertAction(title: LocalizedType.CommonClose.description, style: .default)
                    alert.addAction(action)
                    present(alert, animated: true)
                })
            case .sourceCamera:
                let reader = UIHostingController(rootView: QRReaderView().edgesIgnoringSafeArea(.all))
                reader.modalPresentationStyle = .formSheet
                UIApplication.shared.presentedViewController?.present(reader, animated: true)
            default:
                break
            }
        }

        /// ビューが切り替わったときにトークンを再生成するかどうかをチェックする
        override func viewDidLayoutSubviews() {}
    }
}

internal struct SplatNetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            SplatNetView(contentId: .SP3)
                .preferredColorScheme(.dark)
        })
    }
}

extension View {
    /// イカリング2, イカリング3を開く
    public func openInAppBrowser(isPresented: Binding<Bool>, contentId: ContentId) -> some View {
        fullScreenCover(isPresented: isPresented, content: {
            NavigationView(content: {
                SplatNetView(contentId: contentId)
                    .preferredColorScheme(.dark)
                    .toolBarBackground()
            })
        })
    }

    /// ナビゲーションバーの色を変更する(iOS16以上のみ効く)
    func toolBarBackground() -> some View {
        if #available(iOS 16.0, *) {
            return self
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.red, for: .navigationBar)
        } else {
            return self
        }
    }
}
