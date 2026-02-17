//
//  SessionManager.swift
//  Proyecto1
//
//  Created by Jonathan Ibarra on 15/2/26.
//

import Foundation

class SessionManager {
    
    
    let defaults = UserDefaults.standard
    
    func setFavorite(id: Int) {
        defaults.set(id, forKey: "favorite_horoscope")
    }
    
    func getFavorites() -> Int {
        defaults.integer(forKey: "favorite_horoscope")
    }
    
    func isFavorite(id: Int) -> Bool {
        id == getFavorites()
    }
}
