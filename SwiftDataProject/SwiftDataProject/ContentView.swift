//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Ayo Shafau on 12/10/23.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
//    @Query(filter: #Predicate<User> { user in
//        user.name.localizedStandardContains("R") &&
//        user.city == "Orlando"
//    }, sort: \User.name) var users: [User]
//    @State private var path = [User]()
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var body: some View {
        NavigationStack{
            //            List(users) { user in
            //                NavigationLink(value: user){
            //                    Text(user.name)
            //                }
            //            }
            Users(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Users")
//            .navigationDestination(for: User.self){ user in
//                EditUserView(user: user)
//            }
            .toolbar {
                Button("Add Samples", systemImage: "plus"){
                    try? modelContext.delete(model: User.self)
                     
//                    let user = User(name: "", city: "", joinDate: .now)
//                    modelContext.insert(user)
//                    path = [user]
                    
                    let first = User(name: "Batman", city: "Gotham", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Superman", city: "Orlando", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Flash", city: "Orlando", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Ant Man", city: "Houston", joinDate: .now.addingTimeInterval(86400  * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                    
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                 Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        
                        Text("Sort by Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
