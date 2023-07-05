//
//  UIApplication.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/23.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

public extension UIApplication {
    /// UIWindow
    var window: UIWindow? {
        UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.first?.windows.first
    }

    /// UIWindow
    var firstWindow: UIWindow? {
        UIApplication.shared.foregroundScene?.windows.first
    }

    /// UIWindow
    var lastWindow: UIWindow? {
        UIApplication.shared.foregroundScene?.windows.last
    }

    /// UIWindowScene
    var foregroundScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.first(where: { $0.activationState == .foregroundActive })
    }

    /// 現在表示されているViewの親View
    var rootViewController: UIViewController? {
        firstWindow?.rootViewController
    }

    /// 現在表示されている最も上位のView
    var presentedViewController: UIViewController? {
        guard let window: UIWindow = firstWindow
        else {
            return nil
        }
        // 秘密のおまじない
        window.makeKeyAndVisible()

        guard let rootViewController = window.rootViewController
        else {
            return nil
        }

        var topViewController: UIViewController? = rootViewController
        while let newTopViewController: UIViewController = topViewController?.presentedViewController {
            topViewController = newTopViewController
        }
        return topViewController
    }

    /// ロード画面を表示して処理を実行する
    func startAnimating(completion: @escaping () -> Void) {
        let controller = UIViewController(nibName: nil, bundle: nil)

        let progress = UIActivityIndicatorView(style: .medium)
        progress.overrideUserInterfaceStyle = .dark
        progress.hidesWhenStopped = true
        progress.startAnimating()
        progress.center = controller.view.center
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overFullScreen
        controller.overrideUserInterfaceStyle = .dark
        controller.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        controller.view.addSubview(progress)
        UIApplication.shared.presentedViewController?.present(controller, animated: true, completion: completion)
        UIApplication.shared.presentedViewController?.dismiss(animated: true)
    }

    func startAnimatingWithAsync(completion: @escaping @Sendable () async throws -> Void) async throws {
        let controller = UIViewController(nibName: nil, bundle: nil)

        let progress = UIActivityIndicatorView(style: .medium)
        progress.overrideUserInterfaceStyle = .dark
        progress.hidesWhenStopped = true
        progress.startAnimating()
        progress.center = controller.view.center
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overFullScreen
        controller.overrideUserInterfaceStyle = .dark
        controller.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        controller.view.addSubview(progress)
        UIApplication.shared.presentedViewController?.present(controller, animated: true)
        do {
            try await completion()
            UIApplication.shared.presentedViewController?.dismiss(animated: true)
        } catch {
            UIApplication.shared.presentedViewController?.dismiss(animated: true)
            throw error
        }
    }

    func authorize(sessionToken: String, contentId _: ContentId) {
        let hosting = UIHostingController(rootView: _SignInView(sessionToken: sessionToken))
        hosting.modalPresentationStyle = .overFullScreen
        hosting.modalTransitionStyle = .coverVertical
        hosting.overrideUserInterfaceStyle = .dark
        hosting.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.presentedViewController?.present(hosting, animated: true)
        }
    }

    /// 一番上にジャンプする
    func popToRootView() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController,
           let navigationController = findNavigationController(rootViewController) {
            navigationController.popToRootViewController(animated: true)
        }
    }

    func findNavigationController(_ viewController: UIViewController?) -> UINavigationController? {
        guard let viewController else {
            return nil
        }

        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        for childViewController in viewController.children {
            return findNavigationController(childViewController)
        }

        return nil
    }
}

public extension UIViewController {
    func popover(_ viewControllerToPresent: UIActivityViewController, animated: Bool, completion: (() -> Void)? = nil) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popover = viewControllerToPresent.popoverPresentationController {
                popover.sourceView = viewControllerToPresent.view
                popover.barButtonItem = .none
                popover.sourceRect = viewControllerToPresent.accessibilityFrame
            }
        }
        present(viewControllerToPresent, animated: animated, completion: completion)
    }
}
