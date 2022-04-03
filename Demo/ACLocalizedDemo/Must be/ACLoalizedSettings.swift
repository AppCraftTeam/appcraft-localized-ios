//
//  ACLoalizedSettings.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation

public enum ACLocalizedSettings {
    
    public static var bundle: Bundle {
        guard
            let key = self.language?.identifer,
            let path = Bundle.main.path(forResource: key, ofType: "lproj"),
            let bundle = Bundle(path: path)
        else { return Bundle.main }
        
        return bundle
    }
    
    private static let languageUserDefaultsKey: String = "languageUserDefaultsKey"
    
    public static var language: ACLocalizedLanguage? {
        get {
            guard let identifer = UserDefaults.standard.string(forKey: self.languageUserDefaultsKey) else { return nil }
            return ACLocalizedLanguage(identifer)
        }
        set {
            if let value = newValue {
                UserDefaults.standard.set(value.identifer, forKey: self.languageUserDefaultsKey)
            } else {
                UserDefaults.standard.removeObject(forKey: self.languageUserDefaultsKey)
            }

            self.localize()
        }
    }
    
    private static func localize() {
        self.pickers.forEach { picker in
            picker.localize()
        }
    }
    
}

// MARK: - Pickers
extension ACLocalizedSettings {
    
    static var pickers: [ACLocalizedPicker] = []
    
    static func getPicker(object: ACLocalizedObjectProtocol, property: ACLocalizedPropertyProtocol) -> ACLocalizedPicker? {
        self.pickers.first(where: { $0.object?.identifer == object.identifer && $0.property.identifer == property.identifer })
    }
    
    static func setPicker(object: ACLocalizedObjectProtocol, property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?) {
        if let index = self.pickers.firstIndex(where: { $0.object?.identifer == object.identifer && $0.property.identifer == property.identifer }) {
            self.pickers.remove(at: index)
        }
        
        guard let localized = localized else { return }
        let picker = ACLocalizedPicker(object, property: property, localized: localized)
        self.pickers += [picker]
    }
}
