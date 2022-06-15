//
//  UIBarButtonItem+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit

extension UIBarButtonItem: ACLocalizedObjectProtocol {
    
    public var identifer: String {
        self.hash.description
    }
    
    enum LocalizedProperty: ACLocalizedPropertyProtocol {
        case title
        
        var identifer: String {
            switch self {
            case .title:
                return "title"
            }
        }
    }
    
    public func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case .title:
            self.title = localized?.toString()
        }
    }
    
}

// MARK: - TextLocalized
public extension UIBarButtonItem {
    
    // MARK: - Init
    convenience init(titleLocalized: ACLocalizedString?, style: UIBarButtonItem.Style, target: Any?, action: Selector?) {
        self.init(title: titleLocalized?.toString(), style: style, target: target, action: action)
        self.titleLocalized = titleLocalized
    }
    
    @available(iOS 14.0, *)
    convenience init(titleLocalized: ACLocalizedString? = nil, image: UIImage? = nil, primaryAction: UIAction? = nil, menu: UIMenu? = nil) {
        self.init(title: titleLocalized?.toString(), image: image, primaryAction: primaryAction, menu: menu)
        self.titleLocalized = titleLocalized
    }
    
    // MARK: - Props
    var titleLocalized: ACLocalizedString? {
        get { self.getLocalized(for: LocalizedProperty.title) }
        set { self.setLocalized(newValue, for: LocalizedProperty.title) }
    }
    
}

