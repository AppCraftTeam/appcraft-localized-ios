//
//  ACLocalizeIfNeeded.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.07.2022.
//

import Foundation

func ACLocalizeIfNeeded(_ object: ACLocalizedObjectProtocol) {
    func localizeAllProperties() {
        object.localizedWrappers.forEach { wrapper in
            wrapper.property.localize(object: object, string: wrapper.string)
        }
    }
    
    func localizeAsResponder() {
        let asResponder = object as? ACLocalizedResponderProtocol
        asResponder?.applyLocalize()
        asResponder?.didLocalized()
    }
    
    let coreLanguage = ACLocalizedCore.shared.language
    
    switch object.localizedLanguage {
    case coreLanguage:
        break
    case .none:
        localizeAsResponder()
    default:
        localizeAllProperties()
        localizeAsResponder()
    }
    
    object.localizedLanguage = coreLanguage
}
