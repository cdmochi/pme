//









//  Restuarant.swift
//  PME-6016930
//
//  Created by Suesawatwanich Chayapam on 24/3/2564 BE.
//  Copyright © 2564 CS3432. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class Restuarant : Mappable{
    var name: String = ""
    var location: String = ""
    var cuisine: String = ""
    var avgCost: String = ""
    var openHour: String = ""
    var img: UIImage = #imageLiteral(resourceName: "res2_02")
    
//    init(name: String, location: String, cuisine: String, avgCost: String, openHour: String, img: UIImage) {
//        self.name = name
//        self.location = location
//        self.cuisine = cuisine
//        self.avgCost = avgCost
//        self.openHour = openHour
//        self.img = img
//    }
//
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        name <- map["name"]
        location <- map["location"]
        cuisine <- map["cuisines"]
        avgCost <- map["averageCost"]
        openHour  <- map["hours"]
        img  <- map["image"]
    }

}
