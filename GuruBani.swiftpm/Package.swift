// swift-tools-version: 6.0

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "EkamBani",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "EkamBani",
            targets: ["AppModule"],
            bundleIdentifier: "Galgotias.EkamBani",
            teamIdentifier: "3MV965C844",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .paper),
            accentColor: .presetColor(.orange),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ],
    swiftLanguageVersions: [.v6]
)
