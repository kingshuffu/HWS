//
//  TaskListView.swift
//  Traqer1
//
//  Created by Ayo Shafau on 11/4/23.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var tasqManager: TasqManager
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        List {
            ForEach(tasqManager.tasqs.sorted(by: {!$0.isCompleted && $1.isCompleted })){ tasq in
//                TaskRowView(tasqManager: tasqManager, tasq: tasq)
                NavigationLink(destination: TaskDetailView(tasq: tasq)) {
                    HStack {
                        Image(systemName: tasq.isCompleted ? "checkmark.square.fill" : "square")
                            .onTapGesture {
                                withAnimation{
                                    tasqManager.toggleTasqComplete(tasq)
                                }
                                print(tasq.isCompleted)
                            }
                        
//                        Button {
//                            tasqManager.toggleTasqComplete(tasq)
//                            print(tasq.isCompleted)
//                        } label: {
//                            tasq.isCompleted ? Image(systemName: "checkmark.square.fill") : Image(systemName:Te "square")
//                        }
                        
//                        Button(action: {
//                            tasqManager.toggleTasqComplete(tasq)
//                        }) {
//                            if tasq.isCompleted {
//                                Image(systemName: "checkmark")
//                            } else {
//                                Image(systemName: "square")
//                            }
//                        }
                        
                        Text(tasq.title)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
    
}


struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        let testTasqs = [
            Tasq(title: "Task 1", desc: "Description 1", isCompleted: false),
            Tasq(title: "Task 2", desc: "Description 2", isCompleted: true),
            Tasq(title: "Task 3", desc: "Description 3", isCompleted: false)
        ]
        
        let tasqManager = TasqManager()
        tasqManager.tasqs = testTasqs
        
        return TaskListView(tasqManager: tasqManager)
    }
}


//#Preview {
//    TaskListView()
//}
