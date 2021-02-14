//
//  Shoe.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import Foundation

class Shoe {
    
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
    
    static var shoeDB: [Shoe] = [
        Shoe(image: "shoe1.png", name: "Hi-Vis Pro Leather", price: 75.00, description: "Made famous by Julius “Dr. J” Erving, the Pro Leather was part of many game-changing moments. The first to blend high-flying style and performance. The first to take off from the free-throw line. Today, the silhouette has been upgraded for improved fit and function, as well as distinct off-court style. The Pro leather \"Hi-Vis\" features a neon color-pop Star Chevron and outsole, as well as glow-in-the-dark details.", addedToCart: false, addedToFavorites: false),
        Shoe(image: "shoe2.png", name: "Black Ice Pro Leather L2", price: 85.00, description: "In the '70s, the Pro Leather made a name for itself as one of the most iconic basketball shoes of all time, thanks to its game-making performance features and statement-making style. Today, we're updating the court legend for the streets with a stacked leather build, an exaggerated midsole, and a doubled-up tongue for added style.", addedToCart: false, addedToFavorites: false),
        Shoe(image: "shoe3.png", name: "Black Ice Pro Leather", price: 75.00, description: "Since its launch on the court in 1976, the Pro Leather has become a basketball icon, made famous by NBA heavy-hitter Dr. J. This edition is made for the streets, with improved fit and function, comfortable SmartFOAM cushioning, and translucent rubber details for a winter-ready look.", addedToCart: false, addedToFavorites: false),
        Shoe(image: "shoe4.png", name: "OG Pro Leather", price: 75.00, description: "Originally released in '76 and worn by NBA heavy-hitter Dr. J, the Pro Leather has a rich history in the game. We've updated the OG design for improved fit and function, creating an off-court sneaker that stays true to our hoops heritage.", addedToCart: false, addedToFavorites: false),
        Shoe(image: "shoe5.png", name: "Pro Leather", price: 45.97, description: "Originally released in '76 and worn by NBA heavy-hitter Dr. J, the Pro Leather has a rich history in the game. Retooled for everyday wear, this edition comes with comfy SmartFOAM cushioning and a tonal colorblocked design.", addedToCart: false, addedToFavorites: false),
        Shoe(image: "shoe6.png", name: "Heart of the City Chuck 70", price: 85.00, description: "A city emits electric energy. It’s diverse. A melting pot of culture, art, ideas, food, nightlife, architecture. But what makes it pulse? The noise? The lights? The skyline? That buzzer beater type hustle? Nah..it’s us. We’re the heart of this city. Inspired by the courts, street culture and nightlife of Shanghai.", addedToCart: false, addedToFavorites: false)
    ]
}

class Cart: Equatable {
    static func == (lhs: Cart, rhs: Cart) -> Bool {
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

class Favorited: Equatable {
    var shoe: Shoe
    
    init(shoe: Shoe) {
        self.shoe = shoe
    }
    
    static func == (lhs: Favorited, rhs: Favorited) -> Bool {
        return lhs.shoe.name == rhs.shoe.name
    }
    
}
