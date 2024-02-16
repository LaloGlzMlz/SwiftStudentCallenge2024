//
//  SwiftUIView.swift
//  
//
//  Created by Eduardo Gonzalez Melgoza on 15/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct CharactersListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Character.name) var characters: [Character]
    @State private var characterToEdit: Character?
    
    var body: some View {
        List {
            ForEach(characters) { character in
                CharacterListCell(character: character)
                    .onTapGesture {
                        characterToEdit = character
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
