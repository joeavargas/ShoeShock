//
//  CartService.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import Foundation

class CartService {
    
    static let shared = CartService()
    var cart = [Cart]()
    
    func getCartedShoes() -> [Cart] {
        return cart
    }
    
    // Adds shoe to products:[SelectedProducts]
    func addShoe(shoe: Shoe) {
        let selectedProduct = Cart(shoe: shoe, quantity: 1, totalCost: shoe.price)
        shoe.addedToCart = true
        cart.append(selectedProduct)
        print("\(shoe.name) added to cart. There are \(cart.count) pair(s) of shoes in the cart")
    }
    
    //Removes shoe from cart when quantity reaches 0
    func removeShoeFromCart(cartedShoe: Shoe){
        let removedShoe = Cart(shoe: cartedShoe, quantity: 0, totalCost: cartedShoe.price)
        removedShoe.shoe.addedToCart = false
//        print("\(removedShoe.shoe.name) is now \(removedShoe.shoe.addedToCart)")
        if let index = cart.firstIndex(of: removedShoe){
            cart.remove(at: index)
        }
        print("\(cartedShoe.name) has been removed from the cart. There are \(cart.count) pair(s) of shoes in the cart")
    }
    
    // Cycles through products[SelectedProducts] and returns the total price of all products
    func getSubtotal() -> Double {
        var total = 0.0
        for x in 0..<cart.count {
            total += cart[x].totalCost
        }
        return total
    }
    
    // Sets addToCart property to false for all shoes in the cart then empties out the cart to revert back to original state
    func restore(){
        for shoe in cart{
            shoe.shoe.addedToCart = false
        }
        cart.removeAll()
    }
}
