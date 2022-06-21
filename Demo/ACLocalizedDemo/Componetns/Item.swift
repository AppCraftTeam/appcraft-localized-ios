//
//  Item.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 21.06.2022.
//

import Foundation

struct Item {
    let title: String
    let subtitle: NSAttributedString
    let depth: Int
    
    var depthString: String {
        (ACLocalizedString.item_depth(self.depth) + " " + ACLocalizedString.depth_screens_genitive(self.depth)).toString()
    }
}
