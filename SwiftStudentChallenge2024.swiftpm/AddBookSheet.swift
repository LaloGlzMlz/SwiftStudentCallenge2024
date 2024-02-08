//
//  AddBookSheet.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 08/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct AddBookSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var mainCharacters: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Book title", text: $title)
            }
            .navigationTitle("New book")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let book = Book(title: title, mainCharacters: mainCharacters)
                        context.insert(book)
                        dismiss()
                    }
                }
            }
        }
    }
}

