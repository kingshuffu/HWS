//
//  ListMainView.swift
//  Moonshot
//
//  Created by Ayo Shafau on 10/22/23.
//

import SwiftUI

struct ListMainView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List(missions){mission in
            NavigationLink{
                MissionView(mission: mission)
            } label: {
                VStack {
//                    Image(mission.image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .padding()
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.lightBackground)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain) // Makes the list take the full width of the screen
    }
    
}

struct ListMainView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] =
    Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        ListMainView(astronauts: astronauts, missions: missions)
            .preferredColorScheme(.dark)
    }
}
