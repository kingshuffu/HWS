//
//  ExpensesView.swift
//  iExpense
//
//  Created by Ayo Shafau on 12/17/23.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    
    var localCurrency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        List {
            Section{
                ForEach(expenses){ item in
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
                ForEach(expenses){ item in
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
        
    }
    
    init(filterString: String, sortOrder: [SortDescriptor<ExpenseItem>]){
        _expenses = Query(filter: #Predicate<ExpenseItem> {
            $0.type == filterString ||
            filterString.isEmpty
        },sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet){
//        expenses.items.remove(atOffsets: offsets)
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
}
#Preview {
    ExpensesView(filterString: "Personal", sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}
