// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ACLocalized",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "ACLocalized",
            targets: ["ACLocalized"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ACLocalized",
            dependencies: [],
            path: "Sources/ACLocalized"
        ),
        .testTarget(
            name: "ACLocalizedStringsTests",
            dependencies: ["ACLocalized"],
            path: "Tests/ACLocalizedStringTests",
            resources: [
                .process("Tests/ACLocalizedStringTests/Localized")
            ]
        ),
    ]
)
