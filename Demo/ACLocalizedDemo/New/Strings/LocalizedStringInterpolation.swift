//
//  LocalizedStringInterpolation.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public struct LocalizedStringInterpolation: StringInterpolationProtocol {
    
    // MARK: - Init
    public init(literalCapacity: Int, interpolationCount: Int) {
        self.strings = []
    }
    
    // MARK: - Props
    public private(set) var strings: [LocalizedStringProtocol]

    // MARK: - Methods
    public mutating func appendLiteral(_ literal: StringLiteralType) {
        self.strings += [literal]
    }

    public mutating func appendInterpolation<T: CustomStringConvertible>(_ value: T) {
        switch value {
        case let localizedString as LocalizedStringProtocol:
            self.strings += [localizedString]
        default:
            self.strings += [value.description]
        }
    }
}
