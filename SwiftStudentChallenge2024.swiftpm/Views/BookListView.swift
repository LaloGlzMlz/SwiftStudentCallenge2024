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
    
    var body: some View {
        List {
            Section("Swipe left to delete connections") {
                ForEach(books) { book in
                    BookListCell(book: book)
                        .onTapGesture {
                            bookToEdit = book
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(books[index])
                    }
                }
            }
        }
    }
}
