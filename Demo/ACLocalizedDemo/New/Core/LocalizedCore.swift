//
//  LocalizedCore.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public class LocalizedCore {
    
    // MARK: - Props
    public static let shared = LocalizedCore()
    
    private let languageUserDefaultsKey: String = "languageUserDefaultsKey"
    
    public var bundle: Bundle {
        guard
            let key = self.language?.identifer,
            let path = Bundle.main.path(forResource: key, ofType: "lproj"),
            let bundle = Bundle(path: path)
        else { return Bundle.main }

        return bundle
    }
    
    public var language: LocalizedLanguage? {
        get {
            guard let identifer = UserDefaults.standard.string(forKey: self.languageUserDefaultsKey) else { return nil }
            return LocalizedLanguage(identifer)
        }
        set {
            if let value = newValue {
                UserDefaults.standard.set(value.identifer, forKey: self.languageUserDefaultsKey)
            } else {
                UserDefaults.standard.removeObject(forKey: self.languageUserDefaultsKey)
            }

            self.pickers.removeAll(where: { $0.object == nil })
            self.pickers.forEach({ $0.localize() })
        }
    }
    
    private var pickers: [LocalizedPicker] = []
    
    func getPicker(object: LocalizedObjectProtocol, property: LocalizedPropertyProtocol) -> LocalizedPicker? {
        self.pickers.first(where: { $0.object?.identifer == object.identifer && $0.property.identifer == property.identifer })
    }

    func setPicker(object: LocalizedObjectProtocol, property: LocalizedPropertyProtocol, localized: LocalizedStringProtocol?) {
        self.pickers.removeAllIfExist(forObject: object, andProperty: property)

        guard let localized = localized else { return }
        self.pickers += [LocalizedPicker(object, property: property, localized: localized)]
    }
    
}
