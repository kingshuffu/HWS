//
//  Task.swift
//  Traqer1
//
//  Created by Ayo Shafau on 11/4/23.
//

import Foundation

struct Tasq: Codable, Identifiable, Equatable{
    var id = UUID()
    var title: String
    var desc: String
    var isCompleted: Bool
    
}

