//
//  ContentView.swift
//  Moonshot
//
//  Created by Ayo Shafau on 10/11/23.
//

import SwiftUI

struct CustomText: View {
    
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String){
        print("Creating a new CustomText")
        self.text = text
    }
    
}


struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


struct ContentView: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]

    var body: some View {
        
/*
        Image("IMG_1273")
            .resizable()
            .scaledToFit( )
*/
 
 /*       ScrollView(.horizontal){
            LazyHStack(spacing: 10) {
                
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
 */
/*
        NavigationView {
            List(0..<100){ row in
                
                NavigationLink{
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
                .navigationTitle("SwiftUI")
            }
        }
*/
/*
        Button("Decode JSON"){
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)

            if let user = try? JSONDecoder().decode(User.self, from: data){
                print(user.address.street)
            }
        }
        
*/
/*
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000){
                    Text("Item \($0)")
                }
            }
        }
*/
        
    }
}

#Preview {
    ContentView()
}
