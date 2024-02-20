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
    
    @Query(sort: \Character.name) var characters: [Character]
    
    @State private var relatedCharacter: String = ""
    @State private var isTo: String = ""
    @State private var selectedOption = ""
    @State private var filteredCharacters: [Character] = []
    
    let character: Character
    let book: Book
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    Picker("Select a character that is related to \(character.name)", selection: $selectedOption) {
                        ForEach(filteredCharacters) { character in
                            Text(character.name).tag(character.name)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    TextField("is a/an to this character", text: $isTo)
                        .textInputAutocapitalization(.sentences)
                }
                
                Section() {
                    Text("The character ") +
                    Text("\(selectedOption) ").bold() +
                    Text("is ") +
                    Text("\(character.name)").bold() +
                    Text("'s ") +
                    Text("\(isTo.lowercased())").bold()
                }
            }
            .onAppear {
                filteredCharacters = characters.filter{$0.book == book.title}
                selectedOption = filteredCharacters[0].name
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
    }
}

