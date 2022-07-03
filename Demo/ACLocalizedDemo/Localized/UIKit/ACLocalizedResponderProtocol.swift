//
//  ACLocalizedResponderProtocol.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 14.06.2022.
//

import Foundation
import UIKit

public protocol ACLocalizedResponderProtocol: AnyObject {
    func applyLocalize()
    func didLocalized()
}

class AppView: UIView, ACLocalizedResponderProtocol {
    func applyLocalize() { }
    func didLocalized() { }
}

class AppLabel: UILabel, ACLocalizedResponderProtocol {
    func applyLocalize() {}
    func didLocalized() {}
}

class AppViewController: UIViewController, ACLocalizedResponderProtocol {
    func applyLocalize() {}
    func didLocalized() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.localizeIfNeeded()
    }

}
