//
//  NSScriptMessageName.swift
//  SplatNet3
//
//  Created by devonly on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//
import Foundation

internal enum NSScriptMessageName: String, CaseIterable {
    case closeWebView
    case reloadExtension
    case completeLoading
    case invokeNativeShare
    case invokeNativeShareUrl
    case copyToClipboard
    case downloadImages
    case endHookConsole = "end hook Console."
    case sourceCamera = #"{"source":"camera"}"#
    case sourcePhotoLibrary = #"{"source":"photo_library"}"#

    static func from(rawValue: String) -> Self? {
        if let script = Self(rawValue: rawValue) {
            return script
        }

        guard let data: Data = rawValue.data(using: .utf8)
        else {
            return nil
        }

        let decoder = SPDecoder()
        if (try? decoder.decode(ShareURL.self, from: data)) != nil {
            return .invokeNativeShareUrl
        }

        if (try? decoder.decode(ShareImg.self, from: data)) != nil {
            return .invokeNativeShare
        }

        if (rawValue.capture(pattern: #"([A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4})"#, group: 1)) != nil {
            return .copyToClipboard
        }

        if !rawValue.capture(pattern: #"(https://[^,^\]]*)"#).isEmpty {
            return .downloadImages
        }

        return nil
    }
}
