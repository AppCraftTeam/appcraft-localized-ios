//
//  ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation
import UIKit

public protocol ACLocalizedObjectProtocol: AnyObject {
    var identifer: String { get }
    
    func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?)
}

// MARK: - ACLocalizedObjectProtocol + ACLocalizedSettings
public extension ACLocalizedObjectProtocol {
    
    func getLocalized<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T? {
        ACLocalizedSettings.getPicker(object: self, property: property)?.localized as? T
    }
    
    func setLocalized(_ localized: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol) {
        ACLocalizedSettings.setPicker(object: self, property: property, localized: localized)
        self.localize(property, localized: localized)
    }
    
}

// MARK: - NSObject + ACLocalizedObjectProtocol
public extension ACLocalizedObjectProtocol where Self: NSObject {
    
    var identifer: String {
        self.hash.description
    }
    
}
