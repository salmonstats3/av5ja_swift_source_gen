//
//  OAuthView.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import SwiftUI
import WebKit
import BetterSafariView

public struct OAuthView: UIViewControllerRepresentable {
    typealias UIViewType = WKWebView
    let contentId: ContentId

    public init(contentId: ContentId) {
        self.contentId = contentId
    }

    public func makeUIViewController(context: Context) -> SPWebViewController {
        SPWebViewController(contentId: contentId)
    }

    public func updateUIViewController(_ uiViewController: SPWebViewController, context: Context) {
    }
}

struct SPAuthorizeView_Previews: PreviewProvider {
    static var previews: some View {
        OAuthView(contentId: .SP3)
    }
}

public enum AuthType: Int, CaseIterable, Identifiable {
    public var id: Int { rawValue }
    case safari
    case webkit
}

extension View {
    @ViewBuilder
    public func authorize(isPresented: Binding<Bool>, contentId: ContentId, session: SP3Session, using: AuthType = .webkit) -> some View {
        switch using {
        case .safari:
            self.sheet(isPresented: isPresented, content: {
                OAuthView(contentId: contentId)
            })
        case .webkit:
            let state: String = String.randomString
            let verifier: String = String.randomString
            self.webAuthenticationSession(isPresented: isPresented, content: {
                WebAuthenticationSession(url: URL(state: state, verifier: verifier), callbackURLScheme: "npf71b963c1b7b6d119", onCompletion: { result in
                    switch result {
                    case .success(let url):
                        guard let code = url.absoluteString.capture(pattern: "de=(.*)&", group: 1) else {
                            SwiftyLogger.error("The callbackURLScheme does not include session token code.")
                            return
                        }
                        let hosting: UIHostingController = UIHostingController(
                            rootView: SignInView(code: code, verifier: verifier, contentId: contentId).environmentObject(session)
                        )
                        hosting.isModalInPresentation = true
                        hosting.modalTransitionStyle = .crossDissolve
                        hosting.modalPresentationStyle = .overFullScreen
                        hosting.overrideUserInterfaceStyle = .dark
                        hosting.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
                        UIApplication.shared.rootViewController?.present(hosting, animated: true)
                    case .failure(let error):
                        if (error as NSError).code != 1 {
                            SwiftyLogger.error(error)
                        }
                    }
                })
                .prefersEphemeralWebBrowserSession(!session.useEphmeralSession)
            })
        }
    }
}
