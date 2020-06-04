//
//  User+CoreDataProperties.swift
//  MVCTrailzDemo
//
//  Created by Adam Gerhartz on 6/3/20.
//  Copyright © 2020 Adam Gerhartz. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var first_name: String?
    @NSManaged public var last_name: String?

}
