//
//  CALayer+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.07.2022.
//

import Foundation
import UIKit

public extension CALayer {

    func localizeIfNeeded() {
        ACLocalizeIfNeeded(self)
        self.sublayers?.forEach { $0.localizeIfNeeded() }
    }

}
