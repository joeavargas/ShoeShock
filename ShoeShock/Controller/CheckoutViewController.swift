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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // Empties out cart reverts back to StoreViewController
    @IBAction func backToRootViewControllerBtnPressed(_ sender: Any) {
        CartService.shared.restore()
    }
    

}
