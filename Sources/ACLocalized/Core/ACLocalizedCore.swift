//
//  ACLocalizedCore.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

/**
 Singleton class for general bundle settings, locale and language.
 */
public class ACLocalizedCore {
    
    // MARK: - Init
    private init() {
        let coreBundle = Bundle.main
        let code = coreBundle.preferredLocalizations.first ?? coreBundle.developmentLocalization ?? "en"
        let defaultLanguage = ACLocalizedLanguage(code: code)
        
        self.coreBundle = coreBundle
        self.defaultLanguage = defaultLanguage
    }
    
    public static let shared = ACLocalizedCore()
    
    // MARK: - Props
    private let kLanguageCode: String = "ACLocalizedCore_kLanguageCode"
    
    /**
     Bundle to get the localized string. By default set to `Bundle.main`.
     */
    public var coreBundle: Bundle
    
    /**
     If the `language` is not hashed, then getting `language` will return the `defaultLanguage` value.
     */
    public var defaultLanguage: ACLocalizedLanguage
    
    /**
     Selected localization language. Used when getting strings from localization files.
     */
    public var language: ACLocalizedLanguage {
        get {
            let code = UserDefaults.standard.string(forKey: self.kLanguageCode) ?? self.defaultLanguage.code
            return ACLocalizedLanguage(code: code)
        }
        set {
            UserDefaults.standard.set(newValue.code, forKey: self.kLanguageCode)
        }
    }
    
    /**
     Formed from the `bundle.main` localizations identifiers of the current project. Except `Base` (See `<PROJECT_NAME> -> Info -> Localizations`).
     */
    public var supportedLanguages: [ACLocalizedLanguage] {
        Bundle.main.localizations
            .filter({ $0 != "Base" })
            .map({ ACLocalizedLanguage(code: $0) })
    }
    
    // MARK: - Methods
    
    /**
     Method for getting a localized string.
     - parameter key: Row key in string tables in files`.strings` or `.stringdict`.
     - parameter table: File string table name`.strings` or `.stringdict`.
     - parameter args: Values for string format specifiers the value of the string obtained from the string table.
     - returns: Localized string.
     
     There is a `Localized.strings` file. It has the added key-value `"test_string" = "Test string #%d"`.
     To get a localized string by the `"test_string"` key, call the `localizedString` method with the following parameters:
     
        `.localizedString(key: "test_string", table: "Localized", args:  1)`
     */
    public func localizedString(key: String, table: String, args: CVarArg...) -> String {
        let languageCode = self.language.code
        
        var languageBundle: Bundle {
            guard
                let path = self.coreBundle.path(forResource: languageCode, ofType: "lproj"),
                let bundle = Bundle(path: path)
            else { return self.coreBundle }

            return bundle
        }
        
        let format = languageBundle.localizedString(forKey: key, value: nil, table: table)
        let languageLocale = Locale(identifier: languageCode)
        let string = String(format: format, locale: languageLocale, arguments: args)
        
        return string
    }
    
}
