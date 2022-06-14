//
//  LocalizedKeyString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public struct LocalizedKeyString {
    
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
extension LocalizedKeyString: LocalizedStringProtocol {
    
    public func toString() -> String {
        let format = LocalizedCore.shared.bundle.localizedString(forKey: self.key, value: nil, table: self.table)
        return String(format: format, locale: Locale.current, arguments: self.args)
    }
    
    public func toAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toString())
    }
    
}