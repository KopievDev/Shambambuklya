//
//  TableViewCell.swift
//  Shambambuklya
//
//  Created by Ivan Kopiev on 18.02.2022.
//

import UIKit

protocol ReusebleCell {
    var data: [String:Any?] { get set }
    func render(data: [String:Any?])
}

class TableViewCell: UITableViewCell, ReusebleCell {
    //MARK: - Properies
    var data: [String : Any?] = [:]
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    
    func render(data: [String : Any?]) {}
    
    // MARK: - Helpers
    func setUp() {}

}
