//
//  ACLocalizedAttributedString.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 03.04.2022.
//

import Foundation

public struct ACLocalizedAttributedString {
    
    // MARK: - Init
    public init(components: [ACLocalizedStringProtocol]) {
        self.components = components
    }
    
    // MARK: - Props
    public private(set) var components: [ACLocalizedStringProtocol] = []
}

// MARK: - ACLocalizedStringProtocol
extension ACLocalizedAttributedString: ACLocalizedStringProtocol {
    
    public func toLocalizedString() -> String {
        self.components.reduce("", { $0 + $1.toLocalizedString() })
    }
    
    public func toLocalizedAttributedString() -> NSAttributedString {
        let result = NSMutableAttributedString()
        
        self.components.forEach { string in
            result.append(string.toLocalizedAttributedString())
        }
        
        return result
    }
    
}
