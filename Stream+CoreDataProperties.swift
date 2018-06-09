//
//  Stream+CoreDataProperties.swift
//  DemoSwift
//
//  Created by Megha on 27/12/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

import Foundation
import CoreData


extension Stream {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stream> {
        return NSFetchRequest<Stream>(entityName: "Stream");
    }

    @NSManaged public var artce: String?
    @NSManaged public var commerce: String?
    @NSManaged public var science: String?
    @NSManaged public var strem1: NSSet?

}

// MARK: Generated accessors for strem1
extension Stream {

    @objc(addStrem1Object:)
    @NSManaged public func addToStrem1(_ value: Student)

    @objc(removeStrem1Object:)
    @NSManaged public func removeFromStrem1(_ value: Student)

    @objc(addStrem1:)
    @NSManaged public func addToStrem1(_ values: NSSet)

    @objc(removeStrem1:)
    @NSManaged public func removeFromStrem1(_ values: NSSet)

}
