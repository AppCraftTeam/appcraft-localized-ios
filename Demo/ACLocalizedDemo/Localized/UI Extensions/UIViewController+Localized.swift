//
//  UIViewController+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 16.06.2022.
//

import Foundation
import UIKit

// MARK: - LocalizedProperty
private extension UIViewController {
    
    enum LocalizedProperty: ACLocalizedPropertyProtocol {
        case title
        
        var identifer: String {
            switch self {
            case .title:
                return "title"
            }
        }
    }
    
}

// MARK: - ACLocalizedObjectProtocol
extension UIViewController: ACLocalizedObjectProtocol {
    
    public func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?, completion: (() -> Void)?) {
        guard let property = property as? LocalizedProperty else {
            completion?()
            return
        }
        
        switch property {
        case .title:
            self.title = string?.toString()
            completion?()
        }
    }
    
}

// MARK: - Props
public extension UIViewController {
    
    var titleLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.title) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.title) }
    }
    
}
