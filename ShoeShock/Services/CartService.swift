//
//  CartService.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import Foundation

class CartService {
    
    static let shared = CartService()
    var shoesInCart = [ShoesInCart]()
    
    func getCartedShoes() -> [ShoesInCart] {
        return shoesInCart
    }
    
    // Adds shoe to products:[SelectedProducts]
    func addShoe(shoe: Shoe) {
        let selectedProduct = ShoesInCart(shoe: shoe, quantity: 1, totalCost: shoe.price)
        shoesInCart.append(selectedProduct)
        print("\(shoe.name) added to cart. There are \(shoesInCart.count) in the Selected Products")
    }
    
    //Removes shoe from cart when quantity reaches 0
    func removeShoeFromCart(cartedShoe: Shoe){
        let removedShoe = ShoesInCart(shoe: cartedShoe, quantity: 0, totalCost: cartedShoe.price)
        removedShoe.shoe.addedToCart = false
        print("\(removedShoe.shoe.name) is now \(removedShoe.shoe.addedToCart)")
        if let index = shoesInCart.firstIndex(of: removedShoe){
            shoesInCart.remove(at: index)
        }
        print("\(cartedShoe.name) has been removed from the cart")
    }
    
    // Cycles through products[SelectedProducts] and returns the total price of all products
    func getSubtotal() -> Double {
        var total = 0.0
        for x in 0..<shoesInCart.count {
            total += shoesInCart[x].totalCost
        }
        return total
    }
}
