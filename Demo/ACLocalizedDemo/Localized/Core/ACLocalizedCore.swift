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
        
        self.localizedObjects = NSHashTable<AnyObject>(options: .weakMemory)
        self.onFlyLocalizeEnabled = true
    }
    
    public static let shared = ACLocalizedCore()
    
    // MARK: - Props
    private let kLanguageCode: String = "ACLocalizedCore_kLanguageCode"
    private var localizedObjects: NSHashTable<AnyObject>
    
    public var coreBundle: Bundle
    public var defaultLanguage: ACLocalizedLanguage
    public var onFlyLocalizeEnabled: Bool
    
    public private(set) var language: ACLocalizedLanguage {
        get {
            let code = UserDefaults.standard.string(forKey: self.kLanguageCode) ?? self.defaultLanguage.code
            return ACLocalizedLanguage(code: code)
        }
        set {
            UserDefaults.standard.set(newValue.code, forKey: self.kLanguageCode)
        }
    }
    
    public func setLanguage(_ language: ACLocalizedLanguage, completion: (() -> Void)?) {
        self.language = language
        self.localize(completion: completion)
    }
    
    public var supportedLanguages: [ACLocalizedLanguage] {
        Bundle.main.localizations
            .filter({ $0 != "Base" })
            .map({ ACLocalizedLanguage(code: $0) })
    }
    
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
    
    public func localize(completion: (() -> Void)?) {
        guard self.onFlyLocalizeEnabled else { return }
        
        let objects = self.localizedObjects.allObjects
        guard !objects.isEmpty else {
            completion?()
            return
        }
        
        let group = DispatchGroup()
        objects.forEach {
            guard let object = $0 as? ACLocalizedObjectProtocol else { return }
            object.applyLocalize()
            
            group.enter()
            object.localizeAllProperties(completion: {
                group.leave()
            })
            
        }
        
        group.notify(queue: .global()) {
            completion?()
        }
    }
    
    public func registerLocalizedObject(_ object: ACLocalizedObjectProtocol) {
        self.unregisterLocalizedObject(object)
        self.localizedObjects.add(object)
    }

    public func unregisterLocalizedObject(_ object: ACLocalizedObjectProtocol) {
        self.localizedObjects.remove(object)
    }
    
}
