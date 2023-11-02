//
//  ContentView.swift
//  Moonshot
//
//  Created by Ayo Shafau on 10/11/23.
//

import SwiftUI


struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var toList = false
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
//                    ScrollView {
//                        LazyVGrid(columns: columns) {
//                            ForEach(missions) { mission in
//                                NavigationLink {
//                                    MissionView(mission: mission)
//                                } label: {
//                                    VStack {
//                                        Image(mission.image)
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 100, height: 100)
//                                            .padding()
//                                        VStack {
//                                            Text(mission.displayName)
//                                                .font(.headline)
//                                                .foregroundColor(.white)
//                                            
//                                            Text(mission.formattedLaunchDate)
//                                                .font(.caption)
//                                                .foregroundColor(.white.opacity(0.5))
//                                        }
//                                        .padding(.vertical)
//                                        .frame(maxWidth: .infinity)
//                                        .background(.lightBackground)
//                                    }
//                                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 10)
//                                            .stroke(.lightBackground)
//                                    )
//                                }
//                                
//                            }
//                            .padding([.horizontal, .bottom])
//                        }
//                    }
            
            Group {
                if toList == true {
                    ListMainView(astronauts: astronauts, missions: missions)
                } else {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button("Switcher"){ toList.toggle() }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
