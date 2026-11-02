// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "QcSdkLoginGoogle", defaultLocalization: "en", platforms: [.iOS(.v17)],

    products: [
        .library(name: "QcSdkLoginGoogle", targets: ["QcSdkLoginGoogle", "QcSdkLoginGoogleSupport"]),
        .library(name: "QcSdkLoginGoogleDependencies", type: .dynamic, targets: ["QcSdkLoginGoogleDependencies"])
    ],

    dependencies: [
        .package(url: "https://github.com/YuFengChen77/QcSdkCore.git", exact: "2.0.0-beta.1"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", exact: "10.0.0")
    ],

    targets: [
        .binaryTarget(name: "QcSdkLoginGoogle", url: "https://github.com/YuFengChen77/QcSdkLoginGoogle/releases/download/2.0.0-beta.1/QcSdkLoginGoogle-2.0.0-beta.1.xcframework.zip", checksum: "7ed48d116cdef690c1237b895954fd667cc5400ba93ee9024ffa2b3b27000083"),

        .target(name: "QcSdkLoginGoogleSupport", dependencies: ["QcSdkLoginGoogle", .product(name: "QcSdkCore", package: "qcsdkcore")], path: "QcSdkLoginGoogle", exclude: ["DependencySources"], sources: ["Sources"]),
        .target(name: "QcSdkLoginGoogleDependencies", dependencies: [.product(name: "GoogleSignIn", package: "GoogleSignIn-iOS")], path: "QcSdkLoginGoogle", exclude: ["Sources"], sources: ["DependencySources"])
    ]
)
