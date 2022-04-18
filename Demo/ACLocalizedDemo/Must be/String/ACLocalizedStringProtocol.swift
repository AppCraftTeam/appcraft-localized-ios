//
//  ACLocalizedStringProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation

public protocol ACLocalizedStringProtocol {
    func toLocalizedString() -> String
    func toLocalizedAttributedString() -> NSAttributedString
}

// MARK: - String + ACLocalizedStringProtocol
extension String: ACLocalizedStringProtocol {
    
    public func toLocalizedString() -> String {
        self
    }
    
    public func toLocalizedAttributedString() -> NSAttributedString {
        NSAttributedString(string: self, attributes: nil)
    }
}

// MARK: - NSAttributedString + ACLocalizedStringProtocol
extension NSAttributedString: ACLocalizedStringProtocol {
    
    public func toLocalizedString() -> String {
        self.string
    }
    
    public func toLocalizedAttributedString() -> NSAttributedString {
        self
    }
    
}
