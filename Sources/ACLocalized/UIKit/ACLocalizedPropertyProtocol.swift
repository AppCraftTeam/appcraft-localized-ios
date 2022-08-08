//
//  ACLocalizedPropertyProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

/**
 Protocol for localized object properties. Used to decorate specific types of properties and use them in generic methods for localization.
 */
protocol ACLocalizedPropertyProtocol {
    var identifer: String { get }
    
    func localize(object: AnyObject, string: ACLocalizedStringProtocol?)
}
