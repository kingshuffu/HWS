//
//  ContentView.swift
//  WordScramble
//
//  Created by Ayo Shafau on 9/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var score = 0
    @State private var mutliplier = 0
    @FocusState private var focusField: Bool
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .focused($focusField)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) {word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit { addNewWord() }
            .onAppear(perform: startGame)
            .toolbar{
                HStack{
                    Text("Score: \(score)")
                    Button("New Game"){ reset() }
                }
            }
            .alert(errorTitle, isPresented: $showingError){
                Button("OK", role: .cancel){ }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 3 else {
            wordError(title: "Word too short", message: "Make word longer")
            return
        }
        
        guard !(answer==rootWord) else {
            wordError(title: "Word same as root", message: "Cannot use same word")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word already used", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't just spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't make up that word!")
            return
        }
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        switch usedWords.count {
        case 0...3:
            score += 10
        case 4...6:
            score += 20
        case 6...9:
            score += 30
        default:
            score += 50
        }
        score += answer.count
        newWord = ""
        focusField = true

    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func reset() {
        startGame()
        usedWords = []
        score = 0
    }
    
            
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
