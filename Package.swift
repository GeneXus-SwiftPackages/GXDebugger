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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", revision: "e4bf5f323ad1a868f5204b2c6f2b23df0307d483"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", revision: "8d33dc7510f9908c8b1814a960f6afdd974e9c43"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", revision: "f4a22c776ac2bbff5a5c41117572cf5cb809324e")
	],
	targets: [
		.target(name: "GXDebuggerWrapper",
				dependencies: [
					"GXDebugger",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.tvOS, .watchOS, .iOS])),
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDebugger",
			url: "https://pkgs.genexus.dev/iOS/beta/GXDebugger-1.0.0-beta+20230610052334.xcframework.zip",
			checksum: "d1856fcbaf63301526b452b4efd8381a4d403501421650837d58864f9f9bec0d"
		)
	]
)