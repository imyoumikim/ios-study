//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by 김유미 on 2023/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPct = 0.0
    var splitNumber = 0
    var billTotal = 0.0
    var billResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let percentString = String(sender.currentTitle!.dropLast())
        let percentDouble = Double(percentString)!
        tipPct = percentDouble / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTotal = Double(billTextField.text ?? "0")!
        let billResultNum = billTotal * (1 + tipPct) / Double(splitNumber)
        billResult = String(format: "%0.2f", billResultNum)
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.resultAmount = billResult
            destinationVC.tip = tipPct
            destinationVC.split = splitNumber
        }

    }
    
}
