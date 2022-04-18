//
//  UILabel+ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

extension UILabel: ACLocalizedObjectProtocol {
    
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
    
    public func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case .text:
            self.text = localized?.toLocalizedString()
        case .attributedText:
            self.attributedText = localized?.toLocalizedAttributedString()
        }
    }
    
}

// MARK: - TextLocalized
public extension UILabel {
    
    var textLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.text) }
        set { self.setLocalized(newValue, for: LocalizedProperty.text) }
    }
    
}

// MARK: - AttributedTextLocalized
public extension UILabel {
    
    var attributedTextLocalized: ACLocalizedAttributedString? {
        get { self.getLocalized(for: LocalizedProperty.attributedText) }
        set { self.setLocalized(newValue, for: LocalizedProperty.attributedText) }
    }
    
}
