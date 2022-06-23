//
//  ACLocalizedResponderProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 23.06.2022.
//

import Foundation
import UIKit

private var localizedLanguageKey = ""

public protocol ACLocalizedResponderProtocol: AnyObject {
    func localizeIfNeeded()
}

// MARK: - Private
private extension ACLocalizedResponderProtocol {
    
    var localizedLanguage: ACLocalizedLanguage? {
        get { objc_getAssociatedObject(self, &localizedLanguageKey) as? ACLocalizedLanguage }
        set { objc_setAssociatedObject(self, &localizedLanguageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
}

// MARK: - UIView + ACLocalizedResponderProtocol
extension UIView: ACLocalizedResponderProtocol {
    
    public func localizeIfNeeded() {
        let coreLanguage = ACLocalizedCore.shared.language
        
        if self.localizedLanguage == nil {
            self.localizedLanguage = coreLanguage
            
            if let localizedObject = self as? ACLocalizedObjectProtocol {
                localizedObject.applyLocalize()
            }
        } else if self.localizedLanguage != coreLanguage {
            self.localizedLanguage = coreLanguage
            
            if let localizedObject = self as? ACLocalizedObjectProtocol {
                localizedObject.localizeAllProperties()
                localizedObject.applyLocalize()
            }
            
            self.subviews.forEach { $0.localizeIfNeeded() }
        }
    }
    
}

// MARK: - UIViewController + ACLocalizedResponderProtocol
extension UIViewController: ACLocalizedResponderProtocol {
    
    public func localizeIfNeeded() {
        let coreLanguage = ACLocalizedCore.shared.language
        
        if self.localizedLanguage == nil {
            self.localizedLanguage = coreLanguage
            
            self.applyLocalize()
            self.view.localizeIfNeeded()
        } else if self.localizedLanguage != coreLanguage {
            self.localizedLanguage = coreLanguage
            
            self.localizeAllProperties()
            self.applyLocalize()
            self.view.localizeIfNeeded()
        }
        
        self.tabBarController?.tabBar.items?.forEach({
            $0.localizeAllProperties()
            $0.applyLocalize()
        })
        
//        self.navigationController?.navigationBar.items?.forEach({
//            print("!!!", $0)
//            $0.localizeAllProperties()
//            $0.applyLocalize()
//        })
        
        self.navigationItem.localizeAllProperties()
        self.navigationItem.applyLocalize()
        
        self.navigationItem.backBarButtonItem?.localizeAllProperties()
        self.navigationItem.backBarButtonItem?.applyLocalize()
        
        self.navigationController?.navigationBar.items?.forEach({
            $0.localizeAllProperties()
            $0.applyLocalize()
        })
//        
//        print("!!!", self.navigationItem.backButtonTitleLocalized, self.navigationController?.navigationBar.backItem, self.navigationItem.backBarButtonItem)
        
    }
    
}
