// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "HTMLDSL",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(name: "HTMLDSL", targets: ["HTMLDSL"])
    ],
    dependencies: [
        .package(url: "https://github.com/brokenhandsio/cmark-gfm.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "HTMLDSL",
            dependencies: [
                .product(name: "cmark", package: "cmark-gfm")
            ]
        ),
        .testTarget(name: "HTMLDSLTests", dependencies: ["HTMLDSL"])
    ]
)
