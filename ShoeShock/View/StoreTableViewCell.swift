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
            isAddedToCartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            isAddedToCartBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
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
