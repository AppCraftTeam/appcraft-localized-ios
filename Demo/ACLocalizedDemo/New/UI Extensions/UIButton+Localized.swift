//
//  UIButton+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

extension UIButton: LocalizedObjectProtocol {
    
    public var identifer: String {
        self.hash.description
    }
    
    enum LocalizedProperty: LocalizedPropertyProtocol {
        case setTitle(state: UIControl.State)
        case setAttributedTitle(state: UIControl.State)
        
        var identifer: String {
            switch self {
            case let .setTitle(state):
                return "setTitle_\(state.rawValue)"
            case let .setAttributedTitle(state):
                return "setAttributedTitle_\(state.rawValue)"
            }
        }
    }
    
    public func localize(_ property: LocalizedPropertyProtocol, localized: LocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case let .setTitle(state):
            self.setTitle(localized?.toString(), for: state)
        case let .setAttributedTitle(state):
            self.setAttributedTitle(localized?.toAttributedString(), for: state)
        }
    }
    
}

// MARK: - TitleLocalized
public extension UIButton {
    
    func setTitleLocalized(_ title: LocalizedString?, for state: UIControl.State) {
        self.setLocalized(title, for: LocalizedProperty.setTitle(state: state))
    }
    
    func getTitleLocalized(_ title: LocalizedString?, for state: UIControl.State) -> LocalizedString? {
        self.getLocalized(for: LocalizedProperty.setTitle(state: state))
    }
    
}

// MARK: - AttributedTitleLocalized
public extension UIButton {
    
    func setAttributedTitleLocalized(_ title: LocalizedAttributedString?, for state: UIControl.State) {
        self.setLocalized(title, for: LocalizedProperty.setAttributedTitle(state: state))
    }
    
    func getAttributedTitleLocalized(_ title: LocalizedAttributedString?, for state: UIControl.State) -> LocalizedAttributedString? {
        self.getLocalized(for: LocalizedProperty.setAttributedTitle(state: state))
    }
    
}
