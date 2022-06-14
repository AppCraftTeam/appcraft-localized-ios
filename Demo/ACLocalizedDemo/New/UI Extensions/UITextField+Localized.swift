//
//  UITextField+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

extension UITextField: LocalizedObjectProtocol {
    
    public var identifer: String {
        self.hash.description
    }
    
    enum LocalizedProperty: LocalizedPropertyProtocol {
        case text
        case attributedText
        case placeholder
        case attributedPlaceholder
        
        var identifer: String {
            switch self {
            case .text:
                return "text"
            case .attributedText:
                return "attributedText"
            case .placeholder:
                return "placeholder"
            case .attributedPlaceholder:
                return "attributedPlaceholder"
            }
        }
    }
    
    public func localize(_ property: LocalizedPropertyProtocol, localized: LocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case .text:
            self.text = localized?.toString()
        case .attributedText:
            self.attributedText = localized?.toAttributedString()
        case .placeholder:
            self.placeholder = localized?.toString()
        case .attributedPlaceholder:
            self.attributedPlaceholder = localized?.toAttributedString()
        }
    }
    
}

// MARK: - TextLocalized
public extension UITextField {
    
    var textLocalized: LocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.text) }
        set { self.setLocalized(newValue, for: LocalizedProperty.text) }
    }
    
}

// MARK: - AttributedTextLocalized
public extension UITextField {
    
    var attributedTextLocalized: LocalizedAttributedString? {
        get { self.getLocalized(for: LocalizedProperty.attributedText) }
        set { self.setLocalized(newValue, for: LocalizedProperty.attributedText) }
    }
    
}

// MARK: - PlaceholderLocalized
public extension UITextField {
    
    var placeholderLocalized: LocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.placeholder) }
        set { self.setLocalized(newValue, for: LocalizedProperty.placeholder) }
    }
    
}

// MARK: - AttributedPlaceholderLocalized
public extension UITextField {
    
    var attributedPlaceholderLocalized: LocalizedAttributedString? {
        get { self.getLocalized(for: LocalizedProperty.attributedPlaceholder) }
        set { self.setLocalized(newValue, for: LocalizedProperty.attributedPlaceholder) }
    }
    
}
