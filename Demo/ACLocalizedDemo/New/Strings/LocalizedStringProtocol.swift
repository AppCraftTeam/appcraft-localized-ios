//
//  LocalizedStringProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public protocol LocalizedStringProtocol: CustomStringConvertible {
    func toString() -> String
    func toAttributedString() -> NSAttributedString
}

public extension LocalizedStringProtocol {
    
    var description: String {
        self.toString()
    }
    
}
