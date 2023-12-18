//
//  Book.swift
//  Bookworm
//
//  Created by Ayo Shafau on 11/17/23.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var dateAdded: String
    
    init(title: String, author: String, genre: String, review: String, rating: Int, dateAdded: String) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.dateAdded = dateAdded
    }
}
