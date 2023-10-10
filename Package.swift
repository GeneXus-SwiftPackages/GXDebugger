// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXDebugger",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXDebugger",
			targets: ["GXDebuggerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.3.0-rc.1"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.3.0-rc.1"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.3.0-rc.1")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXDebugger-1.3.0-rc.1.xcframework.zip",
			checksum: "cd034de794a2fdc1f9d9a2fcd2135edde4a243182fb64f2a379970ae03af75c9"
		)
	]
)