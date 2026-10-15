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
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git", from: "13.3.20845")
    ],
    targets: [
        .binaryTarget(
            name: "AtomicXCoreBinary",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/5.2/AtomicXCore_iOS_5.2.0.124_SDK.zip",
            checksum: "52a59d702307123aa1ca12122d96d3544499d0e61ec7365a0fcc0c5a0ca04b1d"
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
