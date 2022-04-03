//
//  ACLocalizedManager.swift
//  
//
//  Created by Дмитрий Поляков on 16.03.2022.
//

import Foundation

open class ACLocalizedManager<Language: ACLocalizedLanguageProtocol> {
    
    // MARK: - Init
    public init() {
        self.languageDidSet()
    }
    
    // MARK: - Props
    open private(set) var wrappers: [ACLocalizedWrapper] = []
    open private(set) var languagesRegistered: [Language] = []
    private let languageRawValueKey = "languageRawValueKey"
    
    private var languageRawValue: String? {
        get { UserDefaults.standard.string(forKey: self.languageRawValueKey) }
        set { UserDefaults.standard.set(newValue, forKey: self.languageRawValueKey) }
    }

    open var language: Language? {
        get { self.languagesRegistered.first(where: { $0.rawValue == self.languageRawValue }) }
        set {
            guard self.languageRawValue != newValue?.rawValue else { return }
            self.languageRawValue = newValue?.rawValue
            self.languageDidSet()
        }
    }
    
    open var localizedBundle: Bundle {
        if let key = self.language?.rawValue, let path = Bundle.main.path(forResource: key, ofType: "lproj"), let bundle = Bundle(path: path) {
            return bundle
        } else {
            return Bundle(for: Self.self)
        }
    }

    // MARK: - Methods
    private func languageDidSet() {
        self.wrappers.clearNilsObjects().applyLocalized()
    }
    
    open func addWrapper(_ wrapper: ACLocalizedWrapper) {
        self.wrappers.clearNilsObjects()
        self.wrappers += [wrapper]
        wrapper.applyLocalized()
    }
    
    open func registerLanguages(_ languages: [Language]) {
        self.languagesRegistered = languages
    }
    
}
