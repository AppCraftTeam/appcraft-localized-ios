//
//  ACLocalizedProtocol.swift
//  
//
//  Created by Дмитрий Поляков on 16.03.2022.
//

import Foundation

public protocol ACLocalizedProtocol: AnyObject {
    var didLocalized: ACLocalizedClosure? { get }
}
