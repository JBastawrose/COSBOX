//
//  BlushEntity.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/29/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class BlushEntity: NSManagedObject {
    
    @NSManaged var itemDescription: String
    @NSManaged var brand: String
    @NSManaged var color: String
    @NSManaged var rating: NSNumber
    @NSManaged var category: NSNumber
    @NSManaged var picture: NSData
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, itemDescription: String, brand: String,
        color: String, rating: NSNumber, category: NSNumber, picture: NSData) -> BlushEntity {
            
            let newBlushsItem = NSEntityDescription.insertNewObjectForEntityForName("BlushEntity", inManagedObjectContext: moc) as BlushEntity
            
            newBlushsItem.itemDescription = itemDescription
            newBlushsItem.brand = brand
            newBlushsItem.color = color
            newBlushsItem.rating = rating
            newBlushsItem.category = category
            newBlushsItem.picture = picture
            
            return newBlushsItem
    }
}