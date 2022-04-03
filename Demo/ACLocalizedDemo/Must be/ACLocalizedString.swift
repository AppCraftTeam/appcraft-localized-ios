//
//  ACLocalizedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation

public struct ACLocalizedString {

    // MARK: - Init
    init(_ key: String, _ table: String, _ args: CVarArg...) {
        self.key = key
        self.table = table
        self.args = args
    }

    // MARK: - Props
    let key: String
    let table: String
    let args: [CVarArg]
}

// MARK: - ACLocalizedStringProtocol
extension ACLocalizedString: ACLocalizedStringProtocol {
    
    public func toLocalizedString() -> String {
        let format = ACLocalizedSettings.bundle.localizedString(forKey: self.key, value: nil, table: self.table)
        return String(format: format, locale: Locale.current, arguments: self.args)
    }
    
    public func toLocalizedAttributedString() -> NSAttributedString {
        NSAttributedString(string: self.toLocalizedString(), attributes: nil)
    }
    
}
