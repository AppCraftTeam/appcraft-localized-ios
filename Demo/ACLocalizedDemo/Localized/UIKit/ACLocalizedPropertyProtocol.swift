//
//  ACLocalizedPropertyProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

protocol ACLocalizedPropertyProtocol {
    var identifer: String { get }
    
    func localize(object: AnyObject, string: ACLocalizedStringProtocol?)
}
