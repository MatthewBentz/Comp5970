//
//  ViewController.swift
//  Assignment2a-mlb0119
//
//  Created by Matthew Bentz on 6/16/20.
//  Copyright © 2020 Matthew Bentz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ----- User Input ----- //
    @IBOutlet weak var numPaymentsField: UITextField!
    @IBOutlet weak var interestRateField: UITextField!
    @IBOutlet weak var loanAmountField: UITextField!
    @IBOutlet weak var paymentAmountField: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 10
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /* Could not get this to work. Using code from stack overflow above.
     
     // ----- Dismiss Keyboard ----- //
    @IBAction func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
        numPaymentsField.resignFirstResponder()
        interestRateField.resignFirstResponder()
        loanAmountField.resignFirstResponder()
    }
     
     */
    
    // ----- Calculate Payment Amount ----- //
    @IBAction func onCalculatePressed(_ sender: UIButton) {

        if loanAmountField.text!.isEmpty || numPaymentsField.text!.isEmpty || interestRateField.text!.isEmpty {
            return
        }
        
        // Initialize Variables //
        let loan: Double? = Double(loanAmountField.text!)
        let numPayments: Int = Int(numPaymentsField.text!)!
        var interestRate: Double? = Double(interestRateField.text!)
        interestRate! /= 100
        var sum: Double = 0
        
        // Payment Calculation //
        for j in 1...numPayments {
            sum += Double(1.0 / pow((1.0 + interestRate!),Double(j)))
        }
        let paymentAmount = loan! / sum
        
        // Currency Formatting //
        let paymentAmountString = String(format: "$%.02f", paymentAmount)
        paymentAmountField.text = paymentAmountString
    }
    
}

