//
//  AssetsView.swift
//  SplatNet3
//
//  Created by devonly on 2023/07/01.
//  Copyright © 2023 Magi, Corporation. All rights reserved.
//

import SwiftUI

public struct AssetsView: View {
    @StateObject private var session = HashClient()
    @Environment(\.dismiss) var dismiss

    public init() {}

    public var body: some View {
        GroupBox(content: {
            VStack(content: {
                if session.total == .zero {
                    ProgressView()
                } else {
                    ProgressView(
                        value: Float(session.value),
                        total: Float(session.total),
                        label: {
                            Text(LocalizedType.InitialSetup.description)
                        }, currentValueLabel: {
                            Text("")
                        }
                    )
                }
            })
            .frame(width: 320)
        })
        .animation(.default, value: session.total)
        .onAppear(perform: {
            Task(priority: .medium, operation: {
                do {
                    try await session.getAssets()
                } catch {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        dismiss()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    dismiss()
                }
            })
        })
    }
}

internal struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView()
            .environmentObject(SP3Session())
    }
}
