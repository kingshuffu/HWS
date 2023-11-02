//
//  ContentView.swift
//  MultiplicationMadness
//
//  Created by Ayo Shafau on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var table = 2
    @State private var questions = [5,10,15,20]
    @State private var questionCount = 0
    @State private var selections = false
    @State private var guessAttempt = 0
    @State private var answerTitle = ""
    @State private var showAttempt = false
    @State private var number1 = 0
    @State private var number2 = 0
    @State private var score = 0
    @State private var reset = false
    @State private var noq = 0
    
//    var number1: Int {
//        let range = table
//        return Int.random(in: 2...range)
//    }
//    
//    var number2: Int {
//        let range = table
//        return Int.random(in: 2...range)
//    }
   
    
    
    var answer: Int {
        let x = number1
        let y = number2
        return x * y
    }
    
    var body: some View {
        NavigationStack {
            Form {
                if !selections {
                    Section {
                        Stepper ("❌ : \(table)", value: $table, in: 2...12, step: 1)
                        
                        Picker ("Choose question count", selection: $questionCount){
                            ForEach(questions, id: \.self){
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        Button("Submit"){
                            selections = true
                            GenerateNums(table)
                        }
                    }
                    .padding(5)
                }
                
                if selections {
                    Section{
                        Text("\(number1) x \(number2)")
                        
                        TextField("Enter answer", value: $guessAttempt, format: .number)
                            .keyboardType(.numberPad)
                        
                        Button("Submit"){
                            Equate(guessAttempt)
                        }
                        
                    }
                    
                    
                    Text("Score: \(score) / \(questionCount)")
                }
                
            }
            .navigationTitle("Multi Madness")
        }
        .alert(answerTitle, isPresented: $showAttempt){
            Button("Continue"){
                GenerateNums(table)
            }
        }
        .alert("Done", isPresented: $reset){
            Button("Reset"){
                Reset()
            }
        } message: {
            Text("Score is \(score)")
        }
    }
    func GenerateNums(_ range: Int){
        if noq >= questionCount{
            
            reset = true
        }
        
        number1 = Int.random(in: 2...table)
        number2 = Int.random(in: 2...table)
    
        noq += 1
    }
    
    
    func Equate(_ guess: Int){
        if guess == answer {
            answerTitle = "Correct"
            score += 1
        } else {
            answerTitle = "Wrong, answer is \(answer)"
        }
        
        showAttempt = true
    }

    func Reset(){
        selections = false
        score = 0
        noq = 0
        questionCount = 0
        reset = false
    }

}

#Preview {
    ContentView()
}
