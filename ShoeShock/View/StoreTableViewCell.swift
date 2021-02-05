//
//  StoreTableViewCell.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

protocol StoreCellDelegate {
    func didIsAddedBtnPressed(button: UIButton, shoe: Shoe)
}

class StoreTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoeNameLbl: UILabel!
    @IBOutlet weak var shoePriceLbl: UILabel!
    @IBOutlet weak var isAddedToCartBtn: UIButton!
    @IBOutlet weak var isAddedToFavoritesBtn: UIButton!
    
    var delegate: StoreCellDelegate?
    var shoe: Shoe!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    //MARK: Cell Init
    func updateCell(shoe:Shoe){
        shoeImageView.image = imageFrom(imageName: shoe.image)
        shoeNameLbl.text = shoe.name
        shoePriceLbl.text = String(format: "$%.2f", shoe.price)
        
        switch shoe.addedToCart {
        case true:
            //MARK: If the shoe is in the cart, configure the button like so:
            //adjust corner radius
            isAddedToCartBtn.layer.cornerRadius = 5
            //btn bg color to green
            isAddedToCartBtn.layer.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            //btn text = "Added"
            isAddedToCartBtn.setTitle("Added!", for: .normal)
            //btn font color = white
            isAddedToCartBtn.setTitleColor(UIColor.white, for: .normal)
            //btn font size = 12
            isAddedToCartBtn.titleLabel?.font = UIFont(name: "Avenir Next", size: 12)
        case false:
            //MARK: If the shoe is NOT in the cart, configure the button like so:
            //adjust corner radius
            isAddedToCartBtn.layer.cornerRadius = 5
            //btn bg color to pink
            isAddedToCartBtn.layer.backgroundColor = #colorLiteral(red: 0.8498285413, green: 0.224113524, blue: 0.443239212, alpha: 1)
            //btn text = Add to Cart
            isAddedToCartBtn.setTitle("Add", for: .normal)
            //btn font color = white
            isAddedToCartBtn.setTitleColor(UIColor.white, for: .normal)
            //btn font size = 12
            isAddedToCartBtn.titleLabel?.font = UIFont(name: "Avenir Next", size: 12)
        }
    }
    
    @IBAction func addToCartBtnTapped(_ sender: Any) {
        updateAddedToCartBtnPressedStatus()
    }
    
    //MARK: - Functions
    
    func updateAddedToCartBtnPressedStatus(){
        
        switch shoe.addedToCart {
        
        //MARK: - When a shoe is in the cart, remove it from cart
        case true:
            shoe.addedToCart = false

            //Remove shoe from the cart
            CartService.shared.removeShoeFromCart(cartedShoe: shoe)
            
            //Update button's selected status to true
            isAddedToCartBtn.isSelected = true
            
            //Update the button UI state
            updateCell(shoe: shoe)
            print("\(shoe.name) addedToCart value is \(shoe.addedToCart)")
            
        //MARK: - When a shoe is NOT in the cart, add it to the cart
        case false:
            shoe.addedToCart = true

            //Update button's selected status to true
            isAddedToCartBtn.isSelected = true
            
            //Update the button UI state
            updateCell(shoe: shoe)
            //StoreCellDelegate will inform StoreVC which cell's button is selected so it can
            delegate?.didIsAddedBtnPressed(button: isAddedToCartBtn, shoe: shoe)
            
            print("\(shoe.name) addedToCart value is \(shoe.addedToCart)")
        }
    }
}
