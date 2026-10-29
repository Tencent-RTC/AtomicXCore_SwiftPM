// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "AtomicXCore",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "AtomicXCore",
                 targets: ["AtomicXCoreBinary", "AtomicXCoreDeps"])
    ],
    dependencies: [
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "9.0.7652"),
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git", from: "13.5.21355")
    ],
    targets: [
        .binaryTarget(
            name: "AtomicXCoreBinary",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/5.3/AtomicXCore_iOS_5.3.0.14_SDK.zip",
            checksum: "f514a358943d4d85f588ef9f1b4c74e591d61a573bd38b34d48d6833dbdf5c41"
        ),
        .target(
            name: "AtomicXCoreDeps",
            dependencies: [
                .product(name: "Chat_SDK_SwiftPM", package: "Chat_SDK_SwiftPM"),
                .product(name: "Professional_SwiftPM", package: "Professional_SwiftPM")
            ],
            path: "Sources/Deps",
            linkerSettings: [
                .linkedFramework("CoreTelephony"),
                .linkedFramework("Foundation"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedLibrary("c++"),
                .linkedLibrary("sqlite3")
            ]
        )
    ]
)
