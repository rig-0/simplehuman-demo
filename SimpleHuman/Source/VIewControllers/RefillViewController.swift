//
//  RefillViewController.swift
//  ©️ 2023 0100
//

import UIKit

enum RefillType: String, CaseIterable {
    case trashLiners = "trash liners"
    case handSoap = "hand soap"
    case dishSoap = "dish soap"
    case odorsorbPods = "odorsorb pods"
    case cleaningTablets = "cleaning tablets"
    case paperTowels = "paper towels"
    case handSanitizer = "hand sanitizer"
}

class RefillViewController: UIViewController {
    
    private var tableView: UITableView!
    private var refillTypes = RefillType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "refill+"
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

extension RefillViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.refillTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataItemCell.cellId, for: indexPath) as? DataItemCell
        else {
            return UITableViewCell()
        }
        
        let item = self.refillTypes[indexPath.row]
        cell.configure(title: item.rawValue)
        return cell
    }
}

extension RefillViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
