//
//  CartTableViewCell.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

protocol StepperValueChanged {
    func updateSubtotal(stepper: UIStepper)
}

protocol RemoveCellAndShoeFromCart{
    func removeShoeAt(stepper: UIStepper, shoe: Shoe)
}

class CartTableViewCell: UITableViewCell {
    
    //IBOutlets
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoeNameLbl: UILabel!
    @IBOutlet weak var shoePriceLbl: UILabel!
    @IBOutlet weak var shoeQuantityLbl: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    
    //Properties
    var selectedProduct: SelectedProduct!
    var delegate: StepperValueChanged!
    var removeCellAndShoeFromCartDelegate: RemoveCellAndShoeFromCart!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCell(sp: SelectedProduct){
        shoeImageView.image = imageFrom(imageName: sp.shoe.image)
        shoeNameLbl.text = sp.shoe.name
        shoePriceLbl.text = String(format: "$%.2f", sp.totalCost)
        
        //Configure UIStepper
        quantityStepper.value = Double(sp.quantity)
        shoeQuantityLbl.text = "\(sp.quantity)"
    }
    @IBAction func onStepperTapped(_ sender: Any) {
        //Update the quantity label to the stepper value
        self.shoeQuantityLbl.text = "\(Int(quantityStepper.value))"
        
        //Update the selected shoe quantity to the stepper value
        self.selectedProduct.quantity = Int(quantityStepper.value)
        
        //Return the total cost of shoe quantity * shoe price
        self.selectedProduct.calculateTotal()
        
        //Display the returned total cost
        shoePriceLbl.text = String(format: "$%.2f", selectedProduct.totalCost)
        
        //When the shoe quantity = 0, ID the shoe and let CartVC know.
        if quantityStepper.value == 0 {
            removeCellAndShoeFromCartDelegate.removeShoeAt(stepper: quantityStepper, shoe: selectedProduct.shoe)
            print("CartService has been asked to remove \(selectedProduct.shoe.name) from the cart")
        }
        
        //Delegate when the stepper is tapped(changing the quantity of shoes and recalculating) and update the total cost in CartVC
        delegate?.updateSubtotal(stepper: quantityStepper)

    }
}
