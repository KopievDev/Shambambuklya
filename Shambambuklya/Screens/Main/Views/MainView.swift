//
//  MainView.swift
//  Shambambuklya
//
//  Created by Ivan Kopiev on 18.02.2022.
//

import UIKit

class MainView: BaseView {
    // MARK: - Properties
    enum Interface {case createButton}
    
    var cells: [[String: Any?]]  {state[ad: Keys.cells] }
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = Theme.backgroundColor
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(CreatedCell.self, forCellReuseIdentifier: CreatedCell.description())
        tv.showsVerticalScrollIndicator = false
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.dataSource = self
        return tv
    }()
    
    let createButton: UIButton = {
        let but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        but.setTitle("СОТВОРИТЬ", for: .normal)
        but.setTitleColor(.white, for: .normal)
        but.backgroundColor = Theme.buttonColor
        but.layer.cornerRadius = 4
        but.startAnimatingPressActions()
        return but
    }()
    
    let gradient: CAGradientLayer =  {
        let layer = CAGradientLayer()
        layer.colors = [Theme.buttonColor.cgColor, UIColor.black.cgColor]
        return layer
    }()
    // MARK: - Life cycle
    override func setUp() {
        layer.addSublayer(gradient)
        addSubview(tableView)
        addSubview(createButton)
        createConstraints()
    }
    
    override func layoutSubviews() {
        gradient.frame = frame
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            createButton.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            createButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25),
            createButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.92),
            createButton.heightAnchor.constraint(equalTo: createButton.widthAnchor, multiplier: 0.12),
            createButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    override func render() {
        tableView.reloadData()
        let indexPath = IndexPath(row: cells.count-1, section: 0)
        guard cells.count - 1 >= 0 else {return}
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }
    
    public func setTargets(for type: MainView.Interface,
                           target: Any? = self,
                           action: Selector,
                           for controlEvents: UIControl.Event = .touchUpInside) {
        switch type {
        case .createButton: createButton.addTarget(target, action: action, for: controlEvents)
        }
    }
}
// MARK: - UITableViewDataSource
extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CreatedCell.description(), for: indexPath) as? CreatedCell
        let data = cells[indexPath.row]
        cell?.render(data: data)
        return cell ?? UITableViewCell()
    }
}
