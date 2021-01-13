//
//  CartTableViewCell.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    //IBOutlets
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoeNameLbl: UILabel!
    @IBOutlet weak var shoePriceLbl: UILabel!
    @IBOutlet weak var shoeQuantityLbl: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    //Properties

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
