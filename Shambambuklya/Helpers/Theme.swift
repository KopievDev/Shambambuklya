//
//  Theme.swift
//  Shambambuklya
//
//  Created by Ivan Kopiev on 18.02.2022.
//

import UIKit

enum Screen {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

enum Theme {
    static let textColor: UIColor = UIColor(red: 50, green: 54, blue: 83)
    static let backgroundColor: UIColor = UIColor(red: 245, green: 246, blue: 247)
    static let selectedColor: UIColor = UIColor(red: 126, green: 139, blue: 277)
    static let buttonColor: UIColor = UIColor(red: 90, green: 52, blue: 114)
}

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
