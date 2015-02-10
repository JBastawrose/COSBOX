//
//  DetailViewController.swift
//  COSBOX_1.0
//
//  Created by Justin on 2/1/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Item Details"
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "editItem:")
        self.navigationItem.rightBarButtonItem = editButton
        
        if categoryTapped == 0 {
            foundationItems.removeAll(keepCapacity: false)
            fetchFoundations()
            imageView.image = UIImage(data: foundationItems[indexPathWas!].picture)
            categoryLabel.text = categoryOptions[foundationItems[indexPathWas!].category]
            brandLabel.text = foundationItems[indexPathWas!].brand
            colorLabel.text = foundationItems[indexPathWas!].color
            ratingLabel.text = "\(foundationItems[indexPathWas!].rating)"
            descriptionTextView.text = foundationItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 1 {
            blushItems.removeAll(keepCapacity: false)
            fetchBlushes()
            imageView.image = UIImage(data: blushItems[indexPathWas!].picture)
            categoryLabel.text = categoryOptions[blushItems[indexPathWas!].category]
            brandLabel.text = blushItems[indexPathWas!].brand
            colorLabel.text = blushItems[indexPathWas!].color
            ratingLabel.text = "\(blushItems[indexPathWas!].rating)"
            descriptionTextView.text = blushItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 2 {
            eyesItems.removeAll(keepCapacity: false)
            fetchEyes()
            imageView.image = UIImage(data: eyesItems[indexPathWas!].picture)
            categoryLabel.text = categoryOptions[eyesItems[indexPathWas!].category]
            brandLabel.text = eyesItems[indexPathWas!].brand
            colorLabel.text = eyesItems[indexPathWas!].color
            ratingLabel.text = "\(eyesItems[indexPathWas!].rating)"
            descriptionTextView.text = eyesItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 3 {
            lipsItems.removeAll(keepCapacity: false)
            fetchLips()
            imageView.image = UIImage(data: lipsItems[indexPathWas!].picture)
            categoryLabel.text = categoryOptions[lipsItems[indexPathWas!].category]
            brandLabel.text = lipsItems[indexPathWas!].brand
            colorLabel.text = lipsItems[indexPathWas!].color
            ratingLabel.text = "\(lipsItems[indexPathWas!].rating)"
            descriptionTextView.text = lipsItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 4 {
            nailsItems.removeAll(keepCapacity: false)
            fetchNails()
            imageView.image = UIImage(data: nailsItems[indexPathWas!].picture)
            categoryLabel.text = categoryOptions[nailsItems[indexPathWas!].category]
            brandLabel.text = nailsItems[indexPathWas!].brand
            colorLabel.text = nailsItems[indexPathWas!].color
            ratingLabel.text = "\(nailsItems[indexPathWas!].rating)"
            descriptionTextView.text = nailsItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 5 {
            nailsItems.removeAll(keepCapacity: false)
            fetchNails()
            imageView.image = UIImage(data: otherItems[indexPathWas!].picture)
            categoryLabel.text = categoryOptions[otherItems[indexPathWas!].category]
            brandLabel.text = otherItems[indexPathWas!].brand
            colorLabel.text = otherItems[indexPathWas!].color
            ratingLabel.text = "\(otherItems[indexPathWas!].rating)"
            descriptionTextView.text = otherItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        }
    }
    
    func editItem (sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("editItem", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
