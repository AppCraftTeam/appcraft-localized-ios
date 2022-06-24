//
//  UINavigationItem+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

// MARK: - LocalizedProperty
private extension UINavigationItem {
    
    enum LocalizedProperty: ACLocalizedPropertyProtocol {
        case title
        case backButtonTitle
        case prompt
        
        var identifer: String {
            switch self {
            case .title:
                return "title"
            case .backButtonTitle:
                return "backButtonTitle"
            case .prompt:
                return "prompt"
            }
        }
    }
    
}

// MARK: - ACLocalizedObjectProtocol
extension UINavigationItem: ACLocalizedObjectProtocol {
    
    public func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case .title:
            self.title = string?.toString()
        case .backButtonTitle:
            self.backButtonTitle = string?.toString()
        case .prompt:
            self.prompt = string?.toString()
        }
    }
    
}

// MARK: - Props
public extension UINavigationItem {
    
    var titleLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.title) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.title) }
    }
    
    var backButtonTitleLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.backButtonTitle) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.backButtonTitle) }
    }
    
    var promptLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.prompt) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.prompt) }
    }
    
}
