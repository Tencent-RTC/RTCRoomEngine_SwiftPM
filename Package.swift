// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "RoomEngine",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "RoomEngine",
            targets: ["RoomEngine"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git", from: "12.9.0"),
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "8.5.6864")
    ],
    targets: [

        .binaryTarget(
            name: "RTCRoomEngine",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/3.6/RTCRoomEngine_iOS_3.6.3.91_SDK.zip",
            checksum: "c1a7d9b5ec3d8b5f0348e8656a16a8b20ae802d85fd954e93b5d9360e7a352f8"
        ),
        .target(
            name: "RoomEngine",
            dependencies: [
                .target(name: "RTCRoomEngine"),
                .product(name: "Professional_SwiftPM", package: "Professional_swiftpm"),
                .product(name: "TXLiteAVSDK_ReplayKit", package: "professional_swiftpm"), 
                .product(name: "Chat_SDK_SwiftPM", package: "chat_sdk_swiftpm")
            ],
            sources: ["RoomEngine.swift"],
            linkerSettings: [
                .linkedFramework("AudioToolBox"),
            ]
        )
    ]
)
