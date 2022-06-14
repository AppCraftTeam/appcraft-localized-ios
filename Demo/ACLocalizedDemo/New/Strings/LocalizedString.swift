//
//  LocalizedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 28.04.2022.
//

import Foundation

public struct LocalizedString {
    
    // MARK: - Init
    public init(strings: [LocalizedStringProtocol]) {
        self.strings = strings
    }
    
    public init(key: String, table: String, args: CVarArg...) {
        let string = LocalizedKeyString(key: key, table: table, args: args)
        self.init(strings: [ string ])
    }
    
    public init(string: LocalizedStringProtocol, attributes: [NSAttributedString.Key: Any]?) {
        let string = LocalizedAttributedString(string: string, attributes: attributes)
        self.init(strings: [ string ])
    }
    
    // MARK: - Props
    public var strings: [LocalizedStringProtocol]
    
    public static func + (lhs: LocalizedString, rhs: LocalizedString) -> LocalizedString {
        LocalizedString(strings: lhs.strings + rhs.strings)
    }
    
    public static func += (lhs: inout LocalizedString, rhs: LocalizedString) {
        lhs.strings += rhs.strings
    }
}

// MARK: - LocalizedStringProtocol
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

// MARK: - CustomStringConvertible
extension LocalizedString: CustomStringConvertible {
    
    public var description: String {
        self.toString()
    }
    
}

// MARK: - ExpressibleByStringLiteral
extension LocalizedString: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.strings = [value]
    }
    
}

// MARK: - ExpressibleByStringInterpolation
extension LocalizedString: ExpressibleByStringInterpolation {
    
    public typealias StringInterpolation = LocalizedStringInterpolation

    public init(stringInterpolation: StringInterpolation) {
       self.strings = stringInterpolation.strings
   }
    
}
