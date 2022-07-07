//
//  ItemLocalized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import ACLocalized
#warning("Добавить комментарии")
struct ItemLocalized {
    let title: ACLocalizedString
    let subtitle: ACLocalizedString
    let depth: Int
    
    var depthString: ACLocalizedString {
        .item_depth(self.depth) + " " + .depth_screens_genitive(self.depth)
    }
}
