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
    @State private var mainCharacters: String = ""
    @State private var bookColor = Color.cyan
    @State private var bookColorString = ""
    
    var body: some View {
        NavigationStack {
            Form {
                VStack {
                    TextField("Book title", text: $title)
                    TextField("Author", text: $author
                    )
                    ColorPicker(
                        "Color",
                        selection: $bookColor,
                        supportsOpacity: false
                    )
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
                            mainCharacters: mainCharacters,
                            bookColor: bookColorString,
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

