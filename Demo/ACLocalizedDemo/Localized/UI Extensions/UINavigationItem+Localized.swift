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
        
        var identifer: String {
            switch self {
            case .title:
                return "title"
            case .backButtonTitle:
                return "backButtonTitle"
            }
        }
    }
    
}

// MARK: - ACLocalizedObjectProtocol
extension UINavigationItem: ACLocalizedObjectProtocol {
    
    public func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?, completion: (() -> Void)?) {
        guard let property = property as? LocalizedProperty else {
            completion?()
            return
        }
        
        switch property {
        case .title:
            self.title = string?.toString()
            completion?()
        case .backButtonTitle:
            self.backButtonTitle = string?.toString()
            completion?()
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
    
}
