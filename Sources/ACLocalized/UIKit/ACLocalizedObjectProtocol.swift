//
//  ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.07.2022.
//

import Foundation
#warning("Добавить комментарии")
protocol ACLocalizedObjectProtocol: AnyObject {
    var localizedLanguage: ACLocalizedLanguage? { get set }
    var localizedWrappers: [ACLocalizedPropertyWrapper] { get set }
    
    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T?
    func setLocalizedString(_ string: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol)
}

