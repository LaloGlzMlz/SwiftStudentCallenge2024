//
//  AddConnectionSheet.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 18/02/24.
//

import SwiftUI
import SwiftData
import Foundation
@available(iOS 17, *)

struct AddConnectionSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var relatedCharacter: String = ""
    @State private var isTo: String = ""
    @State private var selectedOption = ""
    
    let character: Character
    let book: Book
    
    @Query(sort: \Character.name) var characters: [Character]
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    Picker("Select an option", selection: $selectedOption) {
                        ForEach(characters) { character in
                            if character.book == book.title {
                                Text(character.name).tag(character.name)
                            }
                        }
                    }
                    .pickerStyle(.menu)
//                    Text("Selected option: \(selectedOption)")
                    TextField("Is a/an to this character", text: $isTo)
                        .textInputAutocapitalization(.sentences)
                }
            }
            .navigationTitle("New connection")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let connection = Connection(
                            relatedCharacter: selectedOption,
                            isTo: isTo,
                            thisCharacter: character.name
                        )
                        context.insert(connection)
                        dismiss()
                    }
                }
            }
        }
        .onAppear{
            selectedOption = character.name
        }
    }
}

