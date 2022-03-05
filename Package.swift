// swift-tools-version:5.3

import Foundation
import PackageDescription

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
  name: "LocalAuthDemo",
  platforms: [
    .macOS(.v10_14)
  ],
  products: [
    .library(
      name: "LocalAuthDemo",
      type: .static,
      targets: [
        "LocalAuthDemo"
      ]
    )
  ],
  dependencies: [
    .package(
      name: "FusionLocalAuth", url: "https://github.com/scade-platform/FusionLocalAuth.git",
      .branch("android_impl")),
   
  ],
  targets: [
    .target(
      name: "LocalAuthDemo",
      dependencies: [
        .product(name: "FusionLocalAuth", package: "FusionLocalAuth"),
      ],
      exclude: ["main.page"],
      swiftSettings: [
        .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
        .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
      ]
    )
  ]
)
