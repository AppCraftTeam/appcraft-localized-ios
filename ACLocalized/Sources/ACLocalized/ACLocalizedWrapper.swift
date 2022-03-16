//
//  ACLocalizedWrapper.swift
//  
//
//  Created by Дмитрий Поляков on 16.03.2022.
//

import Foundation

public struct ACLocalizedWrapper {
    
    // MARK: - Init
    public init(object: ACLocalizedProtocol) {
        self.object = object
    }
    
    // MARK: - Props
    public private(set) weak var object: ACLocalizedProtocol?
    
    // MARK: - Methods
    public func applyLocalized() {
        guard let object = self.object else { return }
        object.didLocalized?(object)
    }
}

// MARK: - Array + ACLocalizedWrapper
public extension Array where Element == ACLocalizedWrapper {
    
    @discardableResult
    mutating func clearNilsObjects() -> Self {
        self = self.filter({ $0.object != nil })
        
        return self
    }
    
    func applyLocalized() {
        self.forEach({ $0.applyLocalized() })
    }
    
}
