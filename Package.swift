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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", 108a71075c951998bdaa4037da97c513d0de271c),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", d60601ead23ef16bd8e55ba8bcf14734fe357b5e),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", c7f5e1d8ea6bd7e5a780f307eae7a43e471cbfd0)
	],
	targets: [
		.target(name: "GXDebuggerWrapper",
				dependencies: [
					"GXDebugger",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.tvOS, .iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.tvOS, .iOS, .watchOS])),
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDebugger",
			url: "https://pkgs.genexus.dev/iOS/beta/GXDebugger-1.0.0-beta+20230608211628.xcframework.zip",
			checksum: "8c4a62f363bd30f2548c94c5f0d9f2e5fabe8ffccb69130a71010bcdcf4f45d5"
		)
	]
)