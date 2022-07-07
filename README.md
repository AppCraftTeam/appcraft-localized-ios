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
[SwiftGen Template](#SwiftGen-Template)\
[Demo](#Demo)\
[Install](#Install)\
[License](#License)\
[Author](#Author)

## Core
Singleton class for general bundle settings, locale and language.

```swift
public class ACLocalizedCore {
    public static let shared = ACLocalizedCore()
    
    public var coreBundle: Bundle
    public var defaultLanguage: ACLocalizedLanguage
    public var language: ACLocalizedLanguage
    public var supportedLanguages: [ACLocalizedLanguage]
    
    public func localizedString(key: String, table: String, args: CVarArg...) -> String
}
```

## Strings
The library provides several types of localized strings. Each of them corresponds to the general protocol `ACLocalizedStringProtocol`. Which provides the translation of a localized string to `String` and `NSAttributedString`.

```swift
public protocol ACLocalizedStringProtocol {
    func toString() -> String
    func toAttributedString() -> NSAttributedString
}
```

### ACLocalizedKeyString
Localized string that takes its value from localization tables by key.
 
 ```swift
public struct ACLocalizedKeyString {
    public let key: String
    public let table: String
    public let args: [CVarArg]
}
```

The string is received using the method from `ACLocalizedCore`:

 ```swift
extension ACLocalizedKeyString: ACLocalizedStringProtocol {
    
    public func toString() -> String {
        ACLocalizedCore.shared.localizedString(key: self.key, table: self.table, args: self.args)
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString())
    }
    
}
```

### ACLocalizedAttributedString
Localized string with attributes.

 ```swift
public struct ACLocalizedAttributedString {
    public let string: ACLocalizedStringProtocol
    public let attributes: [NSAttributedString.Key: Any]?
}
```

Any string corresponding to the `ACLocalizedStringProtocol` can be used as the `string` parameter. `Attributes` will be applied to the result from `toString()`:

 ```swift
extension ACLocalizedAttributedString: ACLocalizedStringProtocol {
    
    public func toString() -> String {
        self.string.toString()
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString(), attributes: self.attributes)
    }
    
}
```

If the value of the `string` parameter is `ACLocalizedAttributedString` then its `attributes` will be ignored.

### ACLocalizedString
Represents a composition of various strings corresponding to the protocol `ACLocalizedStringProtocol`.

```swift
public struct ACLocalizedString {
    public var strings: [ACLocalizedStringProtocol]
}
```

`Strings` can contain any value. When translated into a string, they will be combined:

```swift
extension ACLocalizedString: ACLocalizedStringProtocol {
    
    public func toString() -> String {
        self.strings.reduce("", { $0 + $1.toString() })
    }
    
    public func toAttributedString() -> NSAttributedString {
        let result = NSMutableAttributedString()
        self.strings.forEach({ result.append($0.toAttributedString()) })
        
        return result
    }
    
}
```

Addition operations are also available:
- `ACLocalizedString` + `ACLocalizedString` = `ACLocalizedString`
- `ACLocalizedString` += `ACLocalizedString`

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
