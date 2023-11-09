//
//  Traqer1App.swift
//  Traqer1
//
//  Created by Ayo Shafau on 11/4/23.
//

import SwiftUI

@main
struct Traqer1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(tasqManager: TasqManager())
        }
    }
}
