//
//  coreData Helpers.swift
//  COSBOX_1.0
//
//  Created by Justin on 2/1/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// lazy
var managedObjectContext : NSManagedObjectContext? = {
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    if let managedObjectContext = appDelegate.managedObjectContext {
        return managedObjectContext
    }
    else {
        return nil
    }
}()

/*
// this function predicates and returns, it is necessary to predicate for every call so the data comes back in the same
// order after every call and reload...
func fetchMakeUpCategories(cat: Int){
let fetchRequest = NSFetchRequest(entityName: "MakeUpEntity")

let sortDescriptor = NSSortDescriptor(key: "brand", ascending: true)

fetchRequest.sortDescriptors = [sortDescriptor]

let predicate = NSPredicate(format: "category == %i", cat)

fetchRequest.predicate = predicate

if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [MakeUpEntity] {
makeUpItems = fetchResults
}
}
*/

func save() {
    var error : NSError?
    if(managedObjectContext!.save(&error)) {
        println(error?.localizedDescription)
    }
}

func fetchFoundations() {
    let fetchRequest = NSFetchRequest(entityName: "FoundationEntity")
    
    let sortDescriptor = NSSortDescriptor(key: "brand", ascending: true)
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [FoundationEntity] {
        foundationItems = fetchResults
    }
}

func fetchBlushes() {
    let fetchRequest = NSFetchRequest(entityName: "BlushEntity")
    
    let sortDescriptor = NSSortDescriptor(key: "brand", ascending: true)
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [BlushEntity] {
        blushItems = fetchResults
    }
}

func fetchEyes() {
    let fetchRequest = NSFetchRequest(entityName: "EyesEntity")
    
    let sortDescriptor = NSSortDescriptor(key: "brand", ascending: true)
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EyesEntity] {
        eyesItems = fetchResults
    }
}

func fetchLips() {
    let fetchRequest = NSFetchRequest(entityName: "LipsEntity")
    
    let sortDescriptor = NSSortDescriptor(key: "brand", ascending: true)
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [LipsEntity] {
        lipsItems = fetchResults
    }
}

func fetchNails() {
    let fetchRequest = NSFetchRequest(entityName: "NailsEntity")
    
    let sortDescriptor = NSSortDescriptor(key: "brand", ascending: true)
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [NailsEntity] {
        nailsItems = fetchResults
    }
}

func fetchOthers() {
    let fetchRequest = NSFetchRequest(entityName: "OthersEntity")
    
    let sortDescriptor = NSSortDescriptor(key: "brand", ascending: true)
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [OthersEntity] {
        otherItems = fetchResults
    }
}