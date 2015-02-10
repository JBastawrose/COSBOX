//
//  AddingViewController.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/27/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import UIKit
import CoreData

class AddingViewController: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate,
                            UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var brandText: UITextField!
    @IBOutlet weak var colorText: UITextField!
    @IBOutlet weak var itemDescriptionText: UITextView!
    @IBOutlet var categoryPicker: UIPickerView! = UIPickerView()
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var ratingSliderOutlet: UISlider!
    weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Item"
        
        // create UIPiverView and attach to inputView of Category textField...
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        self.brandText.delegate = self
        self.colorText.delegate = self
        self.itemDescriptionText.delegate = self
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
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "saveItem:")
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @IBAction func editPhotoButton(sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func saveItem(sender: UIBarButtonItem) {
        let keysReturned = allKeysForValue(categoryOptions, categoryText.text)
        let keyOfCategory: NSNumber = keysReturned[0]
        
        var imageNSData: NSData
        if ( (imageView.image) != nil ) {
            imageNSData = UIImageJPEGRepresentation(imageView.image, 1)
        } else {
            imageNSData = img
        }
        
        let brand = brandText.text
        let category = keyOfCategory
        let color = colorText.text
        let description = itemDescriptionText.text
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
        // go back to previous screen once data is saved...
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func categoryTextTapped(sender: UITextField) {
        categoryText.text = categoryOptions[0]
    }
    
    @IBAction func ratingSlider(sender: UISlider) {
        var ratingNumber = Int(ratingSliderOutlet.value)
        ratingLabel.text = "\(ratingNumber)"
    }
    
//    @IBAction func addItemButton(sender: UIButton) {
//        let keysReturned = allKeysForValue(categoryOptions, categoryText.text)
//        let keyOfCategory: NSNumber = keysReturned[0]
//        
//        let brand = brandText.text
//        let category = keyOfCategory
//        let color = colorText.text
//        let description = itemDescriptionText.text
//        let rating = ratingSliderOutlet.value
//        
//        if category == 0 {
//            if let moc = managedObjectContext {
//                FoundationEntity.createInManagedObjectContext (moc,
//                    itemDescription: description,
//                    brand: brand,
//                    color: color,
//                    rating: rating,
//                    category: category,
//                    picture: img
//                )
//            }
//        }
//        if category == 1 {
//            if let moc = managedObjectContext {
//                BlushEntity.createInManagedObjectContext (moc,
//                    itemDescription: description,
//                    brand: brand,
//                    color: color,
//                    rating: rating,
//                    category: category,
//                    picture: img
//                )
//            }
//        }
//        if category == 2 {
//            if let moc = managedObjectContext {
//                EyesEntity.createInManagedObjectContext (moc,
//                    itemDescription: description,
//                    brand: brand,
//                    color: color,
//                    rating: rating,
//                    category: category,
//                    picture: img
//                )
//            }
//        }
//        if category == 3 {
//            if let moc = managedObjectContext {
//                LipsEntity.createInManagedObjectContext (moc,
//                    itemDescription: description,
//                    brand: brand,
//                    color: color,
//                    rating: rating,
//                    category: category,
//                    picture: img
//                )
//            }
//        }
//        if category == 4 {
//            if let moc = managedObjectContext {
//                NailsEntity.createInManagedObjectContext (moc,
//                    itemDescription: description,
//                    brand: brand,
//                    color: color,
//                    rating: rating,
//                    category: category,
//                    picture: img
//                )
//            }
//        }
//        if category == 5 {
//            if let moc = managedObjectContext {
//                OthersEntity.createInManagedObjectContext (moc,
//                    itemDescription: description,
//                    brand: brand,
//                    color: color,
//                    rating: rating,
//                    category: category,
//                    picture: img
//                )
//            }
//        }
//        // go back to previous screen once data is saved...
//        self.navigationController?.popToRootViewControllerAnimated(true)
//    }
    
    func doneAction() {
        self.categoryText.resignFirstResponder()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}







