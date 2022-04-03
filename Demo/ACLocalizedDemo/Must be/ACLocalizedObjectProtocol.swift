//
//  ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation
import UIKit

public protocol ACLocalizedObjectProtocol: AnyObject {
    var identifer: String { get }
    
    func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?)
}

extension ACLocalizedObjectProtocol {
    
    func getLocalized(for property: ACLocalizedPropertyProtocol) -> ACLocalizedStringProtocol? {
        ACLocalizedSettings.getPicker(object: self, property: property)?.localized
    }
    
    func setLocalized(_ localized: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol) {
        ACLocalizedSettings.setPicker(object: self, property: property, localized: localized)
        self.localize(property, localized: localized)
    }
    
}

// MARK: - NSObject + ACLocalizedObjectProtocol
public extension ACLocalizedObjectProtocol where Self: NSObject {
    
    var identifer: String {
        self.hash.description
    }
    
}

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
        print("!!! UILabel localize", property, localized)
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case .text:
            self.text = localized?.toLocalizedString()
        case .attributedText:
            self.attributedText = localized?.toLocalizedAttributedString()
        }
    }
    
    public var textLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.text) as? ACLocalizedString }
        set { self.setLocalized(newValue, for: LocalizedProperty.text) }
    }
    
    public var attributedTextLocalized: ACLocalizedAttributedString? {
        get { self.getLocalized(for: LocalizedProperty.attributedText) as? ACLocalizedAttributedString }
        set { self.setLocalized(newValue, for: LocalizedProperty.attributedText) }
    }
    
}

extension UIButton: ACLocalizedObjectProtocol {
    
    enum LocalizedProperty: ACLocalizedPropertyProtocol {
        case setTitle(state: UIControl.State)
        
        var identifer: String {
            switch self {
            case let .setTitle(state):
                return "setTitle\(state.rawValue)"
            }
        }
    }
    
    public func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?) {
        print("!!! UIButton localize", property, localized)
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case let .setTitle(state):
            self.setTitle(localized?.toLocalizedString(), for: state)
        }
    }
    
    public func setTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) {
        self.setLocalized(title, for: LocalizedProperty.setTitle(state: state))
    }
    
    public func getTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) -> ACLocalizedString? {
        self.getLocalized(for: LocalizedProperty.setTitle(state: state)) as? ACLocalizedString
    }
    
}
