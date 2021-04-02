//
//  Restaurant.swift
//  PME-6016930
//
//  Created by Suesawatwanich Chayapam on 24/3/2564 BE.
//  Copyright © 2564 CS3432. All rights reserved.
//

import Foundation
import UIKit

class Resetaurant {
    var name: String
    var location: String
    var cuisine: String
    var avgCost: String
    var openHour: String
//    var img: UIImageView
    
    init(name: String, location: String, cuisine: String, avgCost: String, openHour: String) {
        self.name = name
        self.location = location
        self.cuisine = cuisine
        self.avgCost = avgCost
        self.openHour = openHour
//        self.img.image = img.image
    }
}
