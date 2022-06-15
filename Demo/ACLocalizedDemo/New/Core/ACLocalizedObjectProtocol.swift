//
//  ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public protocol ACLocalizedObjectProtocol: AnyObject {
    var identifer: String { get }

    func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?)
}

public extension ACLocalizedObjectProtocol {

    func getLocalized<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T? {
        ACLocalizedCore.shared.getPicker(object: self, property: property)?.localized as? T
    }

    func setLocalized(_ localized: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol) {
        ACLocalizedCore.shared.setPicker(object: self, property: property, localized: localized)
        self.localize(property, localized: localized)
    }

}
