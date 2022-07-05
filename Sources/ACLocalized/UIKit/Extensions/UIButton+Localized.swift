//
//  UIButton+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

private extension UIButton {
    
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
        
        func localize(object: AnyObject, string: ACLocalizedStringProtocol?) {
            guard let object = object as? UIButton else { return }

            switch self {
            case let .setTitle(state):
                object.setTitle(string?.toString(), for: state)
            case let .setAttributedTitle(state):
                object.setAttributedTitle(string?.toAttributedString(), for: state)
            }
        }
    }
    
}

public extension UIButton {
    
    func setTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) {
        self.setLocalizedString(title, for: LocalizedProperty.setTitle(state: state))
    }
    
    func getTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) -> ACLocalizedString? {
        self.getLocalizedString(for: LocalizedProperty.setTitle(state: state))
    }
    
    func setAttributedTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) {
        self.setLocalizedString(title, for: LocalizedProperty.setAttributedTitle(state: state))
    }
    
    func getAttributedTitleLocalized(_ title: ACLocalizedString?, for state: UIControl.State) -> ACLocalizedAttributedString? {
        self.getLocalizedString(for: LocalizedProperty.setAttributedTitle(state: state))
    }
    
}
