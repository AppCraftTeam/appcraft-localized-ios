//
//  UIView+Localized.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 24.06.2022.
//

import Foundation
import UIKit

//extension UIView: ACLocalizedResponderProtocol {
//    
//    public func localizeProperty(_ property: ACLocalizedPropertyProtocol, string: ACLocalizedStringProtocol?) {
//        print("!!! localizeProperty view", self)
//    }
//    
//    public func localizeIfNeeded() {
//        print("!!! localizeIfNeeded view")
//        let coreLanguage = ACLocalizedCore.shared.language
//
//        if self.localizedLanguage != coreLanguage {
//            self.localizedLanguage = coreLanguage
//
//            self.localize()
//            self.applyLocalize()
//            self.didLocalized()
////            self.view.localizeIfNeeded()
//            
//            self.subviews.forEach { subview in
//                subview.localizeIfNeeded()
//            }
//
////            self.navigationController?.navigationBar.items?.forEach({
////                $0.localizeIfNeeded()
////            })
////
////            self.tabBarController?.tabBar.items?.forEach({
////                $0.localizeIfNeeded()
////            })
//        }
//    }
//    
//    public func applyLocalize() {
//        
//    }
//    
//    public func didLocalized() {
//        
//    }
//    
//}
