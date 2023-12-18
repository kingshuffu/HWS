//
//  AddView.swift
//  iExpense
//
//  Created by Ayo Shafau on 10/11/23.
//

import SwiftUI

struct AddView: View {
//    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var localCurrency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: localCurrency)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
//                    expenses.items.append(item)
                    modelContext.insert(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView()
}
