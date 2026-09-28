// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "RoomEngine",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "RoomEngine",
                 targets: ["RTCRoomEngineBinary", "RoomEngineDeps"])
    ],
    dependencies: [
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "9.0.7652"),
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM.git", from: "13.3.20845")
    ],
    targets: [
        .binaryTarget(
            name: "RTCRoomEngineBinary",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/release/4.3/RTCRoomEngine_iOS_4.3.0.49_SDK.zip",
            checksum: "bf104b6d64fd02066fefb28e744ebc5e692a33b29fea9a1c0b9d1694114efccd"
        ),
        .target(
            name: "RoomEngineDeps",
            dependencies: [
                .product(name: "Chat_SDK_SwiftPM", package: "Chat_SDK_SwiftPM"),
                .product(name: "Professional_SwiftPM", package: "Professional_SwiftPM")
            ],
            path: "Sources/Deps",
            linkerSettings: [
                .linkedFramework("CoreTelephony"),
                .linkedLibrary("sqlite3")
            ]
        )
    ]
)
