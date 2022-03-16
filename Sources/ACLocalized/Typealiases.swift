//
//  Typealiases.swift
//  
//
//  Created by Дмитрий Поляков on 16.03.2022.
//

import Foundation

public typealias ACLocalizedClosure = (ACLocalizedProtocol) -> Void
public typealias ACLocalizedSpecificClosure<Object: ACLocalizedProtocol> = (Object) -> Void
