//
//  StoreTableViewCell.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

protocol StoreCellDelegate {
    func didIsAddedBtnPressed(button: UIButton)
}

class StoreTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoeNameLbl: UILabel!
    @IBOutlet weak var shoePriceLbl: UILabel!
    @IBOutlet weak var isAddedToCartBtn: UIButton!
    
    var delegate: StoreCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: Cell Init
    func updateCell(shoe: Shoe){
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
            //Update button'ss selected status to true
            isAddedToCartBtn.isSelected = true
            //Inform the delegate which cell's button is selected so it can inform StoreVC
            delegate?.didIsAddedBtnPressed(button: isAddedToCartBtn)
        } else { // if liked / true
            // Update the the button's image to an unfilled heart
            isAddedToCartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    
}
