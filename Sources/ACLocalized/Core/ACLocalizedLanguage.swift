//
//  ACLocalizedLanguage.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation
#warning("Добавить комментарии")
public struct ACLocalizedLanguage {

    // MARK: - Init
    public init(code: String) {
        self.code = code
    }

    // MARK: - Props
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
public extension ACLocalizedLanguage {
    static let en: ACLocalizedLanguage = "en"
    static let ru: ACLocalizedLanguage = "ru"
}
