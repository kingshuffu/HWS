//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ayo Shafau on 10/11/23.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
