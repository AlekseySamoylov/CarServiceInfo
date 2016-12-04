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
    required init(){
        super.init()
    }
    
    
    var value = ""
    var details = ""
    var workGroup : WorkGroup?
}
