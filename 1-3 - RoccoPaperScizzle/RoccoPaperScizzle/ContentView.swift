//
//  ContentView.swift
//  RoccoPaperScizzle
//
//  Created by Ayo Shafau on 9/14/23.
//

import SwiftUI




struct ContentView: View {
    
    @State private var cpuChoice = Int.random(in: 0..<3)
    @State private var winOrLose = Bool.random()
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var reset = false
    @State private var userScore = 0
    @State private var questionCount = 1
    
    let choices = ["🪨", "📄", "✂️"]
    
    var gameResults: String {
        let cpuChoice = choices[cpuChoice]
        var gameWin = ""
        var gameLose = ""
        
        switch cpuChoice {
        case "🪨":
            gameWin = choices[1]
            gameLose = choices[2]
        case "📄":
            gameWin = choices[2]
            gameLose = choices[0]
        case "✂️":
            gameWin = choices[0]
            gameLose = choices[1]
        default:
            gameWin = ""
            gameLose = ""
        }
        
        if winOrLose {
            return gameWin
        } else {
            return gameLose
        }
    }

    var body: some View {
        ZStack {
            Color(red: 0, green: 0.13, blue: 0.25)
                .ignoresSafeArea()

            
            VStack (spacing: 20) {
                Text("🪨 - 📄 - ✂️")
                    .font(.largeTitle)
                    .frame(width: 300, height: 100)
                    .background(.thinMaterial.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                
                Spacer()
                HStack(spacing: 15){
                    Text(choices[cpuChoice])
                        .font(.system(size: 45))
                        .shadow(radius: 3)
                    Text(winOrLose ? "✅" : "❌")
                        .font(.system(size: 45).bold())
                        .shadow(radius: 3)

                }
                .frame(width: 150, height: 100)
                .background(.thinMaterial.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)

                
                Spacer()
                
                ForEach(0..<3) {choice in
                    Button{
                        UserPress(choice)
                    } label: {
                        Text(choices[choice])
                            .font(.system(size: 45))
                            .shadow(radius: 3)
                            .frame(width: 150, height: 100)
                    }
                }
                .background(.thinMaterial.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)

                Spacer()
                
                Text("Score: \(userScore) / 10")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(.white)
            }
            .padding()
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: question)
            } message: {
                Text("Score \(userScore)")
            }
            .alert("Game Over", isPresented: $reset){
                Button("Play again", action: gameOver)
            } message: {
                Text("Final Score \(userScore) out of \(questionCount)")
            }
        }
    }
    
    func UserPress(_ choice: Int) {
        if choices[choice] == gameResults {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func question(){
        if questionCount == 10 {
            reset = true
        } else {
            winOrLose = Bool.random()
            cpuChoice = Int.random(in: 0...2)
            questionCount += 1
        }
    }
    
    func gameOver(){
        questionCount = 1
        userScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
