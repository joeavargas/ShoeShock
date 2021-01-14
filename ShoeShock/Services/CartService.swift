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
    
    // Adds shoe to products:[SelectedProducts]
    func addShoe(shoe: Shoe) {
        let selectedProduct = SelectedProduct(shoe: shoe, quantity: 1, totalCost: shoe.price)
        products.append(selectedProduct)
        print("\(shoe.name) added to cart. There are \(products.count) in the Selected Products")
    }
    
    // Cycles through products[SelectedProducts] and returns the total price of all products
    func getSubtotal() -> Double {
        var total = 0.0
        for x in 0..<products.count {
            total += products[x].totalCost
        }
        print("Total cost of all \(products.count) pairs of shoes is \(total)")
        return total
    }
}
