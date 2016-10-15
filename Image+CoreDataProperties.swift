//
//  Image+CoreDataProperties.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import CoreData

extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image");
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var toPrice: NSSet?
    @NSManaged public var toPriceGroup: NSSet?

}

// MARK: Generated accessors for toPrice
extension Image {

    @objc(addToPriceObject:)
    @NSManaged public func addToToPrice(_ value: Price)

    @objc(removeToPriceObject:)
    @NSManaged public func removeFromToPrice(_ value: Price)

    @objc(addToPrice:)
    @NSManaged public func addToToPrice(_ values: NSSet)

    @objc(removeToPrice:)
    @NSManaged public func removeFromToPrice(_ values: NSSet)

}

// MARK: Generated accessors for toPriceGroup
extension Image {

    @objc(addToPriceGroupObject:)
    @NSManaged public func addToToPriceGroup(_ value: PriceGroup)

    @objc(removeToPriceGroupObject:)
    @NSManaged public func removeFromToPriceGroup(_ value: PriceGroup)

    @objc(addToPriceGroup:)
    @NSManaged public func addToToPriceGroup(_ values: NSSet)

    @objc(removeToPriceGroup:)
    @NSManaged public func removeFromToPriceGroup(_ values: NSSet)

}
