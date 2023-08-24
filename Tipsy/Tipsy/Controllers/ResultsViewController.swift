//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 김유미 on 2023/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultAmount = "0.0"
    var tip = 0.0
    var split = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = resultAmount
        settingsLabel.text = "Split between \(split) people, with \(Int(tip * 100))% tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
