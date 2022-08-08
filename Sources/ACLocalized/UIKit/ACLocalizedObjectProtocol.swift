//
//  ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.07.2022.
//

import Foundation

/**
 Facade for the object of localization
 */
protocol ACLocalizedObjectProtocol: AnyObject {
    
    /**
     The property is needed to store the language used in the last localization of the object.
     For properties to be localized, the current value must be equal to nil or not equal to the value set in `ACLocalizedCore`.
     */
    var localizedLanguage: ACLocalizedLanguage? { get set }
    
    /**
     An array of localized properties that should be localized when changing the language in `ACLocalizedCore`.
     */
    var localizedWrappers: [ACLocalizedPropertyWrapper] { get set }
    
    /**
     Method for getting the localized string for the corresponding property.
     */
    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T?
    
    /**
     Method for setting a localized string to the corresponding property.
     */
    func setLocalizedString(_ string: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol)
}

