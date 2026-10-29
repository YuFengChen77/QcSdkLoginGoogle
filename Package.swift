// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "QcSdkLoginGoogle", defaultLocalization: "en", platforms: [.iOS(.v17)],

    products: [
        .library(name: "QcSdkLoginGoogle", targets: ["QcSdkLoginGoogle", "QcSdkLoginGoogleSupport"])
    ],

    dependencies: [
        .package(url: "https://github.com/YuFengChen77/QcSdkCore.git", exact: "1.1.5"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", exact: "10.0.0")
    ],

    targets: [
        .binaryTarget(name: "QcSdkLoginGoogle", url: "https://github.com/YuFengChen77/QcSdkLoginGoogle/releases/download/1.1.2/QcSdkLoginGoogle-1.1.2.xcframework.zip", checksum: "68b51e53a9487393df72bf98325f9b37f03613e64dc8450233afaa1008866e00"),

        .target(name: "QcSdkLoginGoogleSupport", dependencies: ["QcSdkLoginGoogle", .product(name: "QcSdkCore", package: "qcsdkcore"), .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS")], path: "QcSdkLoginGoogle", sources: ["Sources"])
    ]
)
