//
//  ACLocalizedPropertyWrapper.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 21.06.2022.
//

import Foundation
#warning("Добавить комментарии")
struct ACLocalizedPropertyWrapper {
    
    // MARK: - Init
    init?(property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?) {
        guard let string = string else {
            return nil
        }

        self.property = property
        self.string = string
    }
    
    // MARK: - Props
    let property: ACLocalizedPropertyProtocol
    let string: ACLocalizedStringProtocol
}
