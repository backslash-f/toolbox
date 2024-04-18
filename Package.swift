// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Toolbox",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "Toolbox",
            targets: ["Toolbox"]
        )
    ],
    targets: [
        .target(
            name: "Toolbox"
        ),
        .testTarget(
            name: "ToolboxTests",
            dependencies: ["Toolbox"]
        )
    ]
)
