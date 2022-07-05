//
//  UINavigationItem+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

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
        
        func localize(object: AnyObject, string: ACLocalizedStringProtocol?) {
            guard let object = object as? UINavigationItem else { return }
            
            switch self {
            case .title:
                object.title = string?.toString()
            case .backButtonTitle:
                object.backButtonTitle = string?.toString()
            case .prompt:
                object.prompt = string?.toString()
            }
        }
    }
    
}

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
