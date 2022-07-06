//
//  ACLocalizedLanguage.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation

/**
 Structure for localization language
 */
public struct ACLocalizedLanguage {

    // MARK: - Init
    public init(code: String) {
        self.code = code
    }

    // MARK: - Props
    
    /**
     Property for the localization language code. For example, for English - `en`, for Russian - `ru`.
     */
    public let code: String
}

// MARK: - Equatable
extension ACLocalizedLanguage: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.code == rhs.code
    }
    
}

// MARK: - CustomStringConvertible
extension ACLocalizedLanguage: CustomStringConvertible {
    
    public var description: String {
        self.code
    }
    
}

// MARK: - ExpressibleByStringLiteral
extension ACLocalizedLanguage: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(code: value)
    }
    
}

// MARK: - Store

/**
 Basic constants. If other languages are supported in the application, they can be added by analogy with the static properties.
 */
public extension ACLocalizedLanguage {
    static let en: ACLocalizedLanguage = "en"
    static let ru: ACLocalizedLanguage = "ru"
}
