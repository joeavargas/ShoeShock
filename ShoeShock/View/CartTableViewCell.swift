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
    @IBOutlet weak var quantityStepper: UIStepper!
    
    
    //Properties
    var selectedProduct: SelectedProduct!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCell(sp: SelectedProduct){
        shoeImageView.image = imageFrom(imageName: sp.shoe.image)
        shoeNameLbl.text = sp.shoe.name
        let totalShoeAmountPrice = sp.shoe.price * Double(sp.quantity)
        shoePriceLbl.text = String(format: "$%.2f", totalShoeAmountPrice)
        
        //Configure UIStepper
        quantityStepper.addTarget(self, action: #selector(onStepperChanged(stepper:)), for: .valueChanged)
        quantityStepper.value = Double(sp.quantity)
        shoeQuantityLbl.text = "\(sp.quantity)"
    }
    
    @objc func onStepperChanged(stepper: UIStepper){
//        CartService.shared.increaseQuantity(cartedShoe: selectedProduct, quantityValue: stepper.value)
        shoeQuantityLbl.text = "\(Int(stepper.value))"
        self.selectedProduct.quantity = Int(stepper.value)
        self.selectedProduct.calculateTotal()
    }

}
