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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.0.0-beta.20230711141624"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230711141624"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.0.0-beta.20230711141624")
	],
	targets: [
		.target(name: "GXDebuggerWrapper",
				dependencies: [
					"GXDebugger",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .watchOS, .tvOS])),
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDebugger",
			url: "https://pkgs.genexus.dev/iOS/beta/GXDebugger-1.0.0-beta.20230711141624.xcframework.zip",
			checksum: "4bcb65ba4fc7abeaabf335da50bece19c43176f192b24b6b0fdd03e9178537d1"
		)
	]
)