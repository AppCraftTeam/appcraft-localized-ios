//
//  LocalizedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation

extension ACLocalizedString {
    
    static func list_nav_title() -> ACLocalizedString {
        .init(key: "list_nav_title", table: "Localized")
    }
    
    static func item_title() -> ACLocalizedString {
        .init(key: "item_title", table: "Localized")
    }
    
    static func item_subtitle() -> ACLocalizedString {
        .init(key: "item_subtitle", table: "Localized")
    }
    
}
