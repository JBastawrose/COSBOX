//
//  OthersEntity.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/30/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class OthersEntity: NSManagedObject {
    
    @NSManaged var itemDescription: String
    @NSManaged var brand: String
    @NSManaged var color: String
    @NSManaged var rating: NSNumber
    @NSManaged var category: NSNumber
    @NSManaged var picture: NSData
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, itemDescription: String, brand: String,
        color: String, rating: NSNumber, category: NSNumber, picture: NSData) -> OthersEntity {
            
            let newOthersItem = NSEntityDescription.insertNewObjectForEntityForName("OthersEntity", inManagedObjectContext: moc) as OthersEntity
            
            newOthersItem.itemDescription = itemDescription
            newOthersItem.brand = brand
            newOthersItem.color = color
            newOthersItem.rating = rating
            newOthersItem.category = category
            newOthersItem.picture = picture
            
            return newOthersItem
    }
}
