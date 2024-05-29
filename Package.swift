import PackageDescription

let package = Package(
    name: "FormatterHelper",
    platforms: [
        .iOS(.v12),   // Adjust the version as needed
        .macOS(.v10_12),
        // Add other platforms (watchOS, tvOS) as needed
    ],
    products: [
        .library(name: "FormatterHelper", targets: ["FormatterHelper"]),
    ],
    targets: [
        .binaryTarget(
            name: "FormatterHelper",
            url: "https://github.com/ThulaniMtetwa/CustomFormats/releases/download/1.0.2/FormatterHelper.xcframework.zip", // Replace with the actual URL
            checksum: "adffb844a5aa5853c469e23d900836ac9d3db802e5ff1b768d3f6f121b09966e"  // Replace with the actual checksum
        ),
    ]
)