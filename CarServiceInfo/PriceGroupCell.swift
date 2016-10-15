//
//  PriceGroupCell.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import UIKit

class PriceGroupCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!

    @IBOutlet weak var title: UILabel!
    
    func configureCell(item: PriceGroup) {
        title.text = item.title

        if let image = item.toImage?.image as? UIImage {
            thumb.image = image
        }
    }
}
