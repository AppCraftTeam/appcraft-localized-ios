//
//  ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public protocol ACLocalizedObjectProtocol: AnyObject {
    var identifer: String { get }

    func localize(_ property: ACLocalizedPropertyProtocol, localized: ACLocalizedStringProtocol?)
}

public extension ACLocalizedObjectProtocol {

    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T? {
        ACLocalizedCore.shared.getPicker(object: self, property: property)?.localized as? T
    }

    func setLocalizedString(_ localized: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol) {
        ACLocalizedCore.shared.setPicker(object: self, property: property, localized: localized)
        self.localize(property, localized: localized)
    }

}

public protocol ACLocalizedWrapperStoreble: AnyObject {
    var localizedWrappers: [ACLocalizedPropertyWrapper] { get set }
    
    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T?
    func setLocalizedString(_ string: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol)
    
    func registerInLocalizeCore()
    func unregisterInLocalizeCore()
    
    func applyLocalize(fromWrapper wrapper: ACLocalizedPropertyWrapper)
    func applyLocalize()
}

public extension ACLocalizedWrapperStoreble {

    var localizedWrappers: [ACLocalizedPropertyWrapper] {
        get { objc_getAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque()) as? [ACLocalizedPropertyWrapper] ?? [] }
        set { objc_setAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque(), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T? {
        self.localizedWrappers.first(where: { $0.property.identifer == property.identifer })?.string as? T
    }
    
    func setLocalizedString(_ string: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol) {
        self.localizedWrappers.removeAll(where: { $0.property.identifer == property.identifer })
        
        if let string = string {
            let wrapper = ACLocalizedPropertyWrapper(property: property, string: string)
            self.localizedWrappers.append(wrapper)
            self.applyLocalize(fromWrapper: wrapper)
        }
        
        if !self.localizedWrappers.isEmpty {
            self.registerInLocalizeCore()
        } else {
            self.unregisterInLocalizeCore()
        }
    }
    
    func registerInLocalizeCore() {
        ACLocalizedCore.shared.registerLocalizedObject(self)
    }
    
    func unregisterInLocalizeCore() {
        ACLocalizedCore.shared.unregisterLocalizedObject(self)
    }
    
    func applyLocalize() {}

}

public struct ACLocalizedPropertyWrapper {
    public let property: ACLocalizedPropertyProtocol
    public let string: ACLocalizedStringProtocol
}
