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
        
        self.window = .init()
        self.window?.rootViewController = TabBarController(localizedMode: .enabled)
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

