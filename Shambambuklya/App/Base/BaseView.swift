//
//  BaseView.swift
//  Shambambuklya
//
//  Created by Ivan Kopiev on 18.02.2022.
//

import UIKit

protocol State: UIView {
    var state: [String: Any] {get set}
    func render()
}

class BaseView: UIView, State {
    //MARK: - Properies
    var state: [String : Any] = [:]
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    ///Первоначальная настройка интерфейса
    func setUp() {}
    
    ///Вызывается при изменении переменной `state`
    func render() {}

}

extension UIButton {
    
    @objc public func animateIn(view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    @objc public func animateOut(view viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn) {
            viewToAnimate.transform = .identity
        }
    }
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateIn(view:)), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateOut(view:)), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

}
