//
//  AccountViewController.swift
//  ©️ 2023 0100
//

import UIKit

enum AccountRowType: String, CaseIterable {
    case orders = "my orders"
    case accountInformation = "account information"
    case more = "more"
}

class AccountViewController: UIViewController {
    
    private var tableView: UITableView!
    private var rowItems = AccountRowType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "my information"
        self.tabBarItem.title = ""
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.setupView()
    }
    
    private func setupView() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white.withAlphaComponent(0.6)
        tableView.register(DataItemCell.self, forCellReuseIdentifier: DataItemCell.cellId)
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

extension AccountViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataItemCell.cellId, for: indexPath) as? DataItemCell
        else {
            return UITableViewCell()
        }
        
        let item = self.rowItems[indexPath.row]
        cell.configure(title: item.rawValue)
        return cell
    }
}

extension AccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
