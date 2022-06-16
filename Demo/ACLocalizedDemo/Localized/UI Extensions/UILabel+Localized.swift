//
//  UILabel+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation
import UIKit

//extension UILabel: ACLocalizedObjectProtocol {
//
//    public var identifer: String {
//        self.hash.description
//    }
//
//    enum LocalizedProperty: ACLocalizedPropertyProtocol {
//        case text
//        case attributedText
//
//        var identifer: String {
//            switch self {
//            case .text:
//                return "text"
//            case .attributedText:
//                return "attributedText"
//            }
//        }
//    }
//
//    public func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?) {
//        guard let property = property as? LocalizedProperty else { return }
//
//        switch property {
//        case .text:
//            self.text = localized?.toString()
//        case .attributedText:
//            self.attributedText = localized?.toAttributedString()
//        }
//    }
//
//}
//
//public extension UILabel {
//
//    var textLocalized: ACLocalizedString? {
//        get { self.getLocalized(for: LocalizedProperty.text) }
//        set { self.setLocalized(newValue, for: LocalizedProperty.text) }
//    }
//
//}
//
//public extension UILabel {
//
//    var attributedTextLocalized: ACLocalizedString? {
//        get { self.getLocalized(for: LocalizedProperty.attributedText) }
//        set { self.setLocalized(newValue, for: LocalizedProperty.attributedText) }
//    }
//
//}

extension UILabel: ACLocalizedWrapperStoreble {
    
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
    
    public func applyLocalize(fromWrapper wrapper: ACLocalizedPropertyWrapper) {
        guard let property = wrapper.property as? LocalizedProperty else { return }
        let string = wrapper.string
        
        switch property {
        case .text:
            self.text = string.toString()
        case .attributedText:
            self.attributedText = string.toAttributedString()
        }
    }

}

public extension UILabel {

    var textLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.text) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.text) }
    }

}

public extension UILabel {

    var attributedTextLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.attributedText) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.attributedText) }
    }

}
