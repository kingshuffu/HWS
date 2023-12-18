//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Ayo Shafau on 11/14/23.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
