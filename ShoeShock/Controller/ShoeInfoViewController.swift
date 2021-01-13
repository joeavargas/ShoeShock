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
    
    @IBAction func dismissBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
