//
//  ContentView.swift
//  iExpense
//
//  Created by Ayo Shafau on 10/7/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @Environment(\.modelContext) var modelContext
    //    @Query var expenses: [ExpenseItem]
    
    @State private var sortOrder = [
            SortDescriptor(\ExpenseItem.name),
            SortDescriptor(\ExpenseItem.amount)
    ]
    
    @State private var filterType = ""
    
    var localCurrency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        NavigationStack {
            //            List {
            //                Section{
            //                    ForEach(expenses){ item in
            //                        if item.type == "Personal"{
            //                            HStack {
            //                                VStack(alignment: .leading) {
            //                                    Text(item.name)
            //                                        .font(.headline)
            //                                    Text(item.type)
            //                                }
            //
            //                                Spacer()
            //
            //                                if item.amount <= 10.00 {
            //                                    Text(item.amount, format: localCurrency)
            //                                        .foregroundStyle(.green)
            //                                } else if item.amount < 100.00 {
            //                                    Text(item.amount, format: localCurrency)
            //                                        .foregroundStyle(.yellow)
            //                                } else {
            //                                    Text(item.amount, format: localCurrency)
            //                                        .foregroundStyle(.red)
            //                                }
            //                            }
            //                        }
            //                    }
            //                    .onDelete(perform: removeItems)
            //
            //                }
            //
            //                Section{
            //                    ForEach(expenses){ item in
            //                        if item.type == "Business"{
            //                            HStack {
            //                                VStack(alignment: .leading) {
            //                                    Text(item.name)
            //                                        .font(.headline)
            //                                    Text(item.type)
            //                                }
            //
            //                                Spacer()
            //
            //                                if item.amount <= 10.00 {
            //                                    Text(item.amount, format: localCurrency)
            //                                        .foregroundStyle(.green)
            //                                } else if item.amount < 100.00 {
            //                                    Text(item.amount, format: localCurrency)
            //                                        .foregroundStyle(.yellow)
            //                                } else {
            //                                    Text(item.amount, format: localCurrency)
            //                                        .foregroundStyle(.red)
            //                                }
            //                            }
            //                        }
            //                    }
            //                    .onDelete(perform: removeItems)
            //                }
            //            }
            ExpensesView(filterString: filterType, sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle"){
                        Picker("Filter", selection: $filterType){
                            Text("All").tag("")
                            Text("Personal Only").tag("Personal")
                            Text("Business Only").tag("Business")
                        }
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down"){
                        Picker("Sort", selection: $sortOrder){
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            
                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                        }
                    }
                }
                .sheet(isPresented: $showingAddExpense){
                    //                AddView(expenses: expenses)
                    AddView()
                }
        }
    }
}

    
//    func removeItems(at offsets: IndexSet){
//        expenses.items.remove(atOffsets: offsets)
//        for offset in offsets {
//            let expense = expenses[offset]
//            modelContext.delete(expense)
//        }
//    }
//}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
