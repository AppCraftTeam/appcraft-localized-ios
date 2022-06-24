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
        
        if self.localizedLanguage != coreLanguage {
            self.localizedLanguage = coreLanguage

            if let localizedObject = self as? ACLocalizedObjectProtocol {
                localizedObject.localize()
            }

            self.subviews.forEach { $0.localizeIfNeeded() }
        }
    }
    
}

// MARK: - UIViewController + ACLocalizedResponderProtocol
extension UIViewController: ACLocalizedResponderProtocol {
    
    public func localizeIfNeeded() {
        let coreLanguage = ACLocalizedCore.shared.language
        
        if self.localizedLanguage != coreLanguage {
            self.localizedLanguage = coreLanguage

            self.localize()
            self.view.localizeIfNeeded()
            
            self.navigationController?.navigationBar.items?.forEach({
                $0.localize()
            })
            
            self.tabBarController?.tabBar.items?.forEach({
                $0.localize()
            })
        }
    }
    
}
