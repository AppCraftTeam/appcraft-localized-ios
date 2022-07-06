//
//  UIBarButtonItem+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 18.04.2022.
//

import Foundation
import UIKit
#warning("Добавить комментарии")
public extension UIBarButtonItem {
    
    convenience init(titleLocalized: ACLocalizedString?, style: UIBarButtonItem.Style, target: Any?, action: Selector?) {
        self.init(title: titleLocalized?.toString(), style: style, target: target, action: action)
        self.titleLocalized = titleLocalized
    }
    
    @available(iOS 14.0, *)
    convenience init(titleLocalized: ACLocalizedString? = nil, image: UIImage? = nil, primaryAction: UIAction? = nil, menu: UIMenu? = nil) {
        self.init(title: titleLocalized?.toString(), image: image, primaryAction: primaryAction, menu: menu)
        self.titleLocalized = titleLocalized
    }
    
}

