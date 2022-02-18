//
//  Base.swift
//  Shambambuklya
//
//  Created by Ivan Kopiev on 18.02.2022.
//

import UIKit

class BaseVC: UIViewController {
    
    var stateView: State! { return self.view as? State }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {.portrait}
    override var shouldAutorotate: Bool {false}
    override var prefersStatusBarHidden: Bool {true}
    
    private var _state : [String: Any] = [:]
    public var state : [String: Any] {
        get { _state}
        set {
            _state = newValue
            stateView.state = newValue
            stateView.render()
        }
    }
    
    @objc func returnFromVC() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil);
        }
    }
    
    func setUpNavigationBar(title: String, withHideBar: Bool) {
        let tltLabel = UILabel()
        tltLabel.attributedText = title.add(attributs: (UIFont.boldSystemFont(ofSize: 22), UIColor.white))
        tltLabel.sizeToFit()
        navigationItem.titleView = tltLabel
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = Theme.buttonColor
        navigationController?.hidesBarsOnSwipe = withHideBar
    }
}

extension String {
    func add(attributs params: (UIFont, UIColor)) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
            attributedString.append(
                NSMutableAttributedString(string: self,
                                          attributes:
                                            [NSAttributedString.Key.font :params.0,
                                             NSAttributedString.Key.foregroundColor : params.1]))
        return attributedString
    }
}
