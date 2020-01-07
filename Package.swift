// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PlotZurbFoundation6",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PlotZurbFoundation6",
            targets: ["PlotZurbFoundation6"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/plot", from: "0.4.0"),
    ],
    targets: [
        .target(
            name: "PlotZurbFoundation6",
            dependencies: ["Plot"]),
//        .testTarget(
//            name: "PlotZurbFoundation6Tests",
//            dependencies: ["PlotZurbFoundation6"]),
    ]
)
