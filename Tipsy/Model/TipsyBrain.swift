//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Евгений Башун on 07.02.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

struct TipsyBrain {
    var totalPerPerson: Double?
    
    mutating func getTotal(total: Double, tip: Double, number: Int) {
        totalPerPerson = total * (1 + tip) / Double(number)
    }
    
    func getTotalPerPerson() -> String {
        String(format: "%1.f", totalPerPerson ?? 0.0)
    }
    
}
