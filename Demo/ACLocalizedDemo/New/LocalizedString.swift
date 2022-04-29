//
//  LocalizedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 28.04.2022.
//

import Foundation

public protocol LocalizedStringProtocol {
    func toString() -> String
    func toAttributedString() -> NSAttributedString
}

public struct LocalizedString {
    
    public enum StringType {
        case simple
        case literal
        case composition
    }
    
    // MARK: - Ini
    init(key: String, table: String, args: CVarArg...) {
        self.type = .simple
        self.key = key
        self.table = table
        self.args = args
        self.string = nil
        self.strings = nil
        self.attributes = nil
    }
    
    init(string: String, attributes: [NSAttributedString.Key: Any]?) {
        self.type = .literal
        self.key = nil
        self.table = nil
        self.args = nil
        self.string = string
        self.strings = nil
        self.attributes = attributes
    }
    
    init(strings: [LocalizedStringProtocol]) {
        self.type = .composition
        self.key = nil
        self.table = nil
        self.args = nil
        self.string = nil
        self.strings = strings
        self.attributes = nil
    }
    
    // MARK: - Props
    public let type: StringType
    public let key: String?
    public let table: String?
    public let args: [CVarArg]?
    public let string: String?
    public let strings: [LocalizedStringProtocol]?
    public let attributes: [NSAttributedString.Key: Any]?
}

// MARK: - LocalizedStringProtocol
extension LocalizedString: LocalizedStringProtocol {
    
    public func toString() -> String {
        switch self.type {
        case .simple:
            guard let key = self.key, let table = self.table, let args = self.args else { return "" }
            let format = ACLocalizedSettings.bundle.localizedString(forKey: key, value: nil, table: table)
            return String(format: format, locale: Locale.current, arguments: args)
        case .literal:
            return self.string ?? ""
        case .composition:
            return (self.strings ?? []).map({ $0.toString() }).joined()
        }
    }
    
    public func toAttributedString() -> NSAttributedString {
        switch self.type {
        case .simple,
            .literal:
            return NSAttributedString(string: self.toString(), attributes: self.attributes)
        case .composition:
            let result = NSMutableAttributedString()
            
            (self.strings ?? []).forEach { string in
                result.append(string.toAttributedString())
            }
            
            return result
        }
    }
    
}
