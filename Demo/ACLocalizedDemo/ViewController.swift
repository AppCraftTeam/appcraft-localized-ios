//
//  ViewController.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 29.03.2022.
//

import UIKit
import ACLocalized

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let label = UILabel()
        label.textAlignment = .center
        label.textLocalized = .test()
//        label.attributedTextLocalized = .init([Localized.test(), " ", Localized.change_localized()], attributes: nil)
        
        label.translatesAutoresizingMaskIntoConstraints = false

        let button = UIButton(type: .system)
        button.setTitleLocalized(.change_localized(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.tapBt), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc
    func tapBt() {
        ACLocalizedSettings.language = ACLocalizedSettings.language == .en ? .ru : .en
    }

}

extension ACLocalizedLanguage {
    static let en = ACLocalizedLanguage("en")
    static let ru = ACLocalizedLanguage("ru")
}

extension ACLocalizedString {
    
    static func test() -> ACLocalizedString {
        .init("test", "Localized")
    }
    
    static func change_localized() -> ACLocalizedString {
        .init("change_localized", "Localized")
    }
    
}
