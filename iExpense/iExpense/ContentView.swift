//
//  ContentView.swift
//  iExpense
//
//  Created by Ayo Shafau on 10/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var localCurrency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        NavigationView {
            List {
                Section{
                    ForEach(expenses.items){ item in
                        if item.type == "Personal"{
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                if item.amount <= 10.00 {
                                    Text(item.amount, format: localCurrency)
                                        .foregroundStyle(.green)
                                } else if item.amount < 100.00 {
                                    Text(item.amount, format: localCurrency)
                                        .foregroundStyle(.yellow)
                                } else {
                                    Text(item.amount, format: localCurrency)
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                    
                }
                
                Section{
                    ForEach(expenses.items){ item in
                        if item.type == "Business"{
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                if item.amount <= 10.00 {
                                    Text(item.amount, format: localCurrency)
                                        .foregroundStyle(.green)
                                } else if item.amount < 100.00 {
                                    Text(item.amount, format: localCurrency)
                                        .foregroundStyle(.yellow)
                                } else {
                                    Text(item.amount, format: localCurrency)
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
