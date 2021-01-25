//
//  ViewController.swift
//  Assignment1b-mlb0119
//
//  Created by Matthew Bentz on 6/1/20.
//  Copyright © 2020 Annaka Brewer (this is my girlfriend's MacBook). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Logo: UIImageView!
    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.currentTitle!
        
        // Change logo based on button pressed.
        switch title {
        case "War Eagle":
            Logo.image = #imageLiteral(resourceName: "Auburn_Logo")
        case "SEC":
            Logo.image = #imageLiteral(resourceName: "SEC_Logo")
        case "Roll Tide":
            Logo.image = #imageLiteral(resourceName: "Alabama_Logo")
            
        // Flawless debugging strategy.
        default:
            print("How did you get here?")
            print(title)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ensure SEC logo is present when app loads.
        Logo.image = #imageLiteral(resourceName: "SEC_Logo")
    }


}

