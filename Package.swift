// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXDebugger",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXDebugger",
			targets: ["GXDebuggerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.6.0-rc.0"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.6.0-rc.0"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.6.0-rc.0")
	],
	targets: [
		.target(name: "GXDebuggerWrapper",
				dependencies: [
					"GXDebugger",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .watchOS, .tvOS])),
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDebugger",
			url: "https://pkgs.genexus.dev/iOS/preview/GXDebugger-1.6.0-rc.0.xcframework.zip",
			checksum: "633485ff9c7d53da9234479ae6bfc78df17fbe42e3c7d9b2d58d4b11ee973104"
		)
	]
)