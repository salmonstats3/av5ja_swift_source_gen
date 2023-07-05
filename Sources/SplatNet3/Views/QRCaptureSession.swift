//
//  QRCaptureSession.swift
//  SplatNet3
//
//  Created by devonly on 2023/03/16.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

internal class QRCaptureSession: AVCaptureSession, AVCaptureMetadataOutputObjectsDelegate, AVCaptureVideoDataOutputSampleBufferDelegate {
    /// 処理を実行するキュー
    private let queue = DispatchQueue(label: "QRCaptureSessioin")
    /// QRコードを読み取ったときに呼ばれる
    internal var onDidFinish: ((String) -> Void) = { _ in }

    /// イニシャライザ
    override init() {
        super.init()
        let session = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back)
        guard let device: AVCaptureDevice = session.devices.first,
              let deviceInput = try? AVCaptureDeviceInput(device: device)
        else {
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if canAddInput(deviceInput),
           canAddOutput(metadataOutput) {
            addInput(deviceInput)
            addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: queue)
            metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        }
    }

    private func requestAuthorization() {
        #if !targetEnvironment(simulator)
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                break
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video, completionHandler: { _ in })
            case .denied:
                let alert = UIAlertController(
                    title: LocalizedType.CommonHome.description,
                    message: LocalizedType.CommonClose.description,
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: LocalizedType.CommonDecide.description, style: .default))
                UIApplication.shared.foregroundScene?.windows.first?.rootViewController?.present(alert, animated: true)
            case .restricted:
                break
            @unknown default:
                fatalError()
            }
        #endif
    }

    override func startRunning() {
        #if !targetEnvironment(simulator)
        requestAuthorization()
        if isRunning {
            return
        }
        DispatchQueue.global(qos: .background).async {
            super.startRunning()
        }
        #endif
    }

    override func stopRunning() {
        #if !targetEnvironment(simulator)
        if !isRunning {
            return
        }
        DispatchQueue.global(qos: .background).async {
            super.stopRunning()
        }
        #endif
    }

    func captureOutput(_: AVCaptureOutput, didDrop _: CMSampleBuffer, from _: AVCaptureConnection) {}

    /// バーコードを認識したときに呼ばれる
    func metadataOutput(_: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from _: AVCaptureConnection) {
        guard let metadata = metadataObjects.first,
              let readable: AVMetadataMachineReadableCodeObject = metadata as? AVMetadataMachineReadableCodeObject,
              let stringValue: String = readable.stringValue
        else {
            return
        }
        onDidFinish(stringValue)
        stopRunning()
    }
}

// swiftlint:disable:next type_name
internal class _QRReaderView: UIView {
    private let session: QRCaptureSession
    private let previewLayer = AVCaptureVideoPreviewLayer()

    /// イニシャライザ
    init(session: QRCaptureSession) {
        self.session = session
        previewLayer.session = session
        super.init(frame: .zero)
    }

    /// イニシャライザ
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    /// イニシャライザ
    init(frame: CGRect, reader: QRCaptureSession) {
        session = reader
        super.init(frame: frame)
    }

    /// 起動しているかどうか
    var isRunning: Bool {
        session.isRunning
    }

    /// カメラを起動
    func startRunning() {
        session.startRunning()
    }

    /// カメラを終了
    func stopRunning() {
        session.stopRunning()
    }

    /// サブビューを追加したときの処理
    override func layoutSubviews() {
        previewLayer.frame = bounds
        previewLayer.videoGravity = .resizeAspectFill

        layer.addSublayer(previewLayer)
    }
}

extension AVMetadataObject.ObjectType {
    static let full: [Self] =
        [
            .upce,
            .code39,
            .code39Mod43,
            .ean13,
            .ean8,
            .code93,
            .code128,
            .pdf417,
            .qr,
            .aztec,
            .interleaved2of5,
            .itf14,
            .dataMatrix
        ]
}
