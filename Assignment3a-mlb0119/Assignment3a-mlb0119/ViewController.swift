//
//  ViewController.swift
//  Assignment3a-mlb0119
//
//  Created by Matthew Bentz on 7/12/20.
//  Copyright © 2020 Annaka Brewer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Data and outlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    private var pickerItems = ["Thing One", "Thing Two", "Thing Three"]

    // Picker Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerItems.count
    }
    // Picker Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerItems[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Dismiss Keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // Displays alert for currently selected row
    @IBAction func onSelectPressed(_ sender: UIButton) {
        let row = pickerView.selectedRow(inComponent: 0)
        let selected = pickerItems[row]
        let message = "You have selected \(selected)"
        let alert = UIAlertController(title: "Selected from picker", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // Replaces currently selected row with value in text field
    @IBAction func onReplacePressed(_ sender: UIButton) {
        let text = textField.text!
        let row = pickerView.selectedRow(inComponent: 0)
        pickerItems[row] = text
        pickerView.reloadAllComponents()
    }
    
    // Inserts text field into currently selected row + 1
    @IBAction func onInsertPressed(_ sender: UIButton) {
        // Add item
        let text = textField.text!
        pickerItems.insert(text, at: pickerView.selectedRow(inComponent: 0)+1)
        pickerView.reloadAllComponents()
        
        // Select new item
        pickerView.selectRow(pickerView.selectedRow(inComponent: 0)+1, inComponent: 0, animated: true)
        pickerView.reloadAllComponents()
    }

}

/* Fix app constraints.
   Make action methods for buttons.
 
 UIAlertController
 UIAlertMessage
 for bringing alert for select button
 vid3 5:30
 
 
   */
