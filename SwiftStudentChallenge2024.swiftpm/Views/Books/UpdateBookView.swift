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
                Section {
                    LabeledContent {
                        TextField("Book title", text: $book.title)
                            .textInputAutocapitalization(.words)
                    } label: {
                      Text("Book title")
                            .padding(.trailing, 50)
                    }
                    
                    LabeledContent {
                        TextField("Author", text: $book.author)
                            .textInputAutocapitalization(.words)
                    } label: {
                      Text("Author")
                            .padding(.trailing, 70)
                    }
                }
                
                Section {
                    LabeledContent {
                        Button(action: {
                            isPresented.toggle()
                        }) {
                            Image(systemName: book.icon)
                                .font(.title)
                                .sheet(isPresented: $isPresented, content: {
                                    SymbolsPicker(selection: $book.icon, title: "Pick a symbol", autoDismiss: true)
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
            .navigationTitle("Editing \(book.title)")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
        
    }
    
    func convertColorToString(bookColor: Color) -> String{
        let bookColorString = bookColor.toHex()
        return bookColorString
    }
}
