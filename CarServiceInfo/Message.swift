//
//  Message.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/18/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import UIKit

class Message {
    var _date: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Date, \(currentDate)"
        
        return _date
    }
}
