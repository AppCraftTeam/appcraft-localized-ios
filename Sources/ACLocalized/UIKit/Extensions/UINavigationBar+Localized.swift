//
//  UINavigationBar+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 04.07.2022.
//

import Foundation
import UIKit

public extension UINavigationBar {
    
    func navigationBarLocalizeIfNeeded() {
        self.viewLocalizeIfNeeded()
        self.items?.forEach({ $0.objectLocalizeIfNeeded() })
    }
    
}
