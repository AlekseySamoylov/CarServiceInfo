//
//  Entity.swift
//  CarServiceInfo
//
//  Created by User on 16.11.16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import EVReflection

class Entity : EVObject{
    required init(){
        id = 0
        title = ""
    }
    var id : Int64
    var title : String
}
