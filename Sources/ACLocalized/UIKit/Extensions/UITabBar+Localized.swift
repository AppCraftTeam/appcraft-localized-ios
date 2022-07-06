//
//  UITabBar+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 04.07.2022.
//

import Foundation
import UIKit
#warning("Добавить комментарии")
public extension UITabBar {
    
    func tabBarLocalizeIfNeeded() {
        self.viewLocalizeIfNeeded()
        self.items?.forEach({ $0.objectLocalizeIfNeeded() })
    }
    
}
