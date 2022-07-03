//
//  UIViewController+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 16.06.2022.
//

import Foundation
import UIKit

private extension UIViewController {
    
    enum LocalizedProperty: ACLocalizedPropertyProtocol {
        case title

        var identifer: String {
            switch self {
            case .title:
                return "title"
            }
        }
        
        func localize(object: AnyObject, string: ACLocalizedStringProtocol?) {
            guard let object = object as? UIViewController else { return }
            
            switch self {
            case .title:
                object.title = string?.toString()
            }
        }
    }
    
}

public extension UIViewController {
    
    func localizeIfNeeded() {
        ACLocalizeIfNeeded(self)
        self.navigationController?.navigationBar.items?.forEach({ $0.localizeIfNeeded() })
        self.navigationItem.localizeIfNeeded()
        self.tabBarController?.tabBar.items?.forEach({ $0.localizeIfNeeded() })
        self.tabBarItem.localizeIfNeeded()
        self.view.localizeIfNeeded()
    }
    
    var titleLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.title) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.title) }
    }
    
}
