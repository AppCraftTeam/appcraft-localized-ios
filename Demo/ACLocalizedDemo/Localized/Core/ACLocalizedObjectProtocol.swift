//
//  ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

public protocol ACLocalizedObjectProtocol: AnyObject {
    var localizedWrappers: [ACLocalizedPropertyWrapper] { get set }
    
    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T?
    func setLocalizedString(_ string: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol)
    
    func registerInLocalizeCore()
    func unregisterInLocalizeCore()
    
    func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?, completion: (() -> Void)?)
    func localizeAllProperties(completion: (() -> Void)?)
    func applyLocalize()
}

public extension ACLocalizedObjectProtocol {
    
    var localizedWrappers: [ACLocalizedPropertyWrapper] {
        get { objc_getAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque()) as? [ACLocalizedPropertyWrapper] ?? [] }
        set { objc_setAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque(), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func getLocalizedString<T: ACLocalizedStringProtocol>(for property: ACLocalizedPropertyProtocol) -> T? {
        self.localizedWrappers.first(where: { $0.property.identifer == property.identifer })?.string as? T
    }

    func setLocalizedString(_ string: ACLocalizedStringProtocol?, for property: ACLocalizedPropertyProtocol) {
        self.localizeProperty(property, string: string, completion: nil)
        
        self.localizedWrappers.removeAll(where: { $0.property.identifer == property.identifer })

        if let string = string {
            let wrapper = ACLocalizedPropertyWrapper(property: property, string: string)
            self.localizedWrappers.append(wrapper)
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

    func localizeAllProperties(completion: (() -> Void)?) {
        guard !self.localizedWrappers.isEmpty else {
            self.unregisterInLocalizeCore()
            completion?()
            return
        }
        
        let group = DispatchGroup()
        
        self.localizedWrappers.forEach { wrapper in
            group.enter()
            self.localizeProperty(wrapper.property, string: wrapper.string, completion: {
                group.leave()
            })
        }
        
        group.notify(queue: .global()) {
            completion?()
        }
    }

    func applyLocalize() {}

}
