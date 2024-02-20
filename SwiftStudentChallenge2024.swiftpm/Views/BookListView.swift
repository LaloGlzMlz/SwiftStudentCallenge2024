//
//  BookListView.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 11/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct BookListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Book.dateCreated, order: .reverse) var books: [Book]
    @State private var bookToEdit: Book?
    @State private var isEditing = false
    
    var body: some View {
        List {
            Section("Swipe left to edit or delete connections") {
                ForEach(books) { book in
                    BookListCell(book: book)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                context.delete(book)
                            }
                            
                            Button("Edit") {
                                // Perform action 1
                                bookToEdit = book
                                isEditing = true
                            }
                            .tint(.yellow)
                        }
                }
            }
        }
        .sheet(item: $bookToEdit, onDismiss: {
            if isEditing {
                // Show update sheet when yellow edit button is tapped
                isEditing = false // Reset the flag
            }
        }) { book in
            UpdateBookView(book: book)
        }
    }
}
