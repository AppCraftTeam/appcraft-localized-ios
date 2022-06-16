//
//  UIButton+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

extension UIButton: ACLocalizedObjectProtocol {
    
    public var identifer: String {
        self.hash.description
    }
    
    enum LocalizedProperty: ACLocalizedPropertyProtocol {
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
    
    public func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case let .setTitle(state):
            self.setTitle(localized?.toString(), for: state)
        case let .setAttributedTitle(state):
            self.setAttributedTitle(localized?.toAttributedString(), for: state)
        }
    }
    
}

public extension UIButton {
    
    func setTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) {
        self.setLocalized(title, for: LocalizedProperty.setTitle(state: state))
    }
    
    func getTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) -> ACLocalizedString? {
        self.getLocalized(for: LocalizedProperty.setTitle(state: state))
    }
    
}

public extension UIButton {
    
    func setAttributedTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) {
        self.setLocalized(title, for: LocalizedProperty.setAttributedTitle(state: state))
    }
    
    func getAttributedTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) -> ACLocalizedAttributedString? {
        self.getLocalized(for: LocalizedProperty.setAttributedTitle(state: state))
    }
    
}
