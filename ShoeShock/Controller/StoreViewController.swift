//
//  StoreViewController.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

class StoreViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var shoes: [Shoe] = [
        Shoe(image: "shoe1.png", name: "Hi-Vis Pro Leather", price: 75.00, description: "Made famous by Julius “Dr. J” Erving, the Pro Leather was part of many game-changing moments. The first to blend high-flying style and performance. The first to take off from the free-throw line. Today, the silhouette has been upgraded for improved fit and function, as well as distinct off-court style. The Pro leather \"Hi-Vis\" features a neon color-pop Star Chevron and outsole, as well as glow-in-the-dark details.", addedToCart: false),
        Shoe(image: "shoe2.png", name: "Black Ice Pro Leather L2", price: 85.00, description: "In the '70s, the Pro Leather made a name for itself as one of the most iconic basketball shoes of all time, thanks to its game-making performance features and statement-making style. Today, we're updating the court legend for the streets with a stacked leather build, an exaggerated midsole, and a doubled-up tongue for added style.", addedToCart: false),
        Shoe(image: "shoe3.png", name: "Black Ice Pro Leather", price: 75.00, description: "Since its launch on the court in 1976, the Pro Leather has become a basketball icon, made famous by NBA heavy-hitter Dr. J. This edition is made for the streets, with improved fit and function, comfortable SmartFOAM cushioning, and translucent rubber details for a winter-ready look.", addedToCart: false),
        Shoe(image: "shoe4.png", name: "OG Pro Leather", price: 75.00, description: "Originally released in '76 and worn by NBA heavy-hitter Dr. J, the Pro Leather has a rich history in the game. We've updated the OG design for improved fit and function, creating an off-court sneaker that stays true to our hoops heritage.", addedToCart: false),
        Shoe(image: "shoe5.png", name: "Pro Leather", price: 45.97, description: "Originally released in '76 and worn by NBA heavy-hitter Dr. J, the Pro Leather has a rich history in the game. Retooled for everyday wear, this edition comes with comfy SmartFOAM cushioning and a tonal colorblocked design.", addedToCart: false),
        Shoe(image: "shoe6.png", name: "Heart of the City Chuck 70", price: 85.00, description: "A city emits electric energy. It’s diverse. A melting pot of culture, art, ideas, food, nightlife, architecture. But what makes it pulse? The noise? The lights? The skyline? That buzzer beater type hustle? Nah..it’s us. We’re the heart of this city. Inspired by the courts, street culture and nightlife of Shanghai.", addedToCart: false)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

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
        cell?.updateCell(shoe: shoe)
        
        return cell!
    }
}

