//
//  ACLocalizedLanguageProtocol.swift
//  
//
//  Created by Дмитрий Поляков on 16.03.2022.
//

import Foundation

public protocol ACLocalizedLanguageProtocol {
    var rawValue: String { get }

    init?(rawValue: String)
}
