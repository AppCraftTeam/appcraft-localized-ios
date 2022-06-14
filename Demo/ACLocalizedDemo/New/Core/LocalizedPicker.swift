//
//  LocalizedPicker.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public struct LocalizedPicker {

    // MARK: - Init
    public init(_ object: LocalizedObjectProtocol, property: LocalizedPropertyProtocol, localized: LocalizedStringProtocol) {
        self.object = object
        self.property = property
        self.localized = localized
    }

    // MARK: - Props
    weak var object: LocalizedObjectProtocol?
    let property: LocalizedPropertyProtocol
    let localized: LocalizedStringProtocol

    // MARK: - Methods
    func localize() {
        self.object?.localize(self.property, localized: self.localized)
    }
}

public extension Array where Element == LocalizedPicker {
    
    mutating func removeAllIfExist(forObject object: LocalizedObjectProtocol, andProperty property: LocalizedPropertyProtocol) {
        self.removeAll { picker in
            picker.object?.identifer == object.identifer && picker.property.identifer == property.identifer
        }
    }
    
}
