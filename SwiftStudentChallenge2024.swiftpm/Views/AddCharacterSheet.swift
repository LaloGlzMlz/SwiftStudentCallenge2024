//
//  AddCharacterSheet.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 14/02/24.
//


import SwiftUI
import SwiftData
import Foundation
@available(iOS 17, *)

struct AddCharacterSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var desc: String = ""
//    @State private var book: String = ""
    let book : Book
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Name", text: $name)
                        .textInputAutocapitalization(.words)
                    TextField("Description", text: $desc)
                        .textInputAutocapitalization(.words)
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
                        let character = Character (
                            name: name,
                            desc: desc,
                            book: book.title
                        )
                        context.insert(character)
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

