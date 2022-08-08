// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "HTMLDSL",
    platforms: [.macOS(.v11)],
    products: [
        .library(name: "HTMLDSL", targets: ["HTMLDSL"])
    ],
    targets: [
        .systemLibrary(
            name: "Ccmark",
            pkgConfig: "libcmark",
            providers: [
                .apt(["cmark"]),
                .brew(["cmark"]),
            ]
        ),
        .target(name: "HTMLDSL", dependencies: ["Ccmark"]),
        .testTarget(name: "HTMLDSLTests", dependencies: ["HTMLDSL"])
    ]
)
