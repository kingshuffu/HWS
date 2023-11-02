//
//  Crew.swift
//  Moonshot
//
//  Created by Ayo Shafau on 10/21/23.
//

import SwiftUI

struct Crew: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [CrewMember]
    let mission: Mission
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false){
                ForEach(crew, id:\.role){ CrewMember in
                    NavigationLink {
                        AstronautView(astronaut: CrewMember.astronaut)
                    } label: {
                        VStack {
                            Image(CrewMember.astronaut.id)
                                .resizable()
                                .frame(width: 150, height: 100)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading){
                                Text(CrewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(CrewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Crew")
            .background(.darkBackground)
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]){
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}


//#Preview {
//    Crew()
//}

struct Crew_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] =
    Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        Crew(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
