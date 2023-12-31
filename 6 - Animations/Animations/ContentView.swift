//
//  ContentView.swift
//  Animations
//
//  Created by Ayo Shafau on 9/26/23.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var animationAmount = 0.0
    //@State private var enabled = false
    //@State private var dragAmount = CGSize.zero
    
//    let letters = Array("Hello, SwiftUI")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    
    var body: some View {
/*        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                .transition(.pivot)
            
            if isShowingRed{
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation{
                isShowingRed.toggle()
            }
        }
*/
        

        VStack {
            Button("Tap Me"){
                withAnimation{
                    isShowingRed.toggle()
                }
            }
            if isShowingRed{
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }

        
/*
        HStack(spacing: 0){
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 20),                   value: dragAmount
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged{ dragAmount = $0.translation}
                .onEnded{ _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        
        
        )
        
*/
        
/*
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{ dragAmount = $0.translation}
                    .onEnded{ _ in
                        withAnimation{
                            dragAmount = .zero
                        }
                    }
            )
*/
        
//            .animation(.spring(), value: dragAmount)
            

/*
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
*/
    
/*
        Button("Tap Me"){
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .rotation3DEffect(
            .degrees(animationAmount),axis: (x: 0.0, y: 1.0, z: 0.0))
*/
        
/*        print(animationAmount)
        
        return VStack{
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me"){
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .scaleEffect(animationAmount)
            
        }
*/
        
       Button("Tap Me "){
            //animationAmount += 1
            //do nothing
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 2)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
    }
 
    }
}

#Preview {
    ContentView()
}
