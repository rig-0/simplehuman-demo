//
//  DataItemCell.swift
//  ©️ 2023 0100
//

import UIKit

class DataItemCell: UITableViewCell {
    
    static let cellId = String(describing: DataItemCell.self)
    
    private var labelView: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .black
        self.backgroundColor = .black
        self.selectionStyle = .none
        
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 25).isActive = true
//        label.bott.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        label.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.labelView = label
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(title: String) {
        self.labelView.text = title
    }
}

