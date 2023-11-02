//
//  ContentView.swift
//  iExpense
//
//  Created by Ayo Shafau on 10/7/23.
//

import SwiftUI
/*
class User: ObservableObject {
    @Published var firstName = "Ayo"
    @Published var lastName = "Shafau"
}
*/

struct User: Codable {
    let firstName: String
    let lastName: String
}

/*
struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        
        Button("Dismiss") {
            dismiss()
        }
    }
}
*/

struct ContentView: View {
//    @StateObject var user = User()
    @State private var showingSheet = false
    @State private var numbers =  [Int]()
    @State private var currentNumber = 1
//    @AppStorage("tapCount") private var tapCount = 0
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//    @State private var user = User(firstName: "Taylor", lastName: "Swift")
 
    var body: some View {
//        NavigationView {
/*
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
*/
/*            Button("Show sheet"){
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet){
                SecondView(name: "Ayo")
            }
 */
/*            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
             
                Button ("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar{
                EditButton()
            }

        }
 */
        
/*        Button("Tap count: \(tapCount)"){
            tapCount += 1
//            UserDefaults.standard.set(tapCount,forKey: "Tap")
            
        }
 */
/*
        VStack {
            Button("Save User" ){
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(user){
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
 */
        VStack{
        }
    }
 
    
/*
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
 */
    
}

#Preview {
    ContentView()
}
