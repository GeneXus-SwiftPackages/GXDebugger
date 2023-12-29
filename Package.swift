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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.4.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.4.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.4.0-beta.6")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDebugger-1.4.0-beta.6.xcframework.zip",
			checksum: "db4d46ff713c7da1acd8f309b7a9422afabdb13c80ed7c45425a4e65626d5cf8"
		)
	]
)