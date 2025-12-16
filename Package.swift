// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "RepositorySearchAPI",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "RepositorySearchAPI",
            targets: ["RepositorySearchAPI"]
        )
    ],
    targets: [
        .target(
            name: "RepositorySearchAPI",
            dependencies: []
        ),
        .testTarget(
            name: "RepositorySearchAPITests",
            dependencies: ["RepositorySearchAPI"]
        )
    ]
)
