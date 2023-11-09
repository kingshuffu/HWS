//
//  ContentView.swift
//  Traqer1
//
//  Created by Ayo Shafau on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tasqManager = TasqManager()
    @State private var addViewToggle = false
    
    var body: some View {
        NavigationView {
                TaskListView(tasqManager: tasqManager)
                    .navigationBarTitle("Tasq")
                    .toolbar{
                        Button("Add Task"){
                            addViewToggle = true
                        }
                    }
                    .sheet(isPresented: $addViewToggle){
                        AddTaskView(tasqManager: tasqManager)
                            .padding()
                    }
        }
    }
    
}

//#Preview {
//    ContentView()
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let testTasqs = [
            Tasq(title: "Task 1", desc: "Description 1", isCompleted: false),
            Tasq(title: "Task 2", desc: "Description 2", isCompleted: true),
            Tasq(title: "Task 3", desc: "Description 3", isCompleted: false)
        ]
        
        let tasqManager = TasqManager()
        tasqManager.tasqs = testTasqs
        
        return ContentView(tasqManager: tasqManager)
    }
}
