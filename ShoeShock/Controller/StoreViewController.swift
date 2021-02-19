//
//  StoreViewController.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

class StoreViewController: UIViewController, AddToCartButtonPressedDelegate, AddToFavoritesButtonPressedDelegate {
    
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var shoes = Shoe.shoeDB
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toShoeInfoVC" {
             let indexPath = tableView.indexPathForSelectedRow!
             let shoe = shoes[indexPath.row]
             let navController = segue.destination as! UINavigationController
             let shoeInfoVC = navController.topViewController as! ShoeInfoViewController
             
            shoeInfoVC.shoe = shoe
         }
     }
    
    @IBAction func unwindToStoreViewController(segue: UIStoryboardSegue){
        guard segue.identifier == "dismissUnwind" else {return}
        
        let sourceViewController = segue.source as! ShoeInfoViewController
        
        if let shoe = sourceViewController.shoe{
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                shoes[selectedIndexPath.row] = shoe
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
        }
    }
    
    // MARK: - StoreCell Delegate
    func addToCartButtonPressed(button: UIButton, shoe: Shoe) {
        if button.tag == 0 {
            // if addToCart = true, add shoe to cart
            if shoe.addedToCart {
                CartService.shared.addShoe(shoe: shoe)
            // else, remove from cart
            } else {
                CartService.shared.removeShoeFromCart(cartedShoe: shoe)
            }
        }
    }
    
    func addToFavoritesButtonPressed(button: UIButton, shoe: Shoe) {
        if button.tag == 1 {
            if shoe.addedToFavorites{
                FavoriteService.shared.addShoeToFavorites(shoe: shoe)
            } else {
                FavoriteService.shared.removeShoeFromFavorites(shoe: shoe)
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
        cell?.addToCartButtonPressedDelegate = self
        cell?.addToFavoritesButtonPressedDelegate = self
        cell?.updateCell(shoe: shoe)
        cell?.shoe = shoe
        
        return cell!
    }
}

