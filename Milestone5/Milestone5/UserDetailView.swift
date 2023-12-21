//
//  UserDetailView.swift
//  Milestone5
//
//  Created by Ayo Shafau on 12/20/23.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    private var userActivity: String {
        return user.isActive ? "🟢 Online" : "❌ Offline"
    }
     
    private var registeredDateFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = dateFormatter.date(from: user.registered) else {
            return " Invalid Date"
        }
        
        return date.formatted(date: .abbreviated, time: .shortened)
    }
    var body: some View {
        
        NavigationStack {
            Spacer()

            VStack(alignment: .leading ,spacing: 10) {
                Text(userActivity).bold()
                
                Text("Age: \(user.age)")
                    .font(.subheadline)
                
                Text(user.company)
                    .font(.subheadline)
                
                Text(user.email)
                    .font(.subheadline)
                
                Text(user.address)
                    .font(.caption)
                
                Spacer()
                
                Text("About:")
                    .font(.body).bold()
                
                
                Text(user.about)
                    .font(.body)
                
                Spacer()
                Spacer()
                
                Text("Friends:")
                    .font(.subheadline).bold()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(user.friends){ friend in
                            Text(friend.name)
                                .font(.subheadline)
                        }
                    }
                    
                }
                Spacer()
                
                Text("Joined \(registeredDateFormat)")
                    .font(.caption2)
                
            }
            .navigationTitle(user.name)
            .padding()
            
        }
        
    }
}

//#Preview {
//    UserDetailView()
//}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleUser = User(
            id: "exampleID",
            isActive: false,
            name: "John Doe",
            age: 25,
            company: "Example Company",
            email: "john.doe@example.com",
            address: "123 Main Street, City, Country",
            about: "Lorem ipsum dolor sit amet...",
            registered: "2022-01-01T12:00:00Z",
            tags: ["tag1", "tag2"],
            friends: []
        )

        UserDetailView(user: exampleUser)
    }
}
