//
//  RestaurantListTableViewCell.swift
//  FirstRoundTest
//
//  Created by Caston  Boyd on 7/8/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

class RestaurantListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    
    var nameOfRestaurant: String? {
        didSet {
            updateViews()
        }
    }
    var addressOfRestaurant: String? 
    
    
    
    func updateViews() {
        guard let addressRestaurant = addressOfRestaurant else { return }
        guard let nameRestaurant = nameOfRestaurant  else { return }
        
        restaurantName.text = "Name: \(nameRestaurant)"
       restaurantAddress.text = "Address: \(addressRestaurant))"
        
    }
    
}

