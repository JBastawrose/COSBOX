//
//  EyesEntity.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/29/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class EyesEntity: NSManagedObject {
    
    @NSManaged var itemDescription: String
    @NSManaged var brand: String
    @NSManaged var color: String
    @NSManaged var rating: NSNumber
    @NSManaged var category: NSNumber
    @NSManaged var picture: NSData
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, itemDescription: String, brand: String,
        color: String, rating: NSNumber, category: NSNumber, picture: NSData) -> EyesEntity {
            
            let newEyesItem = NSEntityDescription.insertNewObjectForEntityForName("EyesEntity", inManagedObjectContext: moc) as EyesEntity
            
            newEyesItem.itemDescription = itemDescription
            newEyesItem.brand = brand
            newEyesItem.color = color
            newEyesItem.rating = rating
            newEyesItem.category = category
            newEyesItem.picture = picture
            
            return newEyesItem
    }
}
