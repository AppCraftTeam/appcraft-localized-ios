//
//  ItemView.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import UIKit

class ItemView: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupComponents()
    }
    
    // MARK: - Props
    private lazy var titleLabel: AppLabel = {
        let result = AppLabel()
        result.numberOfLines = 0
        return result
    }()
    
    private lazy var subtitleLabel: AppLabel = {
        let result = AppLabel()
        result.numberOfLines = 0
        return result
    }()
    
    private lazy var depthLabel: AppLabel = {
        let result = AppLabel()
        result.numberOfLines = 0
        return result
    }()
    
    var itemLocalized: ItemLocalized? {
        didSet { self.updateComponents() }
    }
    
    var item: Item? {
        didSet { self.updateComponents() }
    }
    
    // MARK: - Methods
    func setupComponents() {
        let stackView = UIStackView(arrangedSubviews: [self.depthLabel, self.titleLabel, self.subtitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func updateComponents() {
        if let item = self.item {
            self.titleLabel.text = item.title
            self.subtitleLabel.attributedText = item.subtitle
            self.depthLabel.text = item.depthString
        } else if let item = self.itemLocalized {
            self.titleLabel.textLocalized = item.title
            self.subtitleLabel.attributedTextLocalized = item.subtitle
            self.depthLabel.textLocalized = item.depthString
        }
    }
    
}
