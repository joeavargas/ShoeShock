//
//  CartViewController.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

class CartViewController: UIViewController, StepperValueChanged, RemoveShoeFromCartDelegate {
       
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLbl: UILabel!    
    @IBOutlet weak var purchaseBtn: UIButton!
    
    //MARK: Properties
    var selectedProduct = [Cart]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        purchaseBtn.layer.cornerRadius = 5
        
        if CartService.shared.cart.count == 0 {
            purchaseBtn.layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            purchaseBtn.isEnabled = false
        } else {
            purchaseBtn.layer.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            purchaseBtn.isEnabled = true
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        totalLbl.text = String(format: "$%.2f", CartService.shared.getSubtotal())
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCheckoutVC" {
            let checkOutViewController = segue.destination as! CheckoutViewController
            checkOutViewController.purchaseTotal = String(format: "$%.2f", CartService.shared.getSubtotal())
        }
    }
    
    func updateSubtotal(stepper: UIStepper) {
        totalLbl.text = String(format: "$%.2f", CartService.shared.getSubtotal())
    }
    
    //MARK: Implement delegate function from CartTableViewCell.swift to:
    // - remove shoe from products array of type SelectedProducts
    // - refresh tableview
    func removeShoeAt(stepper: UIStepper, shoe: Shoe) {
        CartService.shared.removeShoeFromCart(cartedShoe: shoe)
        
        if CartService.shared.cart.count == 0 {
            purchaseBtn.layer.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            purchaseBtn.isEnabled = false
        } else {
            purchaseBtn.layer.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            purchaseBtn.isEnabled = true
        }
        
        tableView.reloadData()
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartService.shared.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartTableViewCell
        //Fetch object to display
        let selectedShoe = CartService.shared.cart[indexPath.row]
                
        //Update cell / pass data over
        cell?.updateCell(sp: selectedShoe)
        cell?.selectedProduct = selectedShoe
        cell?.stepperValueChangedDelegate = self
        cell?.removeShoeFromCartDelegate = self
        return cell!
    }
}
