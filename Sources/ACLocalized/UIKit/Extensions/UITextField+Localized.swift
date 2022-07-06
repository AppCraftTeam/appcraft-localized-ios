//
//  UITextField+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

private extension UITextField {
    
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
        
        func localize(object: AnyObject, string: ACLocalizedStringProtocol?) {
            guard let object = object as? UITextField else { return }
            
            switch self {
            case .text:
                object.text = string?.toString()
            case .attributedText:
                object.attributedText = string?.toAttributedString()
            case .placeholder:
                object.placeholder = string?.toString()
            case .attributedPlaceholder:
                object.attributedPlaceholder = string?.toAttributedString()
            }
        }
    }
    
}

public extension UITextField {
    
    var textLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.text) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.text) }
    }
    
    var attributedTextLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.attributedText) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.attributedText) }
    }
    
    var placeholderLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.placeholder) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.placeholder) }
    }
    
    var attributedPlaceholderLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.attributedPlaceholder) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.attributedPlaceholder) }
    }
    
}
