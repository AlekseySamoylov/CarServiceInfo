//
//  Price.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/18/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import Alamofire

public class PriceDB {
    
    var _title: String!
    var _details: String!
    var _price: String!
    //  var _picture: UIImage!
    
    var title: String {
        if _title == nil {
            _title = ""
        }
        return _title
    }
    
    var details: String {
        if _details == nil {
            _details = ""
        }
        return _details
    }
    
    var price: String {
        if _price == nil {
            _price = ""
        }
        return _price
    }
    
    func downloadPriceDetails(completed: DownloadComplete) {
        let currentPriceUrl = URL(string: TEST_URL)
        Alamofire.request(currentPriceUrl!).responseJSON {
            response in
            let result = response.result
            print("hello \(response)")

            print("hello \(result)")
            
        }
        completed()
    }
    
    
}
