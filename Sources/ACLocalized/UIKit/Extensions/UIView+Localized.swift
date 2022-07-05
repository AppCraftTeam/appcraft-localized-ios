//
//  UIView+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 24.06.2022.
//

import Foundation
import UIKit

public extension UIView {

    func viewLocalizeIfNeeded() {
        self.objectLocalizeIfNeeded()
        self.subviews.forEach({ $0.viewLocalizeIfNeeded() })
        self.layer.layerLocalizeIfNeeded()
    }

}
