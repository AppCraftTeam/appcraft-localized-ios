//
//  ACLocalizedObjectProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation

private var localizedWrappersKey = ""

public protocol ACLocalizedObjectProtocol: AnyObject {
    func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?)
    func localize()
}

// MARK: - Public
public extension ACLocalizedObjectProtocol {
    
    func localize() {
        self.localizedWrappers.forEach { wrapper in
            self.localizeProperty(wrapper.property, string: wrapper.string)
        }
    }

}

// MARK: - Private
private extension ACLocalizedObjectProtocol {
    
    var localizedWrappers: [ACLocalizedPropertyWrapper] {
        get { objc_getAssociatedObject(self, &localizedWrappersKey) as? [ACLocalizedPropertyWrapper] ?? [] }
        set { objc_setAssociatedObject(self, &localizedWrappersKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
}

// MARK: - Internal
internal extension ACLocalizedObjectProtocol {
    
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
