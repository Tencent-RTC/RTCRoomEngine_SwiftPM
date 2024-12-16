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
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git", .branch("main")),
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "8.3.6498")
    ],
    targets: [

        .binaryTarget(
            name: "RTCRoomEngine",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/2.7/RTCRoomEngine_iOS_2.7.0.112_SDK.zip",
            checksum: "df2bb1da7528da8a7a5dd9cfb02d5e78770b406895ac45432d1e1ec4c34ebd82"
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
                .linkedFramework("AVKit"),
                .linkedFramework("AudioToolBox"),
                .linkedFramework("VideoToolBox"),
                .linkedFramework("GLKit"),
                .linkedFramework("AssetsLibrary"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("Accelerate"),
                .linkedFramework("ReplayKit"),
                .linkedFramework("MetalKit"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("MetalPerformanceShaders"),
                .linkedLibrary("sqlite3.0"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv")
            ]
        )
    ]
)
