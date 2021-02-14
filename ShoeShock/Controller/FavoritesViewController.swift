//
//  FavoritesViewController.swift
//  ShoeShock
//
//  Created by Joe Vargas on 2/14/21.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties

    //MARK: App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Functions
    

}
//MARK: - TableView Datasource and Delegate
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        return cell
    }
    
    
}
