// swift-tools-version: 5.10.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DanmakuKit",
    platforms: [.macOS(.v10_13),
                .iOS(.v12),
                .tvOS(.v14),
                .watchOS(.v4),
                .visionOS(.v1),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DanmakuKit",
            targets: ["DanmakuKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1")),
        .package(url: "https://github.com/BBC6BAE9/Request.git", from: "0.0.3"),
        .package(url: "https://github.com/yahoojapan/SwiftyXMLParser.git", .upToNextMajor(from: "5.6.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DanmakuKit",
            dependencies: ["Alamofire", "Request", "SwiftyXMLParser"]
        ),
        .testTarget(
            name: "DanmakuKitTests",
            dependencies: ["DanmakuKit"]
        ),
    ]
)
