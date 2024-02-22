//
//  CharacterListView.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 15/02/24.
//

import SwiftUI
import SwiftData


struct CharacterListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \BookCharacter.name) var characters: [BookCharacter]
    @State private var characterToEdit: BookCharacter?
    @State private var isEditing = false
    
    let book: Book
    
    var body: some View {
        List {
            Section("Swipe left to edit or delete characters") {
                ForEach(characters) { character in
                    if character.book == book.title { // comment this condition to show all
                        CharacterListCell(character: character)
                            .swipeActions {
                                Button("Delete", role: .destructive) {
                                    context.delete(character)
                                }
                                
                                Button("Edit") {
                                    characterToEdit = character
                                    isEditing = true
                                }
                                .tint(.yellow)
                            }
                    }
                }
            }
        }
        .sheet(item: $characterToEdit, onDismiss: {
            if isEditing {
                // Show update sheet when yellow edit button is tapped
                isEditing = false // Reset the flag
            }
        }) { character in
            UpdateCharacterView(character: character)
        }
    }
}
