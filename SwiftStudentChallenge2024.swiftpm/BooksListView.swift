//
//  BooksListView.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 11/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct BooksListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Book.dateCreated, order: .reverse) var books: [Book]
    @State private var bookToEdit: Book?
    
    var body: some View {
        List {
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
