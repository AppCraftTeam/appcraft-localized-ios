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
extension UIViewController: ACLocalizedResponderProtocol {
    
    public func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?) {
        guard let property = property as? LocalizedProperty else { return }
        
        switch property {
        case .title:
            self.title = string?.toString()
        }
    }
    
    public func localizeIfNeeded() {
        let coreLanguage = ACLocalizedCore.shared.language

        if self.localizedLanguage != coreLanguage {
            self.localizedLanguage = coreLanguage

            self.localize()
            self.applyLocalize()
            self.didLocalized()
//            self.view.localizeIfNeeded()

//            self.navigationController?.navigationBar.items?.forEach({
//                $0.localizeIfNeeded()
//            })
//
//            self.tabBarController?.tabBar.items?.forEach({
//                $0.localizeIfNeeded()
//            })
        }
    }
    
    public func applyLocalize() {}
    
    public func didLocalized() {}
    
}

// MARK: - Props
public extension UIViewController {
    
    var titleLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.title) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.title) }
    }
    
}
