//
//  LocalizedAttributedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public struct LocalizedAttributedString {
    
    // MARK: - Init
    public init(string: LocalizedStringProtocol, attributes: [NSAttributedString.Key: Any]?) {
        self.string = string
        self.attributes = attributes
    }
    
    // MARK: - Init
    public let string: LocalizedStringProtocol
    public let attributes: [NSAttributedString.Key: Any]?
}

// MARK: - LocalizedStringProtocol
extension LocalizedAttributedString: LocalizedStringProtocol {
    
    public func toString() -> String {
        self.string.toString()
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString(), attributes: self.attributes)
    }
    
}
