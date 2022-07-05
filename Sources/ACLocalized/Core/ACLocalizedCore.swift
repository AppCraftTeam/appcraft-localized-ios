//
//  ACLocalizedCore.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

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
    
    public var coreBundle: Bundle
    public var defaultLanguage: ACLocalizedLanguage
    
    public var language: ACLocalizedLanguage {
        get {
            let code = UserDefaults.standard.string(forKey: self.kLanguageCode) ?? self.defaultLanguage.code
            return ACLocalizedLanguage(code: code)
        }
        set {
            UserDefaults.standard.set(newValue.code, forKey: self.kLanguageCode)
        }
    }
    
    public var supportedLanguages: [ACLocalizedLanguage] {
        Bundle.main.localizations
            .filter({ $0 != "Base" })
            .map({ ACLocalizedLanguage(code: $0) })
    }
    
    // MARK: - Methods
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
