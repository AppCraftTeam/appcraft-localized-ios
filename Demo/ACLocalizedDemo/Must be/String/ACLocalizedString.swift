//
//  ACLocalizedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation

public struct ACLocalizedString {

    // MARK: - Init
    public init(_ key: String, _ table: String, _ args: CVarArg...) {
        self.key = key
        self.table = table
        self.args = args
    }

    // MARK: - Props
    public let key: String
    public let table: String
    public let args: [CVarArg]
    public var isLiteral: Bool = false
}

// MARK: - ACLocalizedString + ExpressibleByStringLiteral
extension ACLocalizedString: ExpressibleByStringLiteral {

    public typealias StringLiteralType = String

    public init(stringLiteral value: String) {
        self.init(value, "")
        self.isLiteral = true
    }
}

// MARK: - ACLocalizedStringProtocol
extension ACLocalizedString: ACLocalizedStringProtocol {

    public func toLocalizedString() -> String {
        if self.isLiteral {
            return self.key
        } else {
            let format = ACLocalizedSettings.bundle.localizedString(forKey: self.key, value: nil, table: self.table)
            return String(format: format, locale: Locale.current, arguments: self.args)
        }
    }

    public func toLocalizedAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toLocalizedString(), attributes: nil)
    }

}


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
//
////// MARK: - ACLocalizedString + ExpressibleByStringLiteral
////extension ACLocalizedString: ExpressibleByStringLiteral {
////
////    public typealias StringLiteralType = String
////
////    public init(stringLiteral value: String) {
////        self.init(value, "")
////        self.isLiteral = true
////    }
////}
//
//// MARK: - ACLocalizedStringProtocol
//extension ACLocalizedString: ACLocalizedStringProtocol {
//    
//    public func toLocalizedString() -> String {
//        if self.isLiteral {
//            return self.key
//        } else if var stringInterpolation = self.stringInterpolation {
//            return stringInterpolation.localized()
//        } else {
//            let format = ACLocalizedSettings.bundle.localizedString(forKey: self.key, value: nil, table: self.table)
//            return String(format: format, locale: Locale.current, arguments: self.args)
//        }
//    }
//    
//    public func toLocalizedAttributedString() -> NSAttributedString {
//        NSAttributedString(string: self.toLocalizedString(), attributes: nil)
//    }
//    
//}
 

