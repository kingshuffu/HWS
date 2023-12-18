//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Ayo Shafau on 10/7/23.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
