//
//  LipsEntity.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/29/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class LipsEntity: NSManagedObject {
    
    @NSManaged var itemDescription: String
    @NSManaged var brand: String
    @NSManaged var color: String
    @NSManaged var rating: NSNumber
    @NSManaged var category: NSNumber
    @NSManaged var picture: NSData
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, itemDescription: String, brand: String,
        color: String, rating: NSNumber, category: NSNumber, picture: NSData) -> LipsEntity {
            
            let newLipsItem = NSEntityDescription.insertNewObjectForEntityForName("LipsEntity", inManagedObjectContext: moc) as LipsEntity
            
            newLipsItem.itemDescription = itemDescription
            newLipsItem.brand = brand
            newLipsItem.color = color
            newLipsItem.rating = rating
            newLipsItem.category = category
            newLipsItem.picture = picture
            
            return newLipsItem
    }
}


