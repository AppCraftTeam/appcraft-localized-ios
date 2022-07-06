//
//  LocalizedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import ACLocalized
#warning("Добавить комментарии")
extension ACLocalizedString {
    
    static func tb_list() -> ACLocalizedString {
        .init(key: "tb_list", table: "Localized")
    }
    
    static func tb_settings() -> ACLocalizedString {
        .init(key: "tb_settings", table: "Localized")
    }
    
    static func list_nav_title() -> ACLocalizedString {
        .init(key: "list_nav_title", table: "Localized")
    }
    
    static func settings_nav_title() -> ACLocalizedString {
        .init(key: "settings_nav_title", table: "Localized")
    }
    
    static func item_title() -> ACLocalizedString {
        .init(key: "item_title", table: "Localized")
    }
    
    static func lang_ru() -> ACLocalizedString {
        .init(key: "lang_ru", table: "Localized")
    }
    
    static func lang_en() -> ACLocalizedString {
        .init(key: "lang_en", table: "Localized")
    }
    
    static func depth_screens_genitive(_ count: Int) -> ACLocalizedString {
        .init(key: "depth_screens_genitive", table: "Localized", args: count)
    }
    
    static func item_depth(_ depth: Int) -> ACLocalizedString {
        .init(key: "item_depth", table: "Localized", args: depth)
    }
    
}
