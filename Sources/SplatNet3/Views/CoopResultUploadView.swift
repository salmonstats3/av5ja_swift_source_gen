//
//  CoopResultUploadView.swift
//  SplatNet3
//
//  Created by devonly on 2022/11/26.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI

public struct CoopResultUploadView: View {
    @Environment(\.dismiss) var dismiss
    @State private var value: Float = .zero
    @State private var total: Float = 1
    let session: SP3Session
    let results: [CoopResult]

    public init(session: SP3Session, results: [CoopResult]) {
        self.session = session
        self.results = results
    }

    @ViewBuilder
    func makeBody(request: SPProgress) -> some View {
        switch request.progress {
        case .PROGRESS:
            ProgressView()
                .frame(width: 24, height: 24, alignment: .center)
                .opacity(1.0)
        case .SUCCESS:
            Image(systemName: "checkmark.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.green)
                .frame(width: 24, height: 24, alignment: .center)
        case .FAILURE:
            Image(systemName: "xmark.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: 24, height: 24, alignment: .center)
        }
    }

    public var body: some View {
        GroupBox(content: {
            VStack(content: {
                ForEach(session.requests, content: { request in
                    HStack(content: {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 60, height: 24, alignment: .center)
                            .foregroundColor(request.color)
                            .overlay(content: {
                                Text(request.type.rawValue)
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.body)
                            })
                        Text(request.path.rawValue)
                            .font(.body)
                            .frame(width: 220, height: nil, alignment: .leading)
                            .lineLimit(1)
                            .foregroundColor(.white)
                        makeBody(request: request)
                    })
                })
                ProgressView("", value: value, total: total)
            })
            .frame(width: 320)
        })
        .animation(.default, value: session.requests.count)
        .onDisappear(perform: {
            session.requests.removeAll()
        })
        .onAppear(perform: {
            Task(priority: .background, operation: {
                do {
                    try await session.uploadAllCoopResultDetailQuery(results: results, completion: { value, total in
                        withAnimation(.default) {
                            self.value = value
                            self.total = total
                        }
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        dismiss()
                    }
                } catch {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        dismiss()
                    }
                }
            })
        })
    }
}
