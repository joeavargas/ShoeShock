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
        
        //Delegate when the stepper is tapped(changing the quantity of shoes and recalculating) and update the total cost in CartVC
        delegate?.updateSubtotal(stepper: quantityStepper)

        print("Stepper value is \(quantityStepper.value) and shoe quantity is \(selectedProduct.quantity)")
    }
}
