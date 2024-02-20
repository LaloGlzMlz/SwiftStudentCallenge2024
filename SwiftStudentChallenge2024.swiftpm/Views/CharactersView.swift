//
//  CharactersView.swift
//  
//
//  Created by Eduardo Gonzalez Melgoza on 14/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct CharactersView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Character.name) var characters: [Character]
    
    @State private var showingAddCharacterSheet = false
    @State private var showingCharacterListSheet = false
    @State private var filteredCharacters: [Character] = []
    
    let book: Book
    
    
    var body: some View {
        let plusImage = Image(systemName: "plus").resizable() // prefedine icon to load from beginning
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(characters) { character in
                        if character.book == book.title {
                            NavigationLink(destination: ConnectionsView(character: character, book: book)) {
                                    CharacterCard(character: character)
                            }
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
                        showingCharacterListSheet.toggle()
                    }
                    .sheet(isPresented: $showingCharacterListSheet) {
                        CharacterListView(book: book)
                    }
                    Button(action: {
                        showingAddCharacterSheet = true
                    }) {
                        plusImage
                            .frame(width: 18, height: 18)
                    }
                }
            }
            .overlay {
                if !characters.contains(where: { $0.book == book.title }) {
                    ContentUnavailableView(label: {
                        Label("No characters added", systemImage: "person.3.fill")
                    }, description: {
                        Text("Add some characters to see them listed here.")
                    }, actions: {
                        Button("Add character") { showingAddCharacterSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
        .onAppear {
            filteredCharacters = characters.filter{$0.book == book.title}
        }
    }
}
