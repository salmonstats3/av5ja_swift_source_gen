//
//  SwiftUIView.swift
//
//
//  Created by devonly on 2023/03/16.
//

import SwiftUI
import UIKit

public struct QRReaderView: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss
    let reader: QRCaptureSession
    let session = SP3Session()
    let view: UIView

    public init() {
        reader = QRCaptureSession()
        view = _QRReaderView(session: reader)
        reader.onDidFinish = { _ in
            DispatchQueue.main.async {
                UIApplication.shared.startAnimating(completion: {
//                    Task(priority: .utility, operation: {
//                        do {
//                            let response = try await session.getCheckInWithQRCodeMutation(eventId: code)
//                        } catch {
//                            SwiftyLogger.error(error)
//                        }
//                        UIApplication.shared.presentedViewController?.dismiss(animated: true)
//                    })
                })
            }
        }
    }

    public func makeCoordinator() -> Coordinator {}

    public func makeUIViewController(context _: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view = view
        reader.startRunning()
        return controller
    }

    public func updateUIViewController(_: UIViewController, context _: Context) {}
}

internal struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QRReaderView()
    }
}
