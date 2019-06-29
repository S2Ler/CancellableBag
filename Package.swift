// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "CancellableBag",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .tvOS(.v13),
    .watchOS(.v6)
  ],
  products: [
    .library(
      name: "CancellableBag",
      targets: ["CancellableBag"]),
  ],
  targets: [
    .target(
      name: "CancellableBag",
      dependencies: []),
    .testTarget(
      name: "CancellableBagTests",
      dependencies: ["CancellableBag"]),
  ]
)
