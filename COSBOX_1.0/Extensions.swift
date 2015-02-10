//
//  Extensions.swift
//  COSBOX_1.0
//
//  Created by Justin on 1/28/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import UIKit

extension AddingViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryOptions.count
    }
}

extension AddingViewController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return categoryOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        categoryText.text = "\(categoryOptions[row]!)"
    }
}

extension AddingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
}

extension EditItemViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryOptions.count
    }
}

extension EditItemViewController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return categoryOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        categoryText.text = "\(categoryOptions[row]!)"
    }
}

extension EditItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
}



