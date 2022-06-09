//
//  ViewController.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 29.03.2022.
//

import UIKit
import ACLocalized

class ViewController: UIViewController {
    
    // MARK: - Props
    private lazy var label: UILabel = {
        let result = UILabel()
        result.textAlignment = .center
        
        return result
    }()
    
    private lazy var label1: UILabel = {
        let result = UILabel()
        result.textAlignment = .center
        
        return result
    }()
    
    private lazy var label2: UILabel = {
        let result = UILabel()
        result.textAlignment = .center
        
        return result
    }()
    
//    private lazy var textField: UITextField = {
//        let toolBar = UIToolbar()
//        let doneItem = UIBarButtonItem(titleLocalized: .done(), style: .plain, target: self, action: #selector(self.tapDone))
//        toolBar.items = [doneItem]
//        toolBar.sizeToFit()
//
//        let result = UITextField()
//        result.borderStyle = .roundedRect
////        result.textLocalized = .text()
////        result.placeholderLocalized = .placeholder()
//        result.addTarget(self, action: #selector(self.textFieldChangeEditing(_:)), for: .editingChanged)
//        result.inputAccessoryView = toolBar
//
//        return result
//    }()

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
//        self.navigationItem.titleLocalized = "dfdg \(localized: ACLocalizedString.nav_title(1)) \(string: 1.description)"
        
//        self.navigationItem.titleLocalized = .nav_title(self.navigationController?.viewControllers.count ?? 0)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(titleLocalized: .next(), style: .plain, target: self, action: #selector(self.tapNext))
    
        let changeLocalizedButton = UIButton(type: .system)
//        changeLocalizedButton.setTitleLocalized(.change_localized(), for: .normal)
        changeLocalizedButton.addTarget(self, action: #selector(self.tapBt), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [
            self.label,
            self.label1,
            self.label2,
//            self.textField,
            changeLocalizedButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
//        let testLocalizedString = LocalizedString(key: "test", table: "Localized")
//        let textLocalizedString = LocalizedString(key: "text", table: "Localized")
//        let placeholderLocalizedString = LocalizedString(key: "placeholder", table: "Localized")
//        let placeholderLocalizedAttributedString = LocalizedString(string: placeholderLocalizedString, attributes: [
//            .backgroundColor: UIColor.red,
//            .foregroundColor: UIColor.gray
//        ])
        print("!!!", ACLocalizedString.text().toLocalizedString())
        
//        self.label.textLocalized = .test()
//        self.label.textLocalized = .text()
        
        self.label.text = ACLocalizedString.text().toLocalizedString()
        changeLocalizedButton.setTitle(ACLocalizedString.change_localized().toLocalizedString(), for: .normal)
        
    }
    
    @objc
    private func tapBt() {
        ACLocalizedSettings.language = ACLocalizedSettings.language == .en ? .ru : .en
        UIApplication.shared.windows.forEach({ $0.reload() })
    }
    
    @objc
    private func textFieldChangeEditing(_ textField: UITextField) {
        self.updateLabel()
    }
    
    @objc
    private func tapDone() {
        self.view.endEditing(true)
    }
    
    @objc
    private func tapNext() {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    private func updateLabel() {
//        if let text = self.textField.text, !text.isEmpty {
//            self.label.textLocalized = .init(stringLiteral: text)
//        } else {
//            self.label.textLocalized = .test()
//        }
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
    
    static func text() -> ACLocalizedString {
        .init("text", "Localized")
    }
    
    static func placeholder() -> ACLocalizedString {
        .init("placeholder", "Localized")
    }
    
    static func done() -> ACLocalizedString {
        .init("done", "Localized")
    }
    
    static func nav_title(_ a1: Int) -> ACLocalizedString {
        .init("nav_title", "Localized", a1)
    }
    
    static func next() -> ACLocalizedString {
        .init("next", "Localized")
    }
    
}

public extension UIWindow {

    /// Unload all views and add them back
    /// Used for applying `UIAppearance` changes to existing views
    func reload() {
//        subviews.forEach { view in
//            view.removeFromSuperview()
//            addSubview(view)
//        }
        print("!!! reload")
//        let root = self.rootViewController
//        self.rootViewController = root
        
        self.rootViewController?.reload()
        
    }
}

extension UIViewController {
    
    func reload() {
        self.view.subviews.forEach { subview in
            subview.removeFromSuperview()
            view.addSubview(subview)
        }
        
        self.children.forEach({ $0.reload() })
    }
    
}
