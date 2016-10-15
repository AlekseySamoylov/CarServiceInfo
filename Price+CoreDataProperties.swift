//
//  Price+CoreDataProperties.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import CoreData 

extension Price {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Price> {
        return NSFetchRequest<Price>(entityName: "Price");
    }

    @NSManaged public var title: String?
    @NSManaged public var details: String?
    @NSManaged public var price: String?
    @NSManaged public var toPriceGroup: PriceGroup?
    @NSManaged public var toImage: Image?

}
