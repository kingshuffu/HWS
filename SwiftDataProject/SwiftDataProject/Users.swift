//
//  Users.swift
//  SwiftDataProject
//
//  Created by Ayo Shafau on 12/12/23.
//
import SwiftData
import SwiftUI

struct Users: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            //                NavigationLink(value: user){
            HStack{
                Text(user.name)
                
                Spacer()
                
                Text(String(user.jobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear(perform: {
            addSample()
        })
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]){
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample(){
        let user1 = User(name: "Peter Pan", city: "Miami", joinDate: .now)
        let job1 = Job(name: "Cook", priority: 3)
        let job2 = Job(name: "Cleaner", priority: 4)
        
        modelContext.insert(user1)
        
        user1.jobs.append(job1)
        user1.jobs.append(job2)

        
    }
}

#Preview {
    Users(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
