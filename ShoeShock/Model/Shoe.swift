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
    
    init(image: String, name: String, price: Double, description: String, addedToCart: Bool){
        self.image = image
        self.name = name
        self.price = price
        self.description = description
        self.addedToCart = addedToCart
    }
}
