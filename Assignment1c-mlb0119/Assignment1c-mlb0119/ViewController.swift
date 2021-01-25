//
//  ViewController.swift
//  Assignment1c-mlb0119
//
//  Created by Matthew Bentz on 6/11/20.
//  Copyright © 2020 Annaka Brewer (this is my girlfriend's MacBook). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Alabama_Image: UIImageView!
    @IBOutlet weak var Auburn_Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alabama_Image.alpha = 0.5
        Auburn_Image.alpha = 0.5
    }

    @IBAction func onSliderChanged(_ sender: UISlider) {
        Alabama_Image.alpha = CGFloat(sender.value)
        Auburn_Image.alpha = 1 - CGFloat(sender.value)
    }
    
}

