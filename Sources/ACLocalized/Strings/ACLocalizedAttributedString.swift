//
//  ACLocalizedAttributedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation
#warning("Добавить комментарии")
public struct ACLocalizedAttributedString {
    
    // MARK: - Init
    public init(string: ACLocalizedStringProtocol, attributes: [NSAttributedString.Key: Any]?) {
        self.string = string
        self.attributes = attributes
    }
    
    // MARK: - Init
    public let string: ACLocalizedStringProtocol
    public let attributes: [NSAttributedString.Key: Any]?
}

// MARK: - LocalizedStringProtocol
extension ACLocalizedAttributedString: ACLocalizedStringProtocol {
    
    public func toString() -> String {
        self.string.toString()
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString(), attributes: self.attributes)
    }
    
}
