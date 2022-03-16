//
//  ACLocalizedManageableProtocol.swift
//  
//
//  Created by Дмитрий Поляков on 16.03.2022.
//

import Foundation

public protocol ACLocalizedManageableProtocol: ACLocalizedProtocol {
    associatedtype Language: ACLocalizedLanguageProtocol
    
    var localizedManager: ACLocalizedManager<Language> { get }
}

public extension ACLocalizedManageableProtocol {
    
    var didLocalized: ACLocalizedClosure? {
        get { objc_getAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque()) as? ACLocalizedClosure }
        set { objc_setAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque(), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func applyLocalized(_ didLocalized: @escaping ACLocalizedSpecificClosure<Self>) {
        self.didLocalized = { object in
            guard let object = object as? Self else { return }
            didLocalized(object)
        }
        
        self.localizedManager.addWrapper(ACLocalizedWrapper(object: self))
    }
    
}
