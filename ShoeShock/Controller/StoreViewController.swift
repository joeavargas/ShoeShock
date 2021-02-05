//
//  StoreViewController.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

class StoreViewController: UIViewController, StoreCellDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var shoes = Shoe.shoeDB
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toShoeInfoVC" {
             let indexPath = tableView.indexPathForSelectedRow!
             let shoe = shoes[indexPath.row]
             let navController = segue.destination as! UINavigationController
             let shoeInfoVC = navController.topViewController as! ShoeInfoViewController
             
            shoeInfoVC.shoe = shoe
         } //TODO: assign a segue to CartVC, pass shoe data over. See if an 'unwind' segue can be added to pass back shoe info back
     }
    
    // MARK: - StoreCell Delegate
    func didIsAddedBtnPressed(button: UIButton, shoe: Shoe) {
        if button.isSelected{
            //CartService.shared.addShoe(shoe: shoe)
            if shoe.addedToCart {
                CartService.shared.addShoe(shoe: shoe)
            } else {
                CartService.shared.removeShoeFromCart(cartedShoe: shoe)
            }
        }
    }
}

extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as? StoreTableViewCell
        //Fetch model object to display
        let shoe = shoes[indexPath.row]
        
        //Configure cell
        cell?.delegate = self
        cell?.updateCell(shoe: shoe)
        cell?.shoe = shoe
        
        return cell!
    }
}

