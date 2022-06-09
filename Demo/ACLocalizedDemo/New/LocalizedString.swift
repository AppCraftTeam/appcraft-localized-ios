//
//  LocalizedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 28.04.2022.
//

import Foundation

public protocol LocalizedStringProtocol {
    func toString() -> String
    func toAttributedString() -> NSAttributedString
}

extension String: LocalizedStringProtocol {
    
    public func toString() -> String {
        self
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString())
    }
    
}

public struct LocalizedKeyString {
    public let key: String
    public let table: String
    public let args: [CVarArg]
}

extension LocalizedKeyString: LocalizedStringProtocol {
    
    public func toString() -> String {
        let format = ACLocalizedSettings.bundle.localizedString(forKey: self.key, value: nil, table: self.table)
        return String(format: format, locale: Locale.current, arguments: self.args)
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString())
    }
    
}

public struct LocalizedAttributedString {
    public let string: LocalizedStringProtocol
    public let attributes: [NSAttributedString.Key: Any]?
}

extension LocalizedAttributedString: LocalizedStringProtocol {
    
    public func toString() -> String {
        self.string.toString()
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString(), attributes: self.attributes)
    }
    
}

public struct LocalizedString {
    public var strings: [LocalizedStringProtocol]
    
    public static func + (lhs: LocalizedString, rhs: LocalizedString) -> LocalizedString {
        LocalizedString(strings: lhs.strings + rhs.strings)
    }
    
    public static func += (lhs: inout LocalizedString, rhs: LocalizedString) {
        lhs.strings += rhs.strings
    }
}

extension LocalizedString: LocalizedStringProtocol {
    
    public func toString() -> String {
        self.strings.reduce("", { $0 + $1.toString() })
    }
    
    public func toAttributedString() -> NSAttributedString {
        let result = NSMutableAttributedString()
        self.strings.forEach({ result.append($0.toAttributedString()) })
        
        return result
    }
    
}

extension LocalizedString: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.strings = [value]
    }
    
}

extension LocalizedString: CustomStringConvertible {
    
    public var description: String {
        self.toString()
    }
    
}

//extension LocalizedString: ExpressibleByStringInterpolation {
//
////    public struct StringInterpolation: StringInterpolationProtocol {
////        public typealias StringLiteralType = LocalizedString
////
////        init(literalCapacity: Int, interpolationCount: Int) {
////
////        }
////
////        mutating func appendLiteral(_ literal: LocalizedString) {
////
////        }
////    }
////
////    public init(stringInterpolation: StringInterpolation) {
//////        self.init("", "")
//////        self.stringInterpolation = stringInterpolation
////    }
//
//    struct LocalizedInterpolation: StringInterpolationProtocol {
//        typealias StringLiteralType = String
//
//        var values: [String] = []
//
//        init(literalCapacity: Int, interpolationCount: Int) {
//
//        }
//
//        mutating func appendLiteral(_ literal: String) {
//            values.append(literal)
//        }
//    }
//
//}



//public struct ACLocalizedString: ExpressibleByStringLiteral, ExpressibleByStringInterpolation, CustomStringConvertible {
//
//    // MARK: - Init
//    public init(_ key: String, _ table: String, _ args: CVarArg...) {
//        self.key = key
//        self.table = table
//        self.args = args
//    }
//
//    // MARK: - Props
//    public let key: String
//    public let table: String
//    public let args: [CVarArg]
//    public var isLiteral: Bool = false
//    public var stringInterpolation: StringInterpolation?
//
//    public struct StringInterpolation: StringInterpolationProtocol {
//        var output = ""
//
//        var stringsLocalized: [ACLocalizedString] = [] {
//            didSet { self.localized() }
//        }
//
//        public init(literalCapacity: Int, interpolationCount: Int) {
//            self.output.reserveCapacity(literalCapacity * 2)
//        }
//
//        mutating public func appendLiteral(_ literal: String) {
//            let localized = ACLocalizedString(stringLiteral: literal)
//            self.stringsLocalized.append(localized)
//        }
//
//        mutating public func appendInterpolation(localized: ACLocalizedString?) {
//            guard let localized = localized else { return }
//            self.stringsLocalized += [localized]
//        }
//
//        mutating public func appendInterpolation(string: String?) {
//            guard let string = string else { return }
//            let localized = ACLocalizedString(stringLiteral: string)
//            self.stringsLocalized += [localized]
//        }
//
//        @discardableResult
//        public mutating func localized() -> String {
//            self.output = self.stringsLocalized.reduce("", { $0 + $1.toLocalizedString() })
//            return self.output
//        }
//
//    }
//
//    public var description: String {
//        self.stringInterpolation?.output ?? ""
//    }
//
//    public init(stringLiteral value: String) {
//        self.init(value, "")
//        self.isLiteral = true
//    }
//
//    public init(stringInterpolation: StringInterpolation) {
//        self.init("", "")
//        self.stringInterpolation = stringInterpolation
//    }
//}
