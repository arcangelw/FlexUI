// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlexUI",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "FlexUI",
            targets: ["FlexUI"]
        ),
        .library(
            name: "FlexUIDynamic",
            type: .dynamic,
            targets: ["FlexUI"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/layoutBox/FlexLayout",
            .upToNextMajor(from: "2.0.10")
        ),
    ],
    targets: [
        .target(
            name: "FlexUI",
            dependencies: [
                .product(name: "FlexLayout", package: "FlexLayout"),
            ],
            path: "Sources/"
        ),
        .testTarget(
            name: "FlexUITests",
            dependencies: [
                "FlexUI",
            ],
            path: "Tests/"
        ),
    ]
)
