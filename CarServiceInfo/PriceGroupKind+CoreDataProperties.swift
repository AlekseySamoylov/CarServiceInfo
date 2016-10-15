//
//  PriceGroupKind+CoreDataProperties.swift
//  CarServiceInfo
//
//  Created by ALEKSEY SAMOYLOV on 10/15/16.
//  Copyright © 2016 ALEKSEY SAMOYLOV. All rights reserved.
//

import Foundation
import CoreData

extension PriceGroupKind {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PriceGroupKind> {
        return NSFetchRequest<PriceGroupKind>(entityName: "PriceGroupKind");
    }

    @NSManaged public var title: String?
    @NSManaged public var toPriceGroup: NSSet?
    @NSManaged public var toImage: Image?

}

// MARK: Generated accessors for toPriceGroup
extension PriceGroupKind {

    @objc(addToPriceGroupObject:)
    @NSManaged public func addToToPriceGroup(_ value: PriceGroup)

    @objc(removeToPriceGroupObject:)
    @NSManaged public func removeFromToPriceGroup(_ value: PriceGroup)

    @objc(addToPriceGroup:)
    @NSManaged public func addToToPriceGroup(_ values: NSSet)

    @objc(removeToPriceGroup:)
    @NSManaged public func removeFromToPriceGroup(_ values: NSSet)

}
