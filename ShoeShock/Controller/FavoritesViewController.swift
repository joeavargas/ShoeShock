//
//  FavoritesViewController.swift
//  ShoeShock
//
//  Created by Joe Vargas on 2/14/21.
//

import UIKit

class FavoritesViewController: UIViewController, RemoveShoeFromFavoritesDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties

    //MARK: App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    //MARK: Functions
    func removeShoeFromFavorites(button: UIButton, shoe: Shoe) {
        if button.tag == 2 {
            FavoriteService.shared.removeShoeFromFavorites(shoe: shoe)
            tableView.reloadData()
        }
    }

}
//MARK: - TableView Datasource and Delegate
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteService.shared.favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoritesTableViewCell
        
        let favoritedShoe = FavoriteService.shared.favorites[indexPath.row]
        cell?.updateCell(favoritedShoe: favoritedShoe)
        cell?.favoritedShoes = favoritedShoe
        cell?.removeShoeFromFavoritesDelegate = self
        
        return cell!
    }
    
    
}
