//
//  UILabel+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation
import UIKit

// MARK: - LocalizedProperty
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
    }
    
}

// MARK: - ACLocalizedObjectProtocol
extension UILabel: ACLocalizedObjectProtocol {
    
    public func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case .text:
            self.text = string?.toString()
        case .attributedText:
            self.attributedText = string?.toAttributedString()
        }
    }

}

// MARK: - Props
public extension UILabel {

    var textLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.text) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.text) }
    }
    
    var attributedTextLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.attributedText) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.attributedText) }
    }

}
