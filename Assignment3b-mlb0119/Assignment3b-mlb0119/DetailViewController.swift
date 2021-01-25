//
//  DetailViewController.swift
//  Assignment3b-mlb0119
//
//  Created by Matthew Bentz on 7/23/20.
//  Copyright © 2020 Matthew Bentz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receivedAlbum = ""
    var receivedArtist = ""
    var receivedYear = ""
    var receivedLabel = ""
    
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        albumLabel.text = receivedAlbum
        artistLabel.text = receivedArtist
        yearLabel.text = receivedYear
        recordLabel.text = receivedLabel
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editTapped))
    }
    
    @objc func editTapped() {
        self.performSegue(withIdentifier: "editViewSegue", sender: Any?.self)
    }
    
    // Sends album information to the edit view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editVC = segue.destination as! EditViewController
        
        editVC.receivedAlbum = albumLabel.text!
        editVC.receivedArtist = artistLabel.text!
        editVC.receivedYear = yearLabel.text!
        editVC.receivedLabel = recordLabel.text!
    }
    
    // Runs just before detail view is shown
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}

