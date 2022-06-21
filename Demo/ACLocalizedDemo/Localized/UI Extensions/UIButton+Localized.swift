//
//  UIButton+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

// MARK: - LocalizedProperty
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
    }
    
}

// MARK: - ACLocalizedObjectProtocol
extension UIButton: ACLocalizedObjectProtocol {
    
    public func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?, completion: (() -> Void)?) {
        guard let property = property as? LocalizedProperty else {
            completion?()
            return
        }
        
        switch property {
        case let .setTitle(state):
            self.setTitle(string?.toString(), for: state)
            completion?()
        case let .setAttributedTitle(state):
            self.setAttributedTitle(string?.toAttributedString(), for: state)
            completion?()
        }
    }
    
}

// MARK: - Methods
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
