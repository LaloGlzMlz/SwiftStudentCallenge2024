//
//  UpdateBookSheet.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 08/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct UpdateBookSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Bindable var book: Book
    
    @State private var title: String = ""
    @State private var mainCharacters: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Book title", text: $book.title)
//                ColorPicker("Color", selection: $bookColor)
            }
            .navigationTitle("Update book")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        dismiss()
                    }
                }
            }
        }
    }
}

