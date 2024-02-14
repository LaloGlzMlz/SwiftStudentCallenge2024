//
//  AddBookSheet.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 08/02/24.
//

import SwiftUI
import SwiftData
import Foundation
@available(iOS 17, *)

struct AddBookSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var bookColor = Color.cyan
    @State private var bookColorString = ""
    @State private var icon = "star"
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Book title", text: $title)
                        .textInputAutocapitalization(.words)
                    TextField("Author", text: $author)
                        .textInputAutocapitalization(.words)
                }
                Section("Color") {
                    ColorPicker(
                        "Color",
                        selection: $bookColor,
                        supportsOpacity: false
                    )
                }
                Section("Icon") {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: icon)
                            .font(.title) // Adjust the font size if needed
                            .sheet(isPresented: $isPresented, content: {
                                SymbolsPicker(selection: $icon, title: "Pick a symbol", autoDismiss: true)
                            })
                            .foregroundColor(Color.black)
                            .padding()
                    }
                }
            }
            .navigationTitle("New book")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        self.bookColorString = self.convertColorToString(bookColor:bookColor)
                        let book = Book(
                            title: title,
                            author: author,
                            bookColor: bookColorString,
                            icon: icon,
                            dateCreated: Date())
                        context.insert(book)
                        dismiss()
                    }
                }
            }
        }
    }
    
    func convertColorToString(bookColor: Color) -> String{
        let bookColorString = bookColor.toHex()
        return bookColorString
    }
}

