//
//  UIViewController+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 16.06.2022.
//

import Foundation
import UIKit
#warning("Добавить комментарии")
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
    
    func viewControllerLocalizeIfNeeded() {
        self.objectLocalizeIfNeeded()
        self.tabBarController?.tabBar.tabBarLocalizeIfNeeded()
        self.navigationController?.navigationBar.navigationBarLocalizeIfNeeded()
        self.navigationItem.objectLocalizeIfNeeded()
        self.tabBarItem.objectLocalizeIfNeeded()
        self.view.viewLocalizeIfNeeded()
    }
    
    var titleLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.title) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.title) }
    }
    
}
