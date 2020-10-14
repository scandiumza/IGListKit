// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "IGListKit",
    platforms: [ .iOS(.v9),
                 .tvOS(.v9),
                 .macOS(.v10_15)
    ],
    products: [
        .library(name: "IGListDiffKit",
                 type: .static ,
                 targets: ["IGListDiffKit"]),
        .library(name: "IGListKit",
                 type: .static,
                 targets: ["IGListKit"]),
        .library(name: "IGListSwiftKit",
                 type: .static,
                 targets: ["IGListSwiftKit"]),
    ],
    targets: [
        .target(
            name: "IGListDiffKit",
            path: "Source/IGListDiffKit",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("../"),
                .headerSearchPath("../Internal"),
                .headerSearchPath("Internal")
            ]
        ),
        .target(
            name: "IGListKit",
            dependencies: ["IGListDiffKit"],
            path: "Source/IGListKit",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("../"),
                .headerSearchPath("../IGListDiffKit/Internal"),
                .headerSearchPath("Internal"),
                .headerSearchPath("../Internal"),
            ]
        ),
        .target(
            name: "IGListSwiftKit",
            dependencies: ["IGListKit"],
            path: "Source/IGListSwiftKit",
            cSettings: [
                .headerSearchPath("../"),
                .headerSearchPath("../IGListDiffKit/Internal"),
                .headerSearchPath("../IGListKit/Internal"),
            ]
        ),
    ],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11
)
