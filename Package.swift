// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "AtomicXCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AtomicXCore",
                 targets: ["AtomicXCoreBinary", "AtomicXCoreDeps"])
    ],
    dependencies: [
        .package(url: "https://github.com/Tencent-RTC/RTCRoomEngine_SwiftPM.git", from: "4.3.0")
    ],
    targets: [
        .binaryTarget(
            name: "AtomicXCoreBinary",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/4.3/AtomicXCore_4.3.0.49.zip",
            checksum: "465d1c3ed83c5b67d0e0b32c4fe3e059c7b1f6f576d771c4e6a98d8de68161b1"
        ),
        .target(
            name: "AtomicXCoreDeps",
            dependencies: [
                .product(name: "RoomEngine", package: "RTCRoomEngine_SwiftPM")
            ],
            path: "Sources/Deps"
        )
    ]
)
