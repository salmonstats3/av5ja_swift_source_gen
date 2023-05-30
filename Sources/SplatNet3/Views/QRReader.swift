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
        self.reader = QRCaptureSession()
        self.view = _QRReaderView(session: reader)
        self.reader.onDidFinish = { code in
            DispatchQueue.main.async(execute: {
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
            })
        }
    }

    public func makeCoordinator() -> Coordinator {
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view = self.view
        self.reader.startRunning()
        return controller
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QRReaderView()
    }
}
