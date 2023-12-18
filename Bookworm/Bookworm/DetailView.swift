//
//  DetailView.swift
//  Bookworm
//
//  Created by Ayo Shafau on 11/17/23.
//

import SwiftUI
import CoreData
import SwiftData

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
                .padding()
            
            Text("Added on \(book.dateAdded)")
                .font(.title2)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel){ }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash"){
                showingDeleteAlert = true
            }
        }
        
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Text Author", genre: "Fantasy", review: "Cool book, really awesome", rating: 4, dateAdded: Date().formatted(date: .abbreviated, time: .shortened))
        
        return DetailView(book: example)

    } catch {
        return Text("Failed to create previews: \(error.localizedDescription)")
    }
}
