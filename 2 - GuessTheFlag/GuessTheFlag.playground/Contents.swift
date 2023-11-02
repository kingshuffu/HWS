//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ayo Shafau on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
      ZStack {
            VStack{
                Color(red: 1, green: 0.8, blue: 0)
                Color.secondary
                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
                Color.indigo
            }
            Text("Content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThickMaterial)
            
        }
        .ignoresSafeArea()

        LinearGradient(gradient: Gradient(stops: [
            .init(color: .white, location: 0.45),
            .init(color: .black, location: 0.55)
        ]), startPoint: .top, endPoint: .bottom)

        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
        AngularGradient(gradient: Gradient(colors: [.blue, .red, .green, .yellow, .orange]), center: .center)
        
        
        Button("Delete Selection", role: .destructive, action: executeDelete)
        
        VStack {
            Button("Button Uno"){ }
                .buttonStyle(.bordered)
            Button("Button Dos", role: .destructive){ }
                .buttonStyle(.bordered)
            Button("Button Tres"){ }
                .buttonStyle(.borderedProminent)
            Button("Button Quatre", role: .destructive){ }
                .buttonStyle(.borderedProminent)
            Button {
                print("tapped")
                showingAlert = true
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.gray)
            } .alert("Important message ⚠️", isPresented: $showingAlert) {
                Button("delete", role: .destructive){ }
                Button("cancel", role: .cancel){ }
            } message: {
                Text("Listen to this track BITCH!!!")
            }
            Button {
                print("Edit buttn was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
         //   .renderingMode(.original)
        }
        
        
    }
    
    func executeDelete() {
        print("Now deleting")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
