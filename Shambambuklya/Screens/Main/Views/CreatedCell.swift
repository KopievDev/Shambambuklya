//
//  CreatedCell.swift
//  Shambambuklya
//
//  Created by Ivan Kopiev on 18.02.2022.
//

import UIKit

class CreatedCell: TableViewCell {
    // MARK: - Properties
    let backView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let stateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Desk"
        return label
    }()
    
    let stateImageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    // MARK: - Life cycle
    override func setUp() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(backView)
        backView.addSubview(stateLabel)
        backView.addSubview(descLabel)
        backView.addSubview(stateImageView)
        createConstraints()
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            stateImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            stateImageView.widthAnchor.constraint(equalToConstant: 40),
            stateImageView.heightAnchor.constraint(equalToConstant: 40),
            stateImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
            stateImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            stateImageView.trailingAnchor.constraint(equalTo: stateLabel.leadingAnchor, constant: -16),
            
            stateLabel.topAnchor.constraint(equalTo: stateImageView.topAnchor),
            stateLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            
            descLabel.leadingAnchor.constraint(equalTo: stateLabel.leadingAnchor),
            descLabel.bottomAnchor.constraint(equalTo: stateImageView.bottomAnchor),
            descLabel.trailingAnchor.constraint(equalTo: stateLabel.trailingAnchor),
        ])
        descLabel.sizeToFit()
        stateLabel.sizeToFit()
    }
    
    override func render(data: [String : Any?]) {
        guard let type =  StateType(rawValue:data[s: Keys.type] ) else {return}
        stateLabel.text = type.title
        descLabel.text = type.desc
        stateImageView.image = UIImage(named: type.image)
    }
}

