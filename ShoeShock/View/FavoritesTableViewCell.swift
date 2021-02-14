//
//  FavoritesTableViewCell.swift
//  ShoeShock
//
//  Created by Joe Vargas on 2/14/21.
//

import UIKit

protocol RemoveShoeFromFavoritesDelegate {
    func removeShoeFromFavorites(button: UIButton, shoe: Shoe)
}

class FavoritesTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoeNameLbl: UILabel!
    @IBOutlet weak var shoePriceLbl: UILabel!
    @IBOutlet weak var removeBtn: UIButton!
    
    
    
    //MARK: Properties
    var favoritedShoes: Favorited!
    var removeShoeFromFavoritesDelegate: RemoveShoeFromFavoritesDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: Cell Init
    func updateCell(favoritedShoe: Favorited){
        shoeImageView.image = imageFrom(imageName: favoritedShoe.shoe.image)
        shoeNameLbl.text = favoritedShoe.shoe.name
        shoePriceLbl.text = String(format: "$%.2f", favoritedShoe.shoe.price)
    }
    
    
    
    //MARK: IBActions
    @IBAction func removeBtnTapped(_ sender: Any) {
        removeShoeFromFavoritesDelegate.removeShoeFromFavorites(button: removeBtn, shoe: favoritedShoes.shoe)
        
        
    }
    
}
