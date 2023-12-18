//
//  Student.swift
//  Bookworm
//
//  Created by Ayo Shafau on 11/17/23.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
 
