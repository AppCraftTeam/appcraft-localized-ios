//
//  ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.07.2022.
//

import Foundation

private var localizedLanguageKey = ""
private var localizedWrappersKey = ""

protocol ACLocalizedObjectProtocol: AnyObject {
    var localizedLanguage: ACLocalizedLanguage? { get set }
    var localizedWrappers: [ACLocalizedPropertyWrapper] { get set }
    
    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T?
    func setLocalizedString(_ string: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol)
}

extension ACLocalizedObjectProtocol {
    
    var localizedLanguage: ACLocalizedLanguage? {
        get { objc_getAssociatedObject(self, &localizedLanguageKey) as? ACLocalizedLanguage }
        set { objc_setAssociatedObject(self, &localizedLanguageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    var localizedWrappers: [ACLocalizedPropertyWrapper] {
        get { objc_getAssociatedObject(self, &localizedWrappersKey) as? [ACLocalizedPropertyWrapper] ?? [] }
        set { objc_setAssociatedObject(self, &localizedWrappersKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T? {
        self.localizedWrappers.first(where: { $0.property.identifer == property.identifer })?.string as? T
    }

    func setLocalizedString(_ string: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol) {
        property.localize(object: self, string: string)
        
        self.localizedWrappers.removeAll(where: { $0.property.identifer == property.identifer })

        if let wrapper = ACLocalizedPropertyWrapper(property: property, string: string) {
            self.localizedWrappers.append(wrapper)
        }
    }
    
}

