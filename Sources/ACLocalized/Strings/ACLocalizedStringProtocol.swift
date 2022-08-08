//
//  ACLocalizedStringProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

/**
 Used to generalize different types of localized strings.
 */
public protocol ACLocalizedStringProtocol: CustomStringConvertible {
    func toString() -> String
    func toAttributedString() -> NSAttributedString
}

// MARK: - CustomStringConvertible
public extension ACLocalizedStringProtocol {
    
    var description: String {
        self.toString()
    }
    
}
