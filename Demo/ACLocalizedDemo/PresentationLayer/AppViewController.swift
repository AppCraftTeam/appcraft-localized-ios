//
//  AppViewController.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 04.07.2022.
//

import Foundation
import UIKit
import ACLocalized

class AppViewController: UIViewController, ACLocalizedResponderProtocol {
    func applyLocalize() {}
    func didLocalized() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.viewControllerLocalizeIfNeeded()
    }

}
