//
//  PriceGroup+CoreDataProperties.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import CoreData

extension PriceGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PriceGroup> {
        return NSFetchRequest<PriceGroup>(entityName: "PriceGroup");
    }

    @NSManaged public var title: String?
    @NSManaged public var toPrice: NSSet?
    @NSManaged public var toImage: Image?

}

// MARK: Generated accessors for toPrice
extension PriceGroup {

    @objc(addToPriceObject:)
    @NSManaged public func addToToPrice(_ value: Price)

    @objc(removeToPriceObject:)
    @NSManaged public func removeFromToPrice(_ value: Price)

    @objc(addToPrice:)
    @NSManaged public func addToToPrice(_ values: NSSet)

    @objc(removeToPrice:)
    @NSManaged public func removeFromToPrice(_ values: NSSet)

}
