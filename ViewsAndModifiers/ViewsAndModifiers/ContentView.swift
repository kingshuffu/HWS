//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ayo Shafau on 9/13/23.
//

import SwiftUI

/*
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View{
        modifier(Watermark(text: text))
    }
}
*/

/* struct CapsuleText: View {
    var text: String
    
    var body: some View{
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
    
}
*/

/* struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
*/

struct GridStack<Content: View>: View {
    let rows: Int
    let cols: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<cols, id: \.self) { col in
                        content(row, col)
                    }
                }
            }
        }
    }
}


struct ContentView: View {
    //@State private var useRedText = false
    
    var body: some View {
/*        Button("Hello, world!"){
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
 */
        
/*        VStack(spacing: 20){
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        }
 */
 //       Text("Hello, World!")
 //           .titleStyle()
        
/*        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Ayo")
 */
        GridStack(rows: 4, cols: 4){ row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R \(row) C\(col)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
