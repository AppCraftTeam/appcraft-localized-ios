//
//  AppDelegate.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 29.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if ACLocalizedCore.shared.language == nil {
            ACLocalizedCore.shared.language = .ru
        }
        
        self.window = .init()
        self.window?.rootViewController = TabBarController()
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

