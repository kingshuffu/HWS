//
//  MissionView.swift
//  Moonshot
//
//  Created by Ayo Shafau on 10/21/23.
//

import SwiftUI

struct MissionView: View {
//    struct CrewMember {
//        let role: String
//        let astronaut: Astronaut
//    }
    
    let mission: Mission
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

//    let crew: [CrewMember]

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDate)
                        .font(.caption)
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                        .padding(.top)
                    
                    VStack(alignment: .leading){
                        
                        
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        NavigationLink{
                            Crew(mission: mission, astronauts: astronauts)
                        } label: {
                            
                            Text("Crew")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                                .padding(.bottom, 5)
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(crew, id:\.role){ CrewMember in
//                                NavigationLink {
//                                    //AstronautView(astronaut: CrewMember.astronaut)
//                                } label: {
//                                    HStack {
//                                        Image(CrewMember.astronaut.id)
//                                            .resizable()
//                                            .frame(width: 104, height: 72)
//                                            .clipShape(Capsule())
//                                            .overlay(
//                                                Capsule()
//                                                    .strokeBorder(.white, lineWidth: 1)
//                                            )
//                                        
//                                        VStack(alignment: .leading){
//                                            Text(CrewMember.astronaut.name)
//                                                .foregroundColor(.white)
//                                                .font(.headline)
//                                            
//                                            Text(CrewMember.role)
//                                                .foregroundColor(.secondary)
//                                        }
//                                    }
//                                    .padding(.horizontal)
//                                }
//                            }
//                        }
//                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
        
    init(mission: Mission){
        self.mission = mission
        
//        self.crew = mission.crew.map { member in
//            if let astronaut = astronauts[member.name] {
//                return CrewMember(role: member.role, astronaut: astronaut)
//            } else {
//                fatalError("Missing \(member.name)")
//            }
//        }
    }
}


struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] =
    Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}
