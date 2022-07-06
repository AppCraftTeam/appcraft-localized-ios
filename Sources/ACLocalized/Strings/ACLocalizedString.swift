//
//  ACLocalizedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 28.04.2022.
//

import Foundation
#warning("Добавить комментарии")
public struct ACLocalizedString {
    
    // MARK: - Init
    public init(strings: [ACLocalizedStringProtocol]) {
        self.strings = strings
    }
    
    public init(key: String, table: String, args: CVarArg...) {
        let string = ACLocalizedKeyString(key: key, table: table, args: args)
        self.init(strings: [ string ])
    }
    
    public init(string: ACLocalizedStringProtocol, attributes: [NSAttributedString.Key: Any]?) {
        let string = ACLocalizedAttributedString(string: string, attributes: attributes)
        self.init(strings: [ string ])
    }
    
    // MARK: - Props
    public var strings: [ACLocalizedStringProtocol]
    
    public static func + (lhs: ACLocalizedString, rhs: ACLocalizedString) -> ACLocalizedString {
        ACLocalizedString(strings: lhs.strings + rhs.strings)
    }
    
    public static func += (lhs: inout ACLocalizedString, rhs: ACLocalizedString) {
        lhs.strings += rhs.strings
    }
}

// MARK: - LocalizedStringProtocol
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

// MARK: - CustomStringConvertible
extension ACLocalizedString: CustomStringConvertible {
    
    public var description: String {
        self.toString()
    }
    
}

// MARK: - ExpressibleByStringLiteral
extension ACLocalizedString: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.strings = [value]
    }
    
}

// MARK: - ExpressibleByStringInterpolation
extension ACLocalizedString: ExpressibleByStringInterpolation {
    
    public typealias StringInterpolation = ACLocalizedStringInterpolation

    public init(stringInterpolation: StringInterpolation) {
       self.strings = stringInterpolation.strings
   }
    
}
