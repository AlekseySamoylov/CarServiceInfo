//
//  WorkVC.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import UIKit

class WorkVC: UIViewController, UINavigationControllerDelegate  {

    @IBOutlet weak var priceTitle: UILabel!

    @IBOutlet weak var priceImage: UIImageView!

    @IBOutlet weak var priceValue: UILabel!
    
    @IBOutlet weak var details: UITextView!
    
    var workItem: Work?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = workItem {
            priceTitle.text = item.title
            priceValue.text = "\(item.price)"
            details.text = item.details
        }
        
    
        
    }

    @IBAction func callToCompany(_ sender: UIButton) {
        if let url = NSURL(string: "tel://\(MY_PHONE)") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
}
