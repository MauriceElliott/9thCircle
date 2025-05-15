// swift-tools-version: 6.0

import Foundation
import PackageDescription


let package = Package(
    name: "9thCircle",
    platforms: [.macOS(.v14)],
    products: [.library(name: "9thCircle", targets: ["9thCircle"])],
    dependencies: [
        .package(url: "https://github.com/finnvoor/PlaydateKit.git", branch: "improvement/swiftpm-build-system"),
    ],
    targets: [
        .target(
            name: "9thCircle",
            dependencies: [
                .product(name: "PlaydateKit", package: "PlaydateKit")
            ],
            swiftSettings: [
                .enableExperimentalFeature("Embedded"),
                .unsafeFlags([
                    "-whole-module-optimization",
                    "-Xfrontend", "-disable-objc-interop",
                    "-Xfrontend", "-disable-stack-protector",
                    "-Xfrontend", "-function-sections",
                    "-Xfrontend", "-gline-tables-only",
                    "-Xcc", "-DTARGET_EXTENSION",
                    "-Xcc", "-I", "-Xcc", "/usr/local/playdate/gcc-arm-none-eabi-9-2019-q4-major/lib/gcc/arm-none-eabi/9.2.1/include",
                    "-Xcc", "-I", "-Xcc", "/usr/local/playdate/gcc-arm-none-eabi-9-2019-q4-major/lib/gcc/arm-none-eabi/9.2.1/include-fixed",
                    "-Xcc", "-I", "-Xcc", "/usr/local/playdate/gcc-arm-none-eabi-9-2019-q4-major/lib/gcc/arm-none-eabi/9.2.1/../../../../arm-none-eabi/include",
                    "-I", "\(Context.environment["PLAYDATE_SDK_PATH"] ?? "\(Context.environment["HOME"]!)/Developer/PlaydateSDK/")/C_API"
                ]),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
