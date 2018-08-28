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
    ],
    targets: [
        .target(
            name: "Swerver",
            dependencies: [
                "Socket"
            ]),
        .testTarget(
            name: "SwerverTests",
            dependencies: ["Swerver"]),
    ]
)
