//
//  ListItemViewController.swift
//  ACLocalizedDemo
//
//  Created by Дмитрий Поляков on 15.06.2022.
//

import Foundation
import UIKit
import ACLocalized

class ListItemViewController: AppViewController {
    
    // MARK: - Init
    init(mainItemLocalized: ItemLocalized? = nil) {
        self.mainItemLocalized = mainItemLocalized
        
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
    
    private var itemsLocalized: [ItemLocalized] = []
    private let mainItemLocalized: ItemLocalized?
    
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
        
        self.itemsLocalized = (1...100).map({ index in
            self.createItemLocalized(index: index)
        })
        
        self.tableView.reloadData()
    }

    func createItemLocalized(index: Int) -> ItemLocalized {
        var title: ACLocalizedString {
            let result: ACLocalizedString = "\(ACLocalizedString.item_title()) #\(index)"
            
            if let mainItem = self.mainItemLocalized {
                return mainItem.title + " > " + result
            } else {
                return result
            }
        }
        
        let depth = (self.mainItemLocalized?.depth ?? 0) + 1
        
        return .init(
            title: title,
            subtitle: ACLocalizedString(string: title, attributes: [ .foregroundColor: UIColor.lightGray ]),
            depth: depth
        )
    }
    
    override func didLocalized() {
        super.didLocalized()
        
        self.tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource
extension ListItemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.itemsLocalized.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemTableViewCell", for: indexPath) as? ListItemTableViewCell
        else { return .init() }
        
        cell.itemLocalized = self.itemsLocalized[indexPath.row]
        return cell
    }
    
}
 
// MARK: - UITableViewDelegate
extension ListItemViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemLocalized = self.itemsLocalized[indexPath.row]
        let vc = ListItemViewController(mainItemLocalized: itemLocalized)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
