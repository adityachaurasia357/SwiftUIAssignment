//
//  UserDefaultsManager.swift
//  SwiftUIAssignment
//
//  Created by Aditya Chaurasia on 03/10/25.
//

import Foundation

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let favoritesKey = "favoritePostIDs"
    
    private init() {}
    
    func getFavorites() -> Set<Int> {
        let ids = UserDefaults.standard.array(forKey: favoritesKey) as? [Int] ?? []
        return Set(ids)
    }
    
    func saveFavorites(_ ids: Set<Int>) {
        UserDefaults.standard.set(Array(ids), forKey: favoritesKey)
    }
    
    func addFavorite(id: Int) {
        var favorites = getFavorites()
        favorites.insert(id)
        saveFavorites(favorites)
    }
    
    func removeFavorite(id: Int) {
        var favorites = getFavorites()
        favorites.remove(id)
        saveFavorites(favorites)
    }
    
    func isFavorite(id: Int) -> Bool {
        getFavorites().contains(id)
    }
}
