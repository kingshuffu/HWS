//
//  TaskRowView.swift
//  Traqer1
//
//  Created by Ayo Shafau on 11/4/23.
//

import SwiftUI

struct TaskRowView: View {
    @ObservedObject var tasqManager: TasqManager
    var tasq: Tasq
    
    var body: some View {
        NavigationLink(destination: TaskDetailView(tasq: tasq)) {
            HStack {
                Button(action: {
                    tasqManager.toggleTasqComplete(tasq)
                }) {
                    if tasq.isCompleted {
                        Image(systemName: "checkmark")
                    } else {
                        Image(systemName: "square")
                    }
                }
                Text(tasq.title)
            }
        }
    }
}

//#Preview {
//    TaskRowView()
//}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        let testTasqs = [
            Tasq(title: "Task 1", desc: "Description 1", isCompleted: false),
            Tasq(title: "Task 2", desc: "Description 2", isCompleted: true),
            Tasq(title: "Task 3", desc: "Description 3", isCompleted: false)
        ]
        
        let tasqManager = TasqManager()
        tasqManager.tasqs = testTasqs
        
        return TaskRowView(tasqManager: tasqManager, tasq: testTasqs[1])
    }
}
