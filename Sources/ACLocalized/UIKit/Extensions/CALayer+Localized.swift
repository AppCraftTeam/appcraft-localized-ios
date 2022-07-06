//
//  CALayer+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.07.2022.
//

import Foundation
import UIKit
#warning("Добавить комментарии")
public extension CALayer {

    func layerLocalizeIfNeeded() {
        self.objectLocalizeIfNeeded()
        self.sublayers?.forEach { $0.layerLocalizeIfNeeded() }
    }

}
