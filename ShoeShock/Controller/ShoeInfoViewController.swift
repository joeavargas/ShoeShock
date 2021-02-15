//
//  ShoeInfoViewController.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import UIKit

class ShoeInfoViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var shoeNameLbl: UILabel!
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoePriceLbl: UILabel!
    @IBOutlet weak var shoeInfoTextView: UITextView!
    @IBOutlet weak var addToCartBtn: UIButton!

    //Properties
    var shoe: Shoe!

    override func viewDidLoad() {
        super.viewDidLoad()
        addToCartBtn.layer.cornerRadius = 5.0
        if let shoe = shoe {
            shoeNameLbl.text = shoe.name
            shoeImageView.image = imageFrom(imageName: shoe.image)
            shoePriceLbl.text = String(format: "$%.2f", shoe.price)
            shoeInfoTextView.text = shoe.description
            
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func addToCartBtnTapped(_ sender: UIButton) {
        
        if shoe.addedToCart == false {
            shoe.addedToCart = true
            addToCartBtn.layer.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            addToCartBtn.setTitle("Added!", for: .normal)
            addToCartBtn.setTitleColor(UIColor.white, for: .normal)
            addToCartBtn.titleLabel?.font = UIFont(name: "Avenir Next", size: 17)
            print("Shoe is now \(shoe.addedToCart)")
        } else {
            shoe.addedToCart = false
            addToCartBtn.layer.backgroundColor = #colorLiteral(red: 0.8498285413, green: 0.224113524, blue: 0.443239212, alpha: 1)
            addToCartBtn.setTitle("Add to Cart", for: .normal)
            addToCartBtn.setTitleColor(UIColor.white, for: .normal)
            addToCartBtn.titleLabel?.font = UIFont(name: "Avenir Next", size: 17)
            print("Shoe is now \(shoe.addedToCart)")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "dismissUnwind" else {return}
        
        let shoeImage = shoe.image
        let shoeName = shoe.name
        let shoePrice = shoe.price
        let shoeInfo = shoe.description
        let shoeCartStatus = shoe.addedToCart
        let shoeFavoritesStatus = shoe.addedToFavorites
        
        shoe = Shoe(image: shoeImage, name: shoeName, price: shoePrice, description: shoeInfo, addedToCart: shoeCartStatus, addedToFavorites: shoeFavoritesStatus)
    }
    
    @IBAction func dismissBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
