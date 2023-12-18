//
//  ContentView.swift
//  Bookworm
//
//  Created by Ayo Shafau on 11/14/23.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) { isOn.toggle() }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(radius: isOn ? 0 : 5)
        
    }
}

struct ContentView: View {
    @State private var rememberMe = false
    @AppStorage("notes") private var notes = ""
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    
    
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
        
//        NavigationView {
//            TextEditor(text: $notes)
//                .navigationTitle("notes")
//                .padding()
//        }
        
//        VStack {
//            List(students) { student in
//                Text(student.name ?? "Unknown")
//            }
//
//            Button("add"){
//                let firstNames = ["tequila", "vodka", "rum", "whiskey"]
//                let lastNames = ["summer", "winter", "fall", "spring"]
//
//                let chosenFirst = firstNames.randomElement()!
//                let chosenLast = lastNames.randomElement()!
//
//                let student = Student(context: moc)
//
//                student.id = UUID()
//                student.name = "\(chosenFirst) \(chosenLast)"
//
//                try? moc.save()
//            }
//        }
        
        NavigationStack{
            List(students){ student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add"){
                    let firstNames = ["Batman", "Robin", "Catwoman", "Batgirl"]
                    let lastNames = ["alpha", "beta", "delta", "omega"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
            .sheet(isPresented: $showingAddScreen){
                AddBookView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
