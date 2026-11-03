// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BCLanguages",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "BCLanguages",
            targets: ["BCLanguages"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ChimeHQ/SwiftTreeSitter.git",
            from: "0.9.0"
        ),
    ],
    targets: [
        .target(
            name: "BCLanguages",
            dependencies: ["CodeLanguagesContainer", "SwiftTreeSitter"],
            resources: [
                .copy("Resources")
            ],
            linkerSettings: [.linkedLibrary("c++")]
        ),

        .binaryTarget(
            name: "CodeLanguagesContainer",
            path: "CodeLanguagesContainer.xcframework.zip"
        ),

        .testTarget(
            name: "BCLanguagesTests",
            dependencies: ["BCLanguages"]
        ),
    ]
)
