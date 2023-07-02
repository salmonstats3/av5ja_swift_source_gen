//
//  FullScreenModifier.swift
//
//
//  Created by devonly on 2022/11/23.
//

import Introspect
import SwiftUI

public extension View {
    /// モーダルをUIKit風に表示する
    func fullScreen<Content: View>(
        isPresented: Binding<Bool>,
        presentationStyle _: UIModalPresentationStyle = .overFullScreen,
        transitionStyle _: UIModalTransitionStyle = .coverVertical,
        backgroundColor _: UIColor = .systemBackground,
        isModalInPresentation _: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        fullScreenCover(isPresented: isPresented, onDismiss: nil, content: {
            content()
                .introspectViewController(customize: { controller in
                    controller.view.backgroundColor = .clear
                })
        })
    }

    func fullScreen(
        isPresented: Binding<Bool>,
        session: SP3Session,
        presentationStyle _: UIModalPresentationStyle = .overFullScreen,
        transitionStyle _: UIModalTransitionStyle = .coverVertical,
        backgroundColor: UIColor = .systemBackground,
        isModalInPresentation _: Bool = true
    ) -> some View {
        fullScreen(isPresented: isPresented, backgroundColor: backgroundColor, content: {
            CoopResultDownloadView()
                .environmentObject(session)
        })
    }

    /// モーダルをUIKit風に表示する
    func sheet<Content: View>(
        isPresented: Binding<Bool>,
        presentationStyle _: UIModalPresentationStyle = .overFullScreen,
        transitionStyle _: UIModalTransitionStyle = .coverVertical,
        backgroundColor: UIColor = .systemBackground,
        isModalInPresentation _: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        sheet(isPresented: isPresented, onDismiss: nil, content: {
            content()
                .introspectViewController(customize: { controller in
                    controller.view.backgroundColor = backgroundColor
                })
        })
    }
}
