//
//  LocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public protocol LocalizedObjectProtocol: AnyObject {
    var identifer: String { get }

    func localize(_ property: LocalizedPropertyProtocol, localized: LocalizedStringProtocol?)
}

public extension LocalizedObjectProtocol {

    func getLocalized<T: LocalizedStringProtocol>(for property: LocalizedPropertyProtocol) -> T? {
        LocalizedCore.shared.getPicker(object: self, property: property)?.localized as? T
    }

    func setLocalized(_ localized: LocalizedStringProtocol?, for property: LocalizedPropertyProtocol) {
        LocalizedCore.shared.setPicker(object: self, property: property, localized: localized)
        self.localize(property, localized: localized)
    }

}
