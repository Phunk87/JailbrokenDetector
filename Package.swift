// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "JailbrokenDetector",
    platforms: [
	.iOS(.v8)
    ],
    products: [
        .library(
            name: "JailbrokenDetector",
            targets: ["JailbrokenDetector"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "JailbrokenDetector",
            dependencies: [],
	    path: "JailbrokenDetector",
	    publicHeadersPath: "."),
        .testTarget(
            name: "JailbrokenDetectorTests",
            dependencies: ["JailbrokenDetector"]),
    ]
)
