//
//  EditViewController.swift
//  Assignment3b-mlb0119
//
//  Created by Annaka Brewer on 7/29/20.
//  Copyright © 2020 Annaka Brewer. All rights reserved.
//

import UIKit

class EditViewController : UIViewController {
    
    var receivedAlbum = ""
    var receivedArtist = ""
    var receivedYear = ""
    var receivedLabel = ""
    
    @IBOutlet weak var albumTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var labelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumTextField.text = receivedAlbum
        artistTextField.text = receivedArtist
        yearTextField.text = receivedYear
        labelTextField.text = receivedLabel
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        //if !albumTextField.text!.isEmpty {
        detailVC.receivedAlbum = albumTextField.text!
        //}
    }
}
