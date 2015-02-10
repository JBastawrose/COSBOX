//
//  FoundationEntity.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/29/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FoundationEntity: NSManagedObject {
    
    @NSManaged var itemDescription: String
    @NSManaged var brand: String
    @NSManaged var color: String
    @NSManaged var rating: NSNumber
    @NSManaged var category: NSNumber
    @NSManaged var picture: NSData
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, itemDescription: String, brand: String,
        color: String, rating: NSNumber, category: NSNumber, picture: NSData) -> FoundationEntity {
            
            let newFoundationItem = NSEntityDescription.insertNewObjectForEntityForName("FoundationEntity", inManagedObjectContext: moc) as FoundationEntity
            
            newFoundationItem.itemDescription = itemDescription
            newFoundationItem.brand = brand
            newFoundationItem.color = color
            newFoundationItem.rating = rating
            newFoundationItem.category = category
            newFoundationItem.picture = picture
            
            return newFoundationItem
    }
}


