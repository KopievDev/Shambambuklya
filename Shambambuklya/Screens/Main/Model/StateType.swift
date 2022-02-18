//
//  StateType.swift
//  Shambambuklya
//
//  Created by Ivan Kopiev on 18.02.2022.
//

import Foundation

enum StateType: String {
    
    case live, life, dead
    
    var title: String {
        switch self {
        case .live: return "Живая"
        case .life: return "Жизнь"
        case .dead: return "Мёртвая"
        }
    }
    
    var desc: String {
        switch self {
        case .live: return "и шевелится!"
        case .life: return "Ку-ку!"
        case .dead: return "или прикидывается"
        }
    }

    var image: String { rawValue + "_img"}
    
    static func getRandom() -> StateType {
        let isLive = Bool.random()
        return isLive ? .live : .dead
    }
    
}
