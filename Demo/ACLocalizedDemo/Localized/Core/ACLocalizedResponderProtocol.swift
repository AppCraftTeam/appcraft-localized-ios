//
//  ACLocalizedResponderProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation
import UIKit

private var localizedLanguageKey = ""
private var localizedWrappersKey = ""

public protocol ACLocalizedResponderProtocol: AnyObject {
    func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?)
    func localize()
    func localizeIfNeeded()
    func applyLocalize()
    func didLocalized()
}

// MARK: - Public
public extension ACLocalizedResponderProtocol {
    
    func localize() {
        self.localizedWrappers.forEach { wrapper in
            self.localizeProperty(wrapper.property, string: wrapper.string)
        }
    }

}

// MARK: - Internal
internal extension ACLocalizedResponderProtocol {
    
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
        self.localizeProperty(property, string: string)
        self.localizedWrappers.removeAll(where: { $0.property.identifer == property.identifer })

        if let string = string {
            let wrapper = ACLocalizedPropertyWrapper(property: property, string: string)
            self.localizedWrappers.append(wrapper)
        }
    }
    
}

public protocol ACLocalizedLabelProtocol: UILabel, ACLocalizedResponderProtocol {
    associatedtype LocalizedPropertyType: ACLocalizedPropertyProtocol
    
    func localizeProperty(_ property: LocalizedPropertyType, string: ACLocalizedStringProtocol?)
    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: LocalizedPropertyType) -> T?
    func setLocalizedString(_ string: ACLocalizedStringProtocol?, for property: LocalizedPropertyType)
}

public extension ACLocalizedLabelProtocol {
    
    func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?) {
        print("!!! localizeProperty")
//        guard let property = property as? LocalizedProperty else { return }
//
//        switch property {
//        case .text:
//            self.text = string?.toString()
//        case .attributedText:
//            self.attributedText = string?.toAttributedString()
//        }
        guard let property = property as? LocalizedPropertyType else { return }
        self.localizeProperty(property, string: string)
    }
    
//    var textLocalized: ACLocalizedString? {
//        get { self.getLocalizedString(for: LocalizedProperty.text) }
//        set { self.setLocalizedString(newValue, for: LocalizedProperty.text) }
//    }
//
//    var attributedTextLocalized: ACLocalizedString? {
//        get { self.getLocalizedString(for: LocalizedProperty.attributedText) }
//        set { self.setLocalizedString(newValue, for: LocalizedProperty.attributedText) }
//    }
    
}

//extension UILabel: ACLocalizedLabelProtocol {
//    
//    public typealias LocalizedPropertyType = LocalizedProperty
//    
//    enum LocalizedProperty: ACLocalizedPropertyProtocol {
//        case text
//        case attributedText
//
//        var identifer: String {
//            switch self {
//            case .text:
//                return "text"
//            case .attributedText:
//                return "attributedText"
//            }
//        }
//    }
//    
//}
