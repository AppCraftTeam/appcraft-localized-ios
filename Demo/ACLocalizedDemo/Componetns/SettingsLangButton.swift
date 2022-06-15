//
//  SettingsLangButton.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import UIKit

class SettingsLangButton: UIButton {
    
    // MARK: - Init
    init(lang: ACLocalizedLanguage, isChecked: Bool, didTap: @escaping (ACLocalizedLanguage) -> Void) {
        self.lang = lang
        self.isChecked = isChecked
        self.didTap = didTap
        
        super.init(frame: .zero)
        self.setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Props
    let lang: ACLocalizedLanguage
    let isChecked: Bool
    let didTap: (ACLocalizedLanguage) -> Void
    
    // MARK: - Methods
    private func setupComponents() {
        self.layer.cornerRadius = 12
        #warning("localized")
        switch lang {
        case .ru:
            self.setTitleLocalized("ru", for: .normal)
        case .en:
            self.setTitleLocalized("en", for: .normal)
        default:
            break
        }
        
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = self.isChecked ? .lightGray : .clear
        self.addTarget(self, action: #selector(self.handleTap), for: .touchUpInside)
    }
    
    @objc
    private func handleTap() {
        self.didTap(self.lang)
    }
    
}
