//
//  ListItemTableViewCell.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import UIKit

class ListItemTableViewCell: UITableViewCell {
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupComponents()
    }
    
    // MARK: - Props
    private lazy var itemView: ItemView = .init()
    
    var itemLocalized: ItemLocalized? {
        get { self.itemView.itemLocalized }
        set { self.itemView.itemLocalized = newValue }
    }
    
    // MARK: - Methods
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        self.contentView.alpha = highlighted ? 0.8 : 1.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {}
    
    func setupComponents() {
        self.itemView.removeFromSuperview()
        self.itemView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.itemView)
        
        NSLayoutConstraint.activate([
            self.itemView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.itemView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.itemView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            self.itemView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        ])
    }
    
}
