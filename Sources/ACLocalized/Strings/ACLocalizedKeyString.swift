//
//  ACLocalizedKeyString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation
#warning("Добавить комментарии")
public struct ACLocalizedKeyString {
    
    // MARK: - Init
    public init(key: String, table: String, args: CVarArg...) {
        self.key = key
        self.table = table
        self.args = args
    }
    
    // MARK: - Props
    public let key: String
    public let table: String
    public let args: [CVarArg]
}

// MARK: - LocalizedStringProtocol
extension ACLocalizedKeyString: ACLocalizedStringProtocol {
    
    public func toString() -> String {
        ACLocalizedCore.shared.localizedString(key: self.key, table: self.table, args: self.args)
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString())
    }
    
}
