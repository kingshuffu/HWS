//
//  TaskDetailView.swift
//  Traqer1
//
//  Created by Ayo Shafau on 11/4/23.
//

import SwiftUI

struct TaskDetailView: View {
    var tasq: Tasq
    
//    var tasqBinding: Binding<Tasq> {
//        Binding(get: {self.tasq}, set: {self.tasq = $0})
//    }
    
    var body: some View {
        VStack{
            HStack{
                
                Image(systemName: tasq.isCompleted ? "checkmark.square.fill" : "square")
                    .imageScale(.large)
                
                Text(tasq.title)
                    .font(.largeTitle)
            }
            
            Text(tasq.desc)
                
            
            Spacer()
            
            HStack {
                Button("Delete") {
                    
                }
            }
        }
    }
}

//
//#Preview {
//    TaskDetailView()
//}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let testTasqs = [
            Tasq(title: "Task 1", desc: "Description 1", isCompleted: false),
            Tasq(title: "Task 2", desc: "Description 2", isCompleted: false),
            Tasq(title: "Task 2", desc: "Description 2", isCompleted: false)
        ]
        
        let tasqManager = TasqManager()
        tasqManager.tasqs = testTasqs
        
        return TaskDetailView(tasq: testTasqs[0])
    }
}
