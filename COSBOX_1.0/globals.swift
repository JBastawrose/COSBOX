//
//  globals.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/31/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import UIKit
import CoreData

let cellIdentifier = "cellIdentifier"

var foundationItems = [FoundationEntity]()
var blushItems = [BlushEntity]()
var eyesItems = [EyesEntity]()
var lipsItems = [LipsEntity]()
var nailsItems = [NailsEntity]()
var otherItems = [OthersEntity]()
var img = NSData()

var categoryTapped = 0
var indexPathWas: Int? = 0
var indexPathTapped = NSIndexPath()

var sectionsUpdated = NSIndexSet(indexesInRange: NSRange(location: 0, length: 6))

let categoryOptions: [NSNumber: String] = [0:"Foundation", 1:"Blush", 2:"Eyes", 3: "Lips", 4:"Nails", 5:"Others"]

func allKeysForValue <K, V : Equatable> (categoryOptions: [K : V], val: V) -> [K] {
    return map(filter(categoryOptions) { $1 == val }) { $0.0 }
}

var scannedBarcode: String!

