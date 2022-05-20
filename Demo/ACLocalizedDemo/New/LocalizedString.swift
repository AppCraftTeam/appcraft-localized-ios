//
//  LocalizedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 28.04.2022.
//

import Foundation

public protocol StringLocalizable {
    func toString() -> String
    func toAttributedString() -> NSAttributedString
}

public struct StringLocalized {
    
    // MARK: - Init
    init(
        type: StringType,
        key: String?,
        table: String?,
        args: [CVarArg]?,
        stringLiteral: String?,
        stringLocalized: StringLocalizable?,
        stringsLocalized: [StringLocalizable]?,
        attributes: [NSAttributedString.Key: Any]?
    ) {
        self.type = type
        self.key = key
        self.table = table
        self.args = args
        self.stringLiteral = stringLiteral
        self.stringLocalized = stringLocalized
        self.stringsLocalized = stringsLocalized
        self.attributes = attributes
    }
    
    init(key: String, table: String, args: CVarArg...) {
        self.init(
            type: .localized,
            key: key,
            table: table,
            args: args,
            stringLiteral: nil,
            stringLocalized: nil,
            stringsLocalized: nil,
            attributes: nil
        )
    }
    
    init(stringLocalized: StringLocalizable, attributes: [NSAttributedString.Key: Any]?) {
        self.init(
            type: .single,
            key: nil,
            table: nil,
            args: nil,
            stringLiteral: nil,
            stringLocalized: stringLocalized,
            stringsLocalized: nil,
            attributes: attributes
        )
    }
    
    init(stringsLocalized: [StringLocalizable]) {
        self.init(
            type: .composition,
            key: nil,
            table: nil,
            args: nil,
            stringLiteral: nil,
            stringLocalized: nil,
            stringsLocalized: stringsLocalized,
            attributes: nil
        )
    }
    
    // MARK: - Props
    public let type: StringType
    public let key: String?
    public let table: String?
    public let args: [CVarArg]?
    public let stringLiteral: String?
    public let stringLocalized: StringLocalizable?
    public let stringsLocalized: [StringLocalizable]?
    public let attributes: [NSAttributedString.Key: Any]?
}

// MARK: - StringType
public extension StringLocalized {
    
    enum StringType {
        case localized
        case literal
        case single
        case composition
    }
    
}

// MARK: - LocalizedStringProtocol
extension StringLocalized: StringLocalizable {
    
    public func toString() -> String {
        switch self.type {
        case .localized:
            guard let key = self.key, let table = self.table, let args = self.args else { return "" }
            let format = ACLocalizedSettings.bundle.localizedString(forKey: key, value: nil, table: table)
            return String(format: format, locale: Locale.current, arguments: args)
        case .literal:
            return self.stringLiteral ?? ""
        case .single:
            return self.stringLocalized?.toString() ?? ""
        case .composition:
            return (self.stringsLocalized ?? []).reduce("", { $0 + $1.toString() })
        }
    }
    
    public func toAttributedString() -> NSAttributedString {
//        switch self.type {
//        case .simple,
//            .literal:
//            return NSAttributedString(string: self.toString(), attributes: self.attributes)
//        case .composition:
//            let result = NSMutableAttributedString()
//
//            (self.strings ?? []).forEach { string in
//                result.append(string.toAttributedString())
//            }
//
//            return result
//        }
        .init(string: "")
    }
    
}


//public struct LocalizedString {
//    
//    // MARK: - Init
//    public init(key: String, table: String, args: [CVarArg]) {
//        self.key = key
//        self.table = table
//        self.args = args
//    }
//    
//    // MARK: - Props
//    public let key: String
//    public let table: String
//    public let args: [CVarArg]
//}
//
//// MARK: - StringLocalizable
//extension LocalizedString: StringLocalizable {
//    
//    public func toString() -> String {
//        let format = ACLocalizedSettings.bundle.localizedString(forKey: self.key, value: nil, table: self.table)
//        return String(format: format, locale: Locale.current, arguments: self.args)
//    }
//    
//    public func toAttributedString() -> NSAttributedString {
//        NSAttributedString(string: self.toString())
//    }
//    
//}

//public struct LocalizedAttributedString {
//    
//    // MARK: - Init
//    public init(localizedString: LocalizedString, attributes: [NSAttributedString.Key: Any]?) {
//        self.localizedString = localizedString
//        self.attributes = attributes
//    }
//    
//    // MARK: - Props
//    public let localizedString: LocalizedString
//    public let attributes: [NSAttributedString.Key: Any]?
//}
//
//// MARK: - StringLocalizable
//extension LocalizedAttributedString: StringLocalizable {
//    
//    public func toString() -> String {
//        self.localizedString.toString()
//    }
//    
//    public func toAttributedString() -> NSAttributedString {
//        NSAttributedString(string: self.toString(), attributes: self.attributes)
//    }
//    
//}
//
//public struct LocalizedCompositionString {
//    
//    // MARK: - Init
//    public init(localizedStrings: [LocalizedString]) {
//        self.localizedStrings = localizedStrings
//    }
//    
//    // MARK: - Props
//    public let localizedStrings: [LocalizedString]
//}
//
//// MARK: - StringLocalizable
//extension LocalizedCompositionString: StringLocalizable {
//    
//    public func toString() -> String {
//        self.localizedStrings.reduce("", { $0 + $1.toString() })
//    }
//    
//    public func toAttributedString() -> NSAttributedString {
//        let result: NSMutableAttributedString = .init()
//        
//        self.localizedStrings.forEach { string in
//            result.append(.init(attributedString: string.toAttributedString()))
//        }
//        
//        return result
//    }
//    
//}
