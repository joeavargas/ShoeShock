//
//  CheckoutViewController.swift
//  ShoeShock
//
//  Created by Joe Vargas on 2/17/21.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var purchaseTotalLbl: UILabel!
    
    //MARK: Properties
    var purchaseTotal = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        purchaseTotalLbl.text = purchaseTotal
    }
    
    // Empties out cart reverts back to StoreViewController
    @IBAction func backToRootViewControllerBtnPressed(_ sender: Any) {
        CartService.shared.restore()
    }
    

}
