//
//  UIBarItem+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 16.06.2022.
//

import Foundation
import UIKit

private extension UIBarItem {
    
    enum LocalizedProperty: ACLocalizedPropertyProtocol {
        case title
        
        var identifer: String {
            switch self {
            case .title:
                return "title"
            }
        }
        
        func localize(object: AnyObject, string: ACLocalizedStringProtocol?) {
            guard let object = object as? UIBarItem else { return }
            
            switch self {
            case .title:
                object.title = string?.toString()
            }
        }
    }
    
}

public extension UIBarItem {
    
    func localizeIfNeeded() {
        ACLocalizeIfNeeded(self)
    }
    
    var titleLocalized: ACLocalizedString? {
        get { self.getLocalizedString(for: LocalizedProperty.title) }
        set { self.setLocalizedString(newValue, for: LocalizedProperty.title) }
    }
    
}
