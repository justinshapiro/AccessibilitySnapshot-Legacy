// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AccessibilitySnapshot",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Core + SnapshotTesting for image comparison
        .library(
            name: "AccessibilitySnapshotLegacy",
            targets: ["AccessibilitySnapshotLegacy"]
        ),
        
        .library(
            name: "AccessibilitySnapshotLegacyCore",
            targets: ["AccessibilitySnapshotLegacyCore"]
        ),
    ],
    dependencies: [
        .package(
            name: "SnapshotTesting",
            url: "https://github.com/ugiacoman/swift-snapshot-testing.git",
            .revision("ee5dc8fad8004283ffebaaebfc447d7a00545618")
        )
    ],
    targets: [
        .target(
            name: "AccessibilitySnapshotLegacyCore-ObjC",
            path: "Sources/AccessibilitySnapshot/Core/ObjC"
        ),
        .target(
            name: "AccessibilitySnapshotLegacyCore",
            dependencies: ["AccessibilitySnapshotLegacyCore-ObjC"],
            path: "Sources/AccessibilitySnapshot/Core/Swift"
        ),
        .target(
            name: "AccessibilitySnapshotLegacy",
            dependencies: ["AccessibilitySnapshotLegacyCore", "SnapshotTesting"],
            path: "Sources/AccessibilitySnapshot/SnapshotTesting"
        )
    ]
)
