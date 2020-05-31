// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Imgurr",
    platforms: [.macOS(.v10_13)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(name: "imgurr", targets: ["Imgurr"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/henrik-dmg/CLIFoundation", from: "0.0.1"),
        .package(path: "../HPNetwork"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ImgurrCore",
            dependencies: ["CLIFoundation", "HPNetwork", .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .target(
            name: "Imgurr",
            dependencies: ["ImgurrCore"]),
        .testTarget(
            name: "ImgurrTests",
            dependencies: ["ImgurrCore"]),
    ]
)
