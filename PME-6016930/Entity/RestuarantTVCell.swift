//










//  RestuarantTVCell.swift
//  PME-6016930
//
//  Created by Suesawatwanich Chayapam on 24/3/2564 BE.
//  Copyright © 2564 CS3432. All rights reserved.
//

import UIKit

class RestuarantTVCell: UITableViewCell {
    
    @IBOutlet weak var headerImageIv: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var locationLb: UILabel!
    
    @IBOutlet weak var cuisineContentLb: UILabel!
    @IBOutlet weak var avgCostContentLb: UILabel!
    @IBOutlet weak var openHourContentLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(model: Restuarant) {
        nameLb.text = model.name
        locationLb.text = model.location
        cuisineContentLb.text = model.cuisine
        avgCostContentLb.text =  model.avgCost
        openHourContentLb.text = model.openHour
    }

}
