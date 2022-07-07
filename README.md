# ACLocalized
Library for localizing UI of application `on the fly`.

[![version](https://img.shields.io/badge/version-1.0.0-white.svg)](https://semver.org)

## Requirements
* IOS 11 or above
* Xcode 12.5 or above

## Overview
[Core](#Core)\
[Strings](#Strings)\
[UIKit](#UIKit)\
[SwiftGen Template](#SwiftGen Template)\
[Demo](#Demo)\
[Install](#Install)\
[License](#License)\
[Author](#MVAuthorVM)

## Core

## Strings
The library provides several types of localized strings. Each of them corresponds to the general protocol `ACLocalizedStringProtocol`. Which provides the translation of a localized string to `String` and `NSAttributedString`.

```swift
public protocol ACLocalizedStringProtocol {
    func toString() -> String
    func toAttributedString() -> NSAttributedString
}
```

### ACLocalizedKeyString

### ACLocalizedAttributedString

### ACLocalizedString

## UIKit

## SwiftGen Template

## Demo
[Small project](/Demo) demonstrating the interaction of `ACLocalized` modules in the application.

## Install
Swift Package Manager(SPM) is Apple's dependency manager tool. It is now supported in Xcode 11. So it can be used in all appleOS types of projects. It can be used alongside other tools like CocoaPods and Carthage as well.

### Install package into your packages
Add a reference and a targeting release version in the dependencies section in Package.swift file:

```swift
import PackageDescription

let package = Package(
    name: "<your_project_name>",
    products: [],
    dependencies: [
        .package(url: "https://github.com/DPLibs/appcraft-localized-ios.git", from: "<current_version>")
    ]
)
```

### Install package via Xcode

1. Go to `File` -> `Swift Packages` -> `Add Package Dependency...`
2. Then search for <https://github.com/DPLibs/appcraft-localized-ios.git>
3. And choose the version you want

## License
Distributed under the MIT License.

## Author
Email: <dmitriyap11@gmail.com>
