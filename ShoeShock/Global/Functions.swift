//
//  Functions.swift
//  ShoeShock
//
//  Created by Joe Vargas on 1/13/21.
//

import Foundation
import UIKit

//Returns shoe image from assets by way of string name
func imageFrom(imageName: String) -> UIImage{
    var image: UIImage?
    if imageName != "" {
        image = UIImage(named: imageName)!
    }
    return image!
}
