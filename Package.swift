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
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "9.1.7824"),
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git", from: "13.5.21355")
    ],
    targets: [
        .binaryTarget(
            name: "AtomicXCoreBinary",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/5.3/AtomicXCore_iOS_5.3.2.0_SDK.zip",
            checksum: "f7495542bbffb79440cbb74d2ec9f2ea78ecbbdac20a661f227631ef0b3b28e0"
        ),
        .target(
            name: "AtomicXCoreDeps",
            dependencies: [
                .product(name: "TXIMSDK_Plus_iOS_XCFramework", package: "Chat_SDK_SwiftPM"),
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
