//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Ayo Shafau on 12/10/23.
import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
