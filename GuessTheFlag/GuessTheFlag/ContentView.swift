//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ayo Shafau on 9/10/23.
//

import SwiftUI

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var userReset = false
    @State private var scoreTitle = ""
    @State private var UserScore = 0
    @State private var questionCount = 1
    @State private var aniAmount = 0.0
    @State private var opaAni = 0.0
    @State private var scaleAmount = 1.0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            //LinearGradient(gradient: Gradient(colors: [.indigo, .black]), startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [
                .init(color: .indigo, location: 0.3),
                .init(color: .mint, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.heavy))
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation(.easeOut){
                                flagTapped(number)
                                aniAmount += 360
                                opaAni += 0.5
                                scaleAmount = 0
                            }
                        } label: {
                            FlagImage(image: countries[number])
                        }
                        .rotation3DEffect(
                            .degrees(aniAmount), axis: (x: 0.0, y: number == self.correctAnswer ? 1 : 0, z: 0.0))
                        .opacity(number != self.correctAnswer ? 1-opaAni : 1)
                        .scaleEffect(number != self.correctAnswer ? scaleAmount : 1)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                
                Spacer()
                Spacer()
                
                Text("Score: \(UserScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        
        .alert(scoreTitle, isPresented:  $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Score: \(UserScore)")
        }
        .alert("Game Over", isPresented: $userReset) {
            Button("Reset", action: gameover)
        } message: {
            Text("Final Score: \(UserScore) out of \(questionCount)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            UserScore += 1
        } else {
            scoreTitle = "Wrong, that flag is \(countries[number])!!!"
        }
    
        
        showingScore = true
        
    }
    func askQuestion(){
        if questionCount == 8 {
            userReset = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            questionCount += 1
        }
        scaleAmount = 1.0
        opaAni = 0.0
    }
    
    func gameover(){
        questionCount = 1
        UserScore = 0
        
        askQuestion()
    }
    
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
