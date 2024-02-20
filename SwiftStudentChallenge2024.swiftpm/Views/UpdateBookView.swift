//
//  UpdateBookView.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 20/02/24.
//

import SwiftUI
import SwiftData
import Foundation

struct UpdateBookView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isPresented = false
    
    @Bindable var book: Book
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Details") {
                    LabeledContent {
                        TextField("Book title", text: $book.title)
                    } label: {
                      Text("Book title")
                            .padding(.trailing)
                    }
                    
                    LabeledContent {
                        TextField("Author", text: $book.author)
                    } label: {
                      Text("Author")
                            .padding(.trailing)
                    }
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
            .navigationTitle("Editing \(book.title)")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") { dismiss() }
                }
            }
        }
        
    }
    
    func convertColorToString(bookColor: Color) -> String{
        let bookColorString = bookColor.toHex()
        return bookColorString
    }
}
