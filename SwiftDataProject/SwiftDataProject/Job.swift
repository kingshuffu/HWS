//
//  Job.swift
//  SwiftDataProject
//
//  Created by Ayo Shafau on 12/12/23.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}


