//
//  MainVC.swift
//  Shambambuklya
//
//  Created by Ivan Kopiev on 18.02.2022.
//

import UIKit

class MainVC: BaseVC {
    //MARK: - Properties
    let v = MainView()
    
    //MARK: - Life cycle
    override func loadView() {view = v}
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        setUpNavigationBar(title: "Клеточное наполнение", withHideBar: true)
        setActions()
    }
    
    func setActions() {
        v.setTargets(for: .createButton, action: #selector(didTapOn(button:)))
    }
    
    // MARK: - Selectors
    @objc func didTapOn(button: UIButton) {
        let type = StateType.getRandom()
        state[ad: Keys.cells].append([Keys.type: type.rawValue])
        check(type: type)
        
    }
    
    // MARK: - Helpers
    func check(type: StateType) {
        switch type {
        case .live:
            state[i: Keys.countLive] += 1
            state[i: Keys.countDead] = 0
            if state[i: Keys.countLive] == 3 {
                state[ad: Keys.cells].append([Keys.type: StateType.life.rawValue])
                Speaker.say(text: "Ку-ку!")
                state[i: Keys.countLive] = 0
            }
        case .dead:
            state[i: Keys.countDead] += 1
            state[i: Keys.countLive] = 0
            if state[i: Keys.countDead] == 3 {
                removeLastLive()
                state[i: Keys.countDead] = 0
            }
        case .life: break
        }
    }
    
    func removeLastLive() {
        if let index = state[ad: Keys.cells].lastIndex(where: { $0[s: Keys.type] == StateType.life.rawValue}) {
            state[ad: Keys.cells].remove(at: index)
            Speaker.say(text: "Он нет! Они убили Кенни!")
            showCountLived()
        }
    }
    
    func showCountLived() {
        let countLived = state[ad: Keys.cells].filter { $0[s: Keys.type] == StateType.life.rawValue}.count
        if countLived == 0 {
            Notify.showWith(title: "Убили последнего")
        } else {
            Notify.showWith(title: "Ещё осталось \(countLived) \(countLived.russianPlural(form1: "жизнь", form2: "жизни", form5: "жизней"))")

        }
    }
}




