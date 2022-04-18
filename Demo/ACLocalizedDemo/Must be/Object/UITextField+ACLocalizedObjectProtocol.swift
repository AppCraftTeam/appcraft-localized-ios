//
//  UITextField+ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

extension UITextField: ACLocalizedObjectProtocol {
    
    enum LocalizedProperty: ACLocalizedPropertyProtocol {
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
    
    public func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case .text:
            self.text = localized?.toLocalizedString()
        case .attributedText:
            self.attributedText = localized?.toLocalizedAttributedString()
        case .placeholder:
            self.placeholder = localized?.toLocalizedString()
        case .attributedPlaceholder:
            self.attributedPlaceholder = localized?.toLocalizedAttributedString()
        }
    }
    
}

// MARK: - TextLocalized
public extension UITextField {
    
    var textLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.text) }
        set { self.setLocalized(newValue, for: LocalizedProperty.text) }
    }
    
}

// MARK: - AttributedTextLocalized
public extension UITextField {
    
    var attributedTextLocalized: ACLocalizedAttributedString? {
        get { self.getLocalized(for: LocalizedProperty.attributedText) }
        set { self.setLocalized(newValue, for: LocalizedProperty.attributedText) }
    }
    
}

// MARK: - PlaceholderLocalized
public extension UITextField {
    
    var placeholderLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.placeholder) }
        set { self.setLocalized(newValue, for: LocalizedProperty.placeholder) }
    }
    
}

// MARK: - AttributedPlaceholderLocalized
public extension UITextField {
    
    var attributedPlaceholderLocalized: ACLocalizedAttributedString? {
        get { self.getLocalized(for: LocalizedProperty.attributedPlaceholder) }
        set { self.setLocalized(newValue, for: LocalizedProperty.attributedPlaceholder) }
    }
    
}
