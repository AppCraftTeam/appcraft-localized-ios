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
    private lazy var titleLabel: UILabel = {
        let result = UILabel()
        result.numberOfLines = 0
        return result
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let result = UILabel()
        result.numberOfLines = 0
        return result
    }()
    
    private lazy var depthLabel: UILabel = {
        let result = UILabel()
        result.numberOfLines = 0
        return result
    }()
    
    var item: Item? {
        didSet { self.updateComponents() }
    }
    
    // MARK: - Methods
    func setupComponents() {
        let stackView = UIStackView(arrangedSubviews: [self.titleLabel, self.subtitleLabel, self.depthLabel])
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
        self.titleLabel.textLocalized = self.item?.title
        self.subtitleLabel.attributedTextLocalized = self.item?.subtitle
        self.depthLabel.textLocalized = self.item?.depthString
    }
    
}
