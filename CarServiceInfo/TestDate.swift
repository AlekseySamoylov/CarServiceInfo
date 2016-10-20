//
//  TestDate.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/18/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation


class TestDate {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .none
    let currentDate = dateFormatter.string(from: Date())
    
}
