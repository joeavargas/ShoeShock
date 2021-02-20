//
//  FavoriteService.swift
//  ShoeShock
//
//  Created by Joe Vargas on 2/14/21.
//

import Foundation

class FavoriteService{
    
    static let shared = FavoriteService()
    var favorites = [Favorited]()
    
    func getFavorites() -> [Favorited]{
        return favorites
    }
    
    // Add shoe to favorites list
    func addShoeToFavorites(shoe: Shoe) {
        let favoritedShoe = Favorited(shoe: shoe)
        favorites.append(favoritedShoe)
    }
    
    // Removes shoe from favorites list
    func removeShoeFromFavorites(shoe: Shoe) {
        let removedShoe = Favorited(shoe: shoe)
        removedShoe.shoe.addedToFavorites = false
        
        if let index = favorites.firstIndex(of: removedShoe){
            favorites.remove(at: index)
        }
    }
}
