//
//  UILabel+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation
import UIKit

extension UILabel: ACLocalizedObjectProtocol {
    
    public var identifer: String {
        self.hash.description
    }
    
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
            self.text = localized?.toString()
        case .attributedText:
            self.attributedText = localized?.toAttributedString()
        }
    }

}

public extension UILabel {

    var textLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.text) }
        set { self.setLocalized(newValue, for: LocalizedProperty.text) }
    }

}

public extension UILabel {

    var attributedTextLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.attributedText) }
        set { self.setLocalized(newValue, for: LocalizedProperty.attributedText) }
    }

}
