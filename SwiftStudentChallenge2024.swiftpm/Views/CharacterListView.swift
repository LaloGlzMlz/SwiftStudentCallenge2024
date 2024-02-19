//
//  CharacterListView.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 15/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct CharacterListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Character.name) var characters: [Character]
    @State private var characterToEdit: Character?
    
    let book: Book
    
    var body: some View {
        List {
            Section("Swipe left to delete connections") {
                ForEach(characters) { character in
                    if character.book == book.title {
                        CharacterListCell(character: character)
                            .onTapGesture {
                                characterToEdit = character
                            }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(characters[index])
                    }
                }
            }
        }
    }
}
