//
//  AddBookSheet.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 08/02/24.
//

import SwiftUI
import SwiftData
import Foundation

struct AddBookSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var bookColor = Color.blue
    @State private var bookColorString = ""
    @State private var icon = "text.book.closed.fill"
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    LabeledContent {
                      TextField("Book title", text: $title)
                            .textInputAutocapitalization(.words)
                    } label: {
                      Text("Book title")
                            .padding(.trailing, 50)
                    }
                    
                    LabeledContent {
                      TextField("Author", text: $author)
                            .textInputAutocapitalization(.words)
                    } label: {
                      Text("Author")
                            .padding(.trailing, 70)
                    }
                }
                
                Section {
                    ColorPicker(
                        "Color (color cannot be changed later)",
                        selection: $bookColor,
                        supportsOpacity: false
                    )
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                }
                
                Section {
                    LabeledContent {
                        Button(action: {
                            isPresented.toggle()
                        }) {
                            Image(systemName: icon)
                                .font(.title)
                                .sheet(isPresented: $isPresented, content: {
                                    SymbolsPicker(selection: $icon, title: "Pick a symbol", autoDismiss: true)
                                })
                                .foregroundStyle(Color.black)
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    } label: {
                      Text("Icon")
                            .padding(.trailing)
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
                        let book = Book (
                            title: title,
                            author: author,
                            bookColor: bookColorString,
                            icon: icon,
                            dateCreated: Date()
                        )
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

