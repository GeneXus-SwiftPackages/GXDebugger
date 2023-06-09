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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", revision: "63d2b45412060c871123a524ac6d9239b205962f"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", revision: "02fd74284a30115df5e5c22f8b14f44194752676"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", revision: "2b1420b000073afd1f12b87c84c79b5661c4cc0b")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDebugger-1.0.0-beta+20230609175617.xcframework.zip",
			checksum: "3513e84d88fa2361865fb1553f20faa1f1cc6ceae4380e81e8aec18ab51e3e19"
		)
	]
)