//
//  AddTaskView.swift
//  Traqer1
//
//  Created by Ayo Shafau on 11/5/23.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var tasqManager: TasqManager
    @Environment(\.dismiss) var dismiss
    
    @State private var newName = ""
    @State private var newDesc = ""
    
    var body: some View {
        VStack{
            TextField("Enter name", text: $newName)
            TextField("Enter desc", text: $newDesc)
            
            Spacer()
            
            Button("Add Tasq"){
                let newTasq = Tasq(title: newName, desc: newName, isCompleted: false)
                tasqManager.addTasq(title: newTasq.title, desc: newDesc.description)
                dismiss()
                
            }
        }
    }
}

//#Preview {
//    AddTaskView()
//}
