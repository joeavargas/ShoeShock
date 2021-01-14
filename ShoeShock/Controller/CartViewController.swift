//
//  CartViewController.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

class CartViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var purchaseBtn: UIButton!
    
    
    //MARK: Properties
    var selectedProduct = [SelectedProduct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        totalLbl.text = String(format: "$%.2f", CartService.shared.getSubtotal())

        // Do any additional setup after loading the view.
    }
    

    @IBAction func purchaseBtnTapped(_ sender: Any) {
    }
    

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CartService.shared.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartTableViewCell
        //Fetch object to display
        let selectedShoe = CartService.shared.products[indexPath.row]
        
        //Update cell / pass data over
        cell?.updateCell(sp: selectedShoe)
        cell?.selectedProduct = selectedShoe
        return cell!
    }
    
    
}
