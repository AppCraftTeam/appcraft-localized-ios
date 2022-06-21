//
//  TabBarController.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Init
    init(localizedMode: LocalizeMode) {
        self.localizedMode = localizedMode
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Props
    let localizedMode: LocalizeMode
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listVC = ListItemViewController(localizedMode: self.localizedMode)
        let listNC = UINavigationController(rootViewController: listVC)
        listNC.tabBarItem = UITabBarItem(titleLocalized: .tb_list(), image: nil, tag: 0)
        
        let settingsVC = SettingsViewController()
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        settingsNC.tabBarItem = UITabBarItem(titleLocalized: .tb_settings(), image: nil, tag: 0)
        
        self.viewControllers = [listNC, settingsNC]
    }
    
}
