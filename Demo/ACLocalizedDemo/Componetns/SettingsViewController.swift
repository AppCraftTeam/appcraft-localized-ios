//
//  SettingsViewController.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Props
    private lazy var stackView: UIStackView = {
        let result = UIStackView()
        result.axis = .vertical
        result.spacing = 16
        
        return result
    }()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationItem.titleLocalized = .settings_nav_title()
        
        let guide = self.view.safeAreaLayoutGuide
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.stackView)
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
            self.stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
            self.stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -16)
        ])
        
        self.updateComponents()
    }
    
    func updateComponents() {
        let langs: [ACLocalizedLanguage] = [.ru, .en]
        let langSelected = ACLocalizedCore.shared.language ?? .ru
        
        var views: [UIView] = langs.map { lang in
            SettingsLangButton(lang: lang, isChecked: lang == langSelected) { [weak self] lang in
                DispatchQueue.main.async { [weak self] in
                    ACLocalizedCore.shared.language = lang
                    self?.updateComponents()
                }
            }
        }
        
        views += [.init()]
        
        self.stackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        views.forEach({ self.stackView.addArrangedSubview($0) })
    }
    
    func localize() {
        print("!!! localize")
    }
    
}


