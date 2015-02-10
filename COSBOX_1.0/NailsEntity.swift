//
//  NailsEntity.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/29/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class NailsEntity: NSManagedObject {
    
    @NSManaged var itemDescription: String
    @NSManaged var brand: String
    @NSManaged var color: String
    @NSManaged var rating: NSNumber
    @NSManaged var category: NSNumber
    @NSManaged var picture: NSData
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, itemDescription: String, brand: String,
        color: String, rating: NSNumber, category: NSNumber, picture: NSData) -> NailsEntity {
            
            let newNailsItem = NSEntityDescription.insertNewObjectForEntityForName("NailsEntity", inManagedObjectContext: moc) as NailsEntity
            
            newNailsItem.itemDescription = itemDescription
            newNailsItem.brand = brand
            newNailsItem.color = color
            newNailsItem.rating = rating
            newNailsItem.category = category
            newNailsItem.picture = picture
            
            return newNailsItem
    }
}
