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
    
    func addShoeToFavorites(shoe: Shoe) {
        let favoritedShoe = Favorited(shoe: shoe)
        favorites.append(favoritedShoe)
        
        print("\(shoe.name) added to favorites. There are \(favorites.count) shoes in Favorites")
    }
    
    func removeShoeFromFavorites(shoe: Shoe) {
        let removedShoe = Favorited(shoe: shoe)
        removedShoe.shoe.addedToFavorites = false
        
        if let index = favorites.firstIndex(of: removedShoe){
            favorites.remove(at: index)
        }
        
        print("\(shoe.name) has been removed from Favorites. There are \(favorites.count) shoes in Favorites")
    }
}
