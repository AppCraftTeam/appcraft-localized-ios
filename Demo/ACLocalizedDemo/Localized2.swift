//
//  Localized2.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 30.03.2022.
//

import Foundation

struct LocalizedLanguage {
    
    // MARK: - Init
    init(_ identifer: String) {
        self.identifer = identifer
    }
    
    // MARK: - Props
    let identifer: String
}

struct Localized {
    
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
    
    // MARK: - Methods
    func toLocalizedString() -> String {
        let format = Localized.sharedBundle.bundle.localizedString(forKey: self.key, value: nil, table: self.table)
        return String(format: format, locale: Locale.current, arguments: self.args)
    }
}

extension Localized {
    
    static let languageSelectedUserDefaultsKey: String = "languageSelectedUserDefaultsKey"
    
    static var sharedlanguage: LocalizedLanguage? {
        get {
            guard let identifer = UserDefaults.standard.string(forKey: self.languageSelectedUserDefaultsKey) else { return nil }
            return LocalizedLanguage(identifer)
        }
        set {
            if let value = newValue {
                UserDefaults.standard.set(value.identifer, forKey: self.languageSelectedUserDefaultsKey)
            } else {
                UserDefaults.standard.removeObject(forKey: self.languageSelectedUserDefaultsKey)
            }
            
            self.localize()
        }
    }
    
    static var sharedBundle = LocalizedBundle(language: sharedlanguage)
    
    static func localize() {
        
    }
    
}

class LocalizedBundle {

    // MARK: - Init
    init(language: LocalizedLanguage?) {
        self.language = language
    }

    // MARK: - Props
    let language: LocalizedLanguage?

    var bundle: Bundle {
        if let key = self.language?.identifer, let path = Bundle.main.path(forResource: key, ofType: "lproj"), let bundle = Bundle(path: path) {
            return bundle
        } else {
            return Bundle(for: Self.self)
        }
    }

}
