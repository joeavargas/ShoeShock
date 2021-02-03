//
//  Shoe.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import Foundation

struct Shoe {
    
    var image: String
    var name: String
    var price: Double
    var description: String
    var addedToCart: Bool
    var addedToFavorites: Bool
    
    init(image: String, name: String, price: Double, description: String, addedToCart: Bool, addedToFavorites: Bool){
        self.image = image
        self.name = name
        self.price = price
        self.description = description
        self.addedToCart = addedToCart
        self.addedToFavorites = addedToFavorites
    }
}

class ShoesInCart: Equatable {
    static func == (lhs: ShoesInCart, rhs: ShoesInCart) -> Bool {
        return lhs.shoe.name == rhs.shoe.name
    }
    
    var shoe: Shoe
    var quantity = 0
    var totalCost = 0.0
    
    init(shoe: Shoe, quantity: Int, totalCost: Double){
        self.shoe = shoe
        self.quantity = quantity
        self.totalCost = totalCost
    }
    
    func calculateTotal(){
        totalCost = shoe.price * Double(quantity)
    }
}
