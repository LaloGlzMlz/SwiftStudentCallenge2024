//
//  SwiftUIView.swift
//  
//
//  Created by Eduardo Gonzalez Melgoza on 14/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct BookDetailView: View {
    @Environment(\.modelContext) private var context
    
    @State private var showingAddCharacterSheet = false
    @State private var showingCharactersListSheet = false
    
    @Query(sort: \Character.name) var characters: [Character]
    
    let columnLayout = Array(repeating: GridItem(), count: 1)
    let book: Book
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(characters) { character in
                        if character.book == book.title {
                            CharacterCard(character: character)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(book.title)
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showingAddCharacterSheet) { AddCharacterSheet(book: book) }
            .toolbar {
                if !characters.isEmpty {
                    Button("Edit") {
                        showingCharactersListSheet.toggle()
                    }
                    .sheet(isPresented: $showingCharactersListSheet) {
                        CharactersListView()
                    }
                    Button("Add character", systemImage: "plus") {
                        showingAddCharacterSheet = true
                    }
                }
            }
            .overlay {
                if characters.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No characters added", systemImage: "person")
                    }, description: {
                        Text("Add some characters to see them listed here.")
                    }, actions: {
                        Button("Add character") { showingAddCharacterSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}
