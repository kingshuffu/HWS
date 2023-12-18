//
//  AddBookView.swift
//  Bookworm
//
//  Created by Ayo Shafau on 11/15/23.
//

import Foundation
import SwiftUI

struct AddBookView: View {
//    @Environment(\.managedObjectContext) var moc
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var review = ""
    @State private var genre = "Fantasy"

    @State private var emptyFieldBool = false

    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    
//                    Picker("Rating", selection: $rating) {
//                        ForEach(1..<6) {
//                            Text(String($0))
//                        }
//                    }
                    
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                Section {
                    Button("Save") {
//                        let newBook = Book(context: moc)
//                        newBook.id = UUID()
//                        newBook.title = title
//                        newBook.author = author
//                        newBook.rating = Int16(rating)
//                        newBook.review = review
//                        
//                        try? moc.save()
                        let date = Date().formatted(date: .abbreviated, time: .shortened)
                        let newBook = Book(title: title.trimmingCharacters(in: .whitespacesAndNewlines), author: author.trimmingCharacters(in: .whitespacesAndNewlines), genre: genre, review: review.trimmingCharacters(in: .whitespacesAndNewlines), rating: rating, dateAdded: date)
                        if newBook.title.isEmpty || newBook.author.isEmpty || newBook.review.isEmpty {
                            emptyFieldBool = true
                        } else {
                            modelContext.insert(newBook)
                            dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Add Book")
            .alert("One or more fields is missing", isPresented: $emptyFieldBool){
                Button("Ok"){ }
            }
        }
    }
}

#Preview {
    AddBookView()
}
