//
//  ContentView.swift
//  Milestone5
//
//  Created by Ayo Shafau on 12/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack{
            List(users){ user in
                HStack {
                    Text(user.name)
                    
                    Spacer ()
                    
                    Text(user.isActive ? "🟢" : " ")
                }
                
            }
            .task {
                await loadData()
            }
            .navigationTitle("Users 👥")
        }
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: data){
                users = decodedUsers
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
