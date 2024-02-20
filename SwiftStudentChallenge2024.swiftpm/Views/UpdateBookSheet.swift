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
    @State private var author: String = ""
    @State private var bookColor = Color.cyan
    @State private var bookColorString = ""
    @State private var icon = ""
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Book title", text: $book.title)
                    TextField("Book title", text: $book.author)
                }
                Section("Icon") {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: book.icon)
                            .font(.title) // Adjust the font size if needed
                            .sheet(isPresented: $isPresented, content: {
                                SymbolsPicker(selection: $book.icon, title: "Pick a symbol", autoDismiss: true)
                            })
                            .foregroundStyle(Color.black)
                            .padding()
                    }
                }
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

