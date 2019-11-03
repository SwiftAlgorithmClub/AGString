// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AGString",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "AGString",
            targets: ["AGString"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AGString",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "AGStringTests",
            dependencies: ["AGString"],
            path: "Tests"
        ),
    ]
)
