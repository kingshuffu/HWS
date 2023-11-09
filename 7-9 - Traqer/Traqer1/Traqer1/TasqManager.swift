//
//  TasqManager.swift
//  Traqer1
//
//  Created by Ayo Shafau on 11/4/23.
//

import Foundation

class TasqManager: ObservableObject {
    @Published var tasqs: [Tasq]
    
    init() {
        self.tasqs = [] // Initializing with an empty array
    }
    
    // Function to add a new task to the list
    func addTasq(title: String, desc: String) {
        let newTasq = Tasq(title: title, desc: desc, isCompleted: false)
        tasqs.append(newTasq)
    }
    
    // Function to remove a task from the list by its ID
    func removeTasq(withID id: UUID) {
        tasqs.removeAll{ $0.id == id }
    }
    
    // Function to toggle the completion status of a task
    func toggleTasqComplete(_ tasq: Tasq) {
        if let index = tasqs.firstIndex(where: {$0.id == tasq.id}) {
            tasqs[index].isCompleted.toggle()
        }
    }
    
}
