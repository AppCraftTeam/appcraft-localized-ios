//
//  UItextView+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit
#warning("Добавить комментарии")
private extension UITextView {
    
    enum LocalizedProperty: ACLocalizedPropertyProtocol {
        case text
        case attributedText
        
        var identifer: String {
            switch self {
            case .text:
                return "text"
            case .attributedText:
                return "attributedText"
            }
        }
        
        func localize(object: AnyObject, string: ACLocalizedStringProtocol?) {
            guard let object = object as? UITextView else { return }
            
            switch self {
            case .text:
                object.text = string?.toString()
            case .attributedText:
                object.attributedText = string?.toAttributedString()
            }
        }
    }
    
}

public extension UITextView {
    
    var textLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.text) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.text) }
    }
    
    var attributedTextLocalized: ACLocalizedAttributedString? {
        get { self.getLocalizedString(for: LocalizedProperty.attributedText) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.attributedText) }
    }
    
}


