//
//  EditItemViewController.swift
//  COSBOX_1.0
//
//  Created by Justin on 2/2/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EditItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate,
                              UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imageOutlet: UIImageView!
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var brandText: UITextField!
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet var categoryPicker: UIPickerView! = UIPickerView()
    weak var toolBar: UIToolbar!
    @IBOutlet weak var colorText: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingSliderOutlet: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Item"
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "saveItem:")
        self.navigationItem.rightBarButtonItem = saveButton
        
        // create UIPiverView and attach to inputView of Category textField...
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        self.brandText.delegate = self
        self.colorText.delegate = self
        self.descriptionTextView.delegate = self
        categoryText.inputView = categoryPicker
        categoryPicker.frame = CGRectMake(0, 0, 50, 162)
        
        // create toolbar and elements and add elements to toolbar for PickerView 'Done' Button...
        var toolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.bounds.size.width, 44))
        var space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        var item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneAction")
        var barItems = NSMutableArray()
        barItems.addObject(space)
        barItems.addObject(item)
        toolbar.setItems(barItems, animated: true)
        self.categoryText.inputAccessoryView = toolbar
        self.toolBar = toolbar
    
        if categoryTapped == 0 {
            foundationItems.removeAll(keepCapacity: false)
            fetchFoundations()
            imageOutlet.image = UIImage(data: foundationItems[indexPathWas!].picture)
            categoryPicker.selectRow(0, inComponent: 0, animated: false)
            categoryText.text = categoryOptions[foundationItems[indexPathWas!].category]
            brandText.text = foundationItems[indexPathWas!].brand
            colorText.text = foundationItems[indexPathWas!].color
            ratingLabel.text = "\(foundationItems[indexPathWas!].rating)"
            let ratingNSValue = foundationItems[indexPathWas!].rating
            ratingSliderOutlet.value = ratingNSValue.floatValue
            descriptionTextView.text = foundationItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 1 {
            blushItems.removeAll(keepCapacity: false)
            fetchBlushes()
            imageOutlet.image = UIImage(data: blushItems[indexPathWas!].picture)
            categoryPicker.selectRow(1, inComponent: 0, animated: false)
            categoryText.text = categoryOptions[blushItems[indexPathWas!].category]
            brandText.text = blushItems[indexPathWas!].brand
            colorText.text = blushItems[indexPathWas!].color
            ratingLabel.text = "\(blushItems[indexPathWas!].rating)"
            let ratingNSValue = blushItems[indexPathWas!].rating
            ratingSliderOutlet.value = ratingNSValue.floatValue
            descriptionTextView.text = blushItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 2 {
            eyesItems.removeAll(keepCapacity: false)
            fetchEyes()
            imageOutlet.image = UIImage(data: eyesItems[indexPathWas!].picture)
            categoryPicker.selectRow(2, inComponent: 0, animated: false)
            categoryText.text = categoryOptions[eyesItems[indexPathWas!].category]
            brandText.text = eyesItems[indexPathWas!].brand
            colorText.text = eyesItems[indexPathWas!].color
            ratingLabel.text = "\(eyesItems[indexPathWas!].rating)"
            let ratingNSValue = eyesItems[indexPathWas!].rating
            ratingSliderOutlet.value = ratingNSValue.floatValue
            descriptionTextView.text = eyesItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 3 {
            lipsItems.removeAll(keepCapacity: false)
            fetchLips()
            imageOutlet.image = UIImage(data: lipsItems[indexPathWas!].picture)
            categoryPicker.selectRow(3, inComponent: 0, animated: false)
            categoryText.text = categoryOptions[lipsItems[indexPathWas!].category]
            brandText.text = lipsItems[indexPathWas!].brand
            colorText.text = lipsItems[indexPathWas!].color
            ratingLabel.text = "\(lipsItems[indexPathWas!].rating)"
            let ratingNSValue = lipsItems[indexPathWas!].rating
            ratingSliderOutlet.value = ratingNSValue.floatValue
            descriptionTextView.text = lipsItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 4 {
            nailsItems.removeAll(keepCapacity: false)
            fetchNails()
            imageOutlet.image = UIImage(data: nailsItems[indexPathWas!].picture)
            categoryPicker.selectRow(4, inComponent: 0, animated: false)
            categoryText.text = categoryOptions[nailsItems[indexPathWas!].category]
            brandText.text = nailsItems[indexPathWas!].brand
            colorText.text = nailsItems[indexPathWas!].color
            ratingLabel.text = "\(nailsItems[indexPathWas!].rating)"
            let ratingNSValue = nailsItems[indexPathWas!].rating
            ratingSliderOutlet.value = ratingNSValue.floatValue
            descriptionTextView.text = nailsItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        } else if categoryTapped == 5 {
            nailsItems.removeAll(keepCapacity: false)
            fetchNails()
            imageOutlet.image = UIImage(data: otherItems[indexPathWas!].picture)
            categoryPicker.selectRow(5, inComponent: 0, animated: false)
            categoryText.text = categoryOptions[otherItems[indexPathWas!].category]
            brandText.text = otherItems[indexPathWas!].brand
            colorText.text = otherItems[indexPathWas!].color
            ratingLabel.text = "\(otherItems[indexPathWas!].rating)"
            let ratingNSValue = otherItems[indexPathWas!].rating
            ratingSliderOutlet.value = ratingNSValue.floatValue
            descriptionTextView.text = otherItems[indexPathWas!].itemDescription
            //indexPathWas = nil
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageOutlet.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    @IBAction func editPhotoButton(sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func ratingSlider(sender: UISlider) {
        var ratingNumber = Int(ratingSliderOutlet.value)
        ratingLabel.text = "\(ratingNumber)"
    }
    
    func saveItem(sender: UIBarButtonItem) {
        if categoryTapped == 0 {
            managedObjectContext?.deleteObject(foundationItems[indexPathWas!])
        } else if categoryTapped == 1 {
            managedObjectContext?.deleteObject(blushItems[indexPathWas!])
        } else if categoryTapped == 2 {
            managedObjectContext?.deleteObject(eyesItems[indexPathWas!])
        } else if categoryTapped == 3 {
            managedObjectContext?.deleteObject(lipsItems[indexPathWas!])
        } else if categoryTapped == 4 {
            managedObjectContext?.deleteObject(nailsItems[indexPathWas!])
        } else if categoryTapped == 5 {
            managedObjectContext?.deleteObject(otherItems[indexPathWas!])
        }
        
        let keysReturned = allKeysForValue(categoryOptions, categoryText.text)
        let keyOfCategory: NSNumber = keysReturned[0]
        
        var imageNSData: NSData
        if ( (imageOutlet.image) != nil ) {
            imageNSData = UIImageJPEGRepresentation(imageOutlet.image, 1.0)
        } else {
            imageNSData = img
        }
        
        let brand = brandText.text
        let category = keyOfCategory
        let color = colorText.text
        let description = descriptionTextView.text
        let rating = ratingSliderOutlet.value
        
        if category == 0 {
            if let moc = managedObjectContext {
                FoundationEntity.createInManagedObjectContext (moc,
                    itemDescription: description,
                    brand: brand,
                    color: color,
                    rating: rating,
                    category: category,
                    picture: imageNSData
                )
            }
        }
        if category == 1 {
            if let moc = managedObjectContext {
                BlushEntity.createInManagedObjectContext (moc,
                    itemDescription: description,
                    brand: brand,
                    color: color,
                    rating: rating,
                    category: category,
                    picture: imageNSData
                )
            }
        }
        if category == 2 {
            if let moc = managedObjectContext {
                EyesEntity.createInManagedObjectContext (moc,
                    itemDescription: description,
                    brand: brand,
                    color: color,
                    rating: rating,
                    category: category,
                    picture: imageNSData
                )
            }
        }
        if category == 3 {
            if let moc = managedObjectContext {
                LipsEntity.createInManagedObjectContext (moc,
                    itemDescription: description,
                    brand: brand,
                    color: color,
                    rating: rating,
                    category: category,
                    picture: imageNSData
                )
            }
        }
        if category == 4 {
            if let moc = managedObjectContext {
                NailsEntity.createInManagedObjectContext (moc,
                    itemDescription: description,
                    brand: brand,
                    color: color,
                    rating: rating,
                    category: category,
                    picture: imageNSData
                )
            }
        }
        if category == 5 {
            if let moc = managedObjectContext {
                OthersEntity.createInManagedObjectContext (moc,
                    itemDescription: description,
                    brand: brand,
                    color: color,
                    rating: rating,
                    category: category,
                    picture: imageNSData
                )
            }
        }
        save()
        
        // go back to previous screen once data is saved...
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func doneAction() {
        self.categoryText.resignFirstResponder()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// handle PickerView
// handle image...will there be a way to go back to original image? or will it get deleted once they tap 'edit photo'?
//      may need to use didFinishPickingImage
//      perhaps I can use UIImagePickerControllerOriginalImage



