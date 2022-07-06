//
//  UILabel+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation
import UIKit
#warning("Добавить комментарии")
private extension UILabel {
    
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
            guard let object = object as? UILabel else { return }
            
            switch self {
            case .text:
                object.text = string?.toString()
            case .attributedText:
                object.attributedText = string?.toAttributedString()
            }
        }
    }
    
}

public extension UILabel {
    
    var textLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.text) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.text) }
    }

    var attributedTextLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: UILabel.LocalizedProperty.attributedText) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.attributedText) }
    }
    
}
