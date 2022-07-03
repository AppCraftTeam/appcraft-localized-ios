//
//  UIView+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 24.06.2022.
//

import Foundation
import UIKit

public extension UIView {

    func localizeIfNeeded() {
        ACLocalizeIfNeeded(self)
        self.subviews.forEach({ $0.localizeIfNeeded() })
        self.layer.localizeIfNeeded()
    }

}
