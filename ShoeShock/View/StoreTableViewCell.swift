//
//  StoreTableViewCell.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoeNameLbl: UILabel!
    @IBOutlet weak var shoePriceLbl: UILabel!
    @IBOutlet weak var isAddedToCartBtn: UIButton!
    
    

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
}
