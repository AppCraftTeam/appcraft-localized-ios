//
//  ListItemViewController.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import UIKit

class ListItemViewController: UIViewController {
    
    // MARK: - Init
    init(mainItem: Item? = nil) {
        self.mainItem = mainItem
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Props
    private lazy var tableView: UITableView = {
        let result = UITableView()
        result.rowHeight = UITableView.automaticDimension
        result.register(ListItemTableViewCell.self, forCellReuseIdentifier: "ListItemTableViewCell")
        result.dataSource = self
        result.delegate = self
        
        return result
    }()
    
    private var items: [Item] = []
    private let mainItem: Item?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationItem.titleLocalized = .list_nav_title()
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.items = (1...100).map({ index in
            self.createItem(index: index)
        })
        self.tableView.reloadData()
    }

    func createItem(index: Int) -> Item {
        var title: ACLocalizedString {
            let result: ACLocalizedString = "\(ACLocalizedString.item_title()) #\(index)"
            
            if let mainItem = self.mainItem {
                return mainItem.title + " > " + result
            } else {
                return result
            }
        }
        
        let depth = (self.mainItem?.depth ?? 0) + 1
        
        return .init(
            title: title,
            subtitle: ACLocalizedString(
                    string: ACLocalizedString.item_subtitle(),
                    attributes: [ .foregroundColor: UIColor.lightGray ]
                ),
            depth: depth
        )
    }
    
}

// MARK: - UITableViewDataSource
extension ListItemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemTableViewCell", for: indexPath) as? ListItemTableViewCell
        else { return .init() }
        
        cell.item = self.items[indexPath.row]
        
        return cell
    }
    
}
 
// MARK: - UITableViewDelegate
extension ListItemViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        let vc = ListItemViewController(mainItem: item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
