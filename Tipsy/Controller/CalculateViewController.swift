//
//  ViewController.swift
//  Tipsy
//
//  Created by Евгений Башун on 07.02.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var twentyTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var zeroTipButton: UIButton!
    @IBOutlet weak var totalAmount: UITextField!
    
    private var tipsyBrain = TipsyBrain()
    private var tip: Double = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculate" {
            guard let destination = segue.destination as? ResultViewController else { return }
            destination.totalPerPerson = tipsyBrain.getTotalPerPerson()
            destination.numberOfPerson = Int(stepper.value)
            destination.tip = Int(tip * 100)
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let text = totalAmount.text else {return}
        
        let total = Double(text) ?? 0.0
        let numberOfPeople = Int(stepper.value)
        tipsyBrain.getTotal(total: total, tip: tip, number: numberOfPeople)
        
        self.performSegue(withIdentifier: "calculate", sender: self)
    }
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        totalAmount.endEditing(true)
        zeroTipButton.isSelected = false
        tenTipButton.isSelected = false
        twentyTipButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
    }
}

