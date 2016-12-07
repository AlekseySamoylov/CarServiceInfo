//
//  Entity.swift
//  CarServiceInfo
//
//  Created by User on 13.11.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import EVReflection

class Work : Entity{
    var price : Double = 0
    var details = ""
    var workGroup : WorkGroup?
}
