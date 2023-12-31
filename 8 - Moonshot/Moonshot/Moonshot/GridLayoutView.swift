//
//  GridLayoutView.swift
//  Moonshot
//
//  Created by Ayo Shafau on 10/23/23.
//

import SwiftUI

struct GridLayoutView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let astronauts: [String: Astronaut]
    let missions: [Mission]

    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
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
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                    
                }
                .padding([.horizontal, .bottom])
            }
        }
        
        
    }
}

//#Preview {
//    GridLayoutView()
//}

struct GridLayoutView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] =
    Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        GridLayoutView(astronauts: astronauts, missions: missions)
            .preferredColorScheme(.dark)
    }
}
