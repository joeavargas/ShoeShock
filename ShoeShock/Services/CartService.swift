//
//  CartService.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import Foundation

class CartService {
    
    static let shared = CartService()
    var products = [SelectedProduct]()
    
    func getCartedShoes() -> [SelectedProduct] {
        return products
    }
    
    // Adds shoe to products:[SelectedProducts]
    func addShoe(shoe: Shoe) {
        let selectedProduct = SelectedProduct(shoe: shoe, quantity: 1, totalCost: shoe.price)
        products.append(selectedProduct)
        print("\(shoe.name) added to cart. There are \(products.count) in the Selected Products")
    }
    
    //Removes shoe from cart when quantity reaches 0
    func removeShoeFromCart(cartedShoe: Shoe){
        let removedShoe = SelectedProduct(shoe: cartedShoe, quantity: 0, totalCost: cartedShoe.price)
        if let index = products.firstIndex(of: removedShoe){
            products.remove(at: index)
        }
        print("\(cartedShoe.name) has been removed from the cart")
    }
    
    // Cycles through products[SelectedProducts] and returns the total price of all products
    func getSubtotal() -> Double {
        var total = 0.0
        for x in 0..<products.count {
            total += products[x].totalCost
        }
        return total
    }
}
