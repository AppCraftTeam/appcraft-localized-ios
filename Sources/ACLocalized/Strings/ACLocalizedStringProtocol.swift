//
//  ACLocalizedStringProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

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
