//
//  TabBarController.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listVC = ListItemViewController()
        let listNC = UINavigationController(rootViewController: listVC)
        listNC.tabBarItem = UITabBarItem(title: "", image: nil, tag: 0)
        
        let settingsVC = SettingsViewController()
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        settingsNC.tabBarItem = UITabBarItem(title: "", image: nil, tag: 0)
        
        self.viewControllers = [listNC, settingsNC]
    }
    
}
