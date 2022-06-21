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
    
    private lazy var activityView: UIActivityIndicatorView = {
        let result = UIActivityIndicatorView(style: .gray)
        result.hidesWhenStopped = true
        
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
        
        self.activityView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.activityView)
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
            self.stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
            self.stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -16),
            
            self.activityView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            self.activityView.centerYAnchor.constraint(equalTo: guide.centerYAnchor)
        ])
        
        self.activityView.stopAnimating()
        self.updateComponents()
    }
    
    func updateComponents() {
        let core = ACLocalizedCore.shared
        let langs: [ACLocalizedLanguage] = core.supportedLanguages
        let langSelected = core.language
        
        var views: [UIView] = langs.map { lang in
            SettingsLangButton(lang: lang, isChecked: lang == langSelected) { [weak self] lang in
                DispatchQueue.main.async { [weak self] in
                    print("!!! start \(Date())")
                    self?.activityView.startAnimating()
                    ACLocalizedCore.shared.setLanguage(lang) { [weak self] in
                        print("!!! completed \(Date())")
                        
                        DispatchQueue.main.async { [weak self] in
                            self?.updateComponents()
//                            self?.activityView.stopAnimating()
                        }
                    }
                }
            }
        }
        
        views += [.init()]
        
        self.stackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        views.forEach({ self.stackView.addArrangedSubview($0) })
    }
    
}


