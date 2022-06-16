//
//  UITextField+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

extension UITextField: ACLocalizedObjectProtocol {
    
    public var identifer: String {
        self.hash.description
    }
    
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

public extension UITextField {
    
    var textLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.text) }
        set { self.setLocalized(newValue, for: LocalizedProperty.text) }
    }
    
}

public extension UITextField {
    
    var attributedTextLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.attributedText) }
        set { self.setLocalized(newValue, for: LocalizedProperty.attributedText) }
    }
    
}

public extension UITextField {
    
    var placeholderLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.placeholder) }
        set { self.setLocalized(newValue, for: LocalizedProperty.placeholder) }
    }
    
}

public extension UITextField {
    
    var attributedPlaceholderLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.attributedPlaceholder) }
        set { self.setLocalized(newValue, for: LocalizedProperty.attributedPlaceholder) }
    }
    
}
