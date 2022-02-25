//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Евгений Башун on 07.02.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    var totalPerPerson: String?
    var tip: Int?
    var numberOfPerson: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPerPersonLabel.text = totalPerPerson
        adviceLabel.text = "Split between \(numberOfPerson ?? 2) people, with \(tip ?? 10)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
