// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SplatNet3",
    defaultLocalization: "jp",
    platforms: [
        .iOS(.v15), .macOS(.v12)
    ],
    products: [
        .library(
            name: "SplatNet3",
            targets: ["SplatNet3"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.6.0"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", from: "4.2.2"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "1.9.6"),
        .package(url: "https://github.com/SDBridge/SDBridgeSwift.git", from: "1.1.0"),
        .package(url: "https://github.com/stleamist/BetterSafariView.git", from: "2.4.0"),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect.git", from: "0.2.3"),
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.52.3"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.51.12")
    ],
    targets: [
        .target(
            name: "SplatNet3",
            dependencies: [
                "Alamofire",
                "KeychainAccess",
                "SwiftyBeaver",
                "SDBridgeSwift",
                "BetterSafariView",
                .product(name: "Introspect", package: "SwiftUI-Introspect")
            ],
            resources: [.process("Resources")],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint"),
            ]
        ),
        .testTarget(
            name: "SplatNet3Tests",
            dependencies: ["SplatNet3"]
        )
    ],
    swiftLanguageVersions: [
        .version("5.6")
    ]
)
