//
//  Item.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation

struct Item {
    let title: ACLocalizedString
    let subtitle: ACLocalizedString
    let depth: Int
    
    #warning("plurals")
    var depthString: ACLocalizedString {
        .init(stringLiteral: self.depth.description)
    }
}
