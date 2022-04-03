//
//  ACLocalizedLanguage.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation

public struct ACLocalizedLanguage {

    // MARK: - Init
    public init(_ identifer: String) {
        self.identifer = identifer
    }

    // MARK: - Props
    public let identifer: String
}

// MARK: - Equatable
extension ACLocalizedLanguage: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.identifer == rhs.identifer
    }
    
}
