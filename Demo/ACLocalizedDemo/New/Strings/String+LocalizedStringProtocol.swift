//
//  String+LocalizedStringProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

extension String: LocalizedStringProtocol {
    
    public func toString() -> String {
        self
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString())
    }
    
}