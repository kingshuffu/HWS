//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ayo Shafau on 10/11/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
