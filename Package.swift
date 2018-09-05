// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swerver",
    products: [
        .library(
            name: "Swerver",
            targets: ["Swerver"]),
    ],
    dependencies: [
    .package(url: "https://github.com/IBM-Swift/BlueSocket.git", from: "1.0.8"),
    .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "1.5.1"),
    ],
    targets: [
        .target(
            name: "Swerver",
            dependencies: [
                "Socket", "SwiftyBeaver"
            ],
            path: "Sources/SwerverCore"),
        .testTarget(
            name: "SwerverTests",
            dependencies: ["Swerver"]),
    ]
)
