//
//  Student+CoreDataProperties.swift
//  DemoSwift
//
//  Created by Megha on 27/12/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student");
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?
    @NSManaged public var number: String?
    @NSManaged public var student1: Stream?

}
