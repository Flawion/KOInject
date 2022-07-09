// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "KOInject",
    platforms: [.iOS(.v11), .macOS(.v10_13), .watchOS(.v4), .tvOS(.v11)],
    products: [
        .library(
            name: "KOInject",
            targets: ["KOInject"])
    ],
    targets: [
        .target(
            name: "KOInject",
            path: "Sources"
        ),
        .testTarget(
            name: "KOInjectTests",
            dependencies: ["KOInject"],
            path: "Tests"
        )
    ]
)
