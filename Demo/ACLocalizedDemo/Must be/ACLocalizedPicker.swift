//
//  ACLocalizedPicker.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation

public struct ACLocalizedPicker {
    
    // MARK: - Init
    public init(_ object: ACLocalizedObjectProtocol, property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol) {
        self.object = object
        self.property = property
        self.localized = localized
    }
    
    // MARK: - Props
    weak var object: ACLocalizedObjectProtocol?
    let property: ACLocalizedPropertyProtocol
    let localized: ACLocalizedStringProtocol
    
    // MARK: - Methods
    func localize() {
        self.object?.localize(self.property, localized: self.localized)
    }
}
