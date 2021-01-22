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
        
        if shoe.addedToCart == false {
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
        } else {
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
        }
    }
    
    @IBAction func addToCartBtnTapped(_ sender: Any) {
        //if unliked / false
        if isAddedToCartBtn.currentImage == UIImage(systemName: "heart"){
            //Change image to heart-fill
            isAddedToCartBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            //Update button's selected status to true
            isAddedToCartBtn.isSelected = true
            
            //StoreCellDelegate will inform StoreVC which cell's button is selected so it can
            delegate?.didIsAddedBtnPressed(button: isAddedToCartBtn, shoe: shoe)
            
        } else { // if liked / true
            
            // Update the the button's image to an unfilled heart
            isAddedToCartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }

}
