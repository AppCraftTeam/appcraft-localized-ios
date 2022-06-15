//
//  UINavigationItem+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

extension UINavigationItem: ACLocalizedObjectProtocol {
    
    public var identifer: String {
        self.hash.description
    }
    
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
    
    public func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case .title:
            self.title = localized?.toString()
        case .backButtonTitle:
            self.backButtonTitle = localized?.toString()
        }
    }
    
}

// MARK: - TitleLocalized
public extension UINavigationItem {
    
    var titleLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.title) }
        set { self.setLocalized(newValue, for: LocalizedProperty.title) }
    }
    
}

// MARK: - BackButtonTitleLocalized
public extension UINavigationItem {
    
    var backButtonTitleLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.backButtonTitle) }
        set { self.setLocalized(newValue, for: LocalizedProperty.backButtonTitle) }
    }
    
}
