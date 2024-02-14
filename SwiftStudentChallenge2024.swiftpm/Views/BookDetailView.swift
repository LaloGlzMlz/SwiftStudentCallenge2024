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
    
    @Query(sort: \Character.name) var characters: [Character]
    
    let columnLayout = Array(repeating: GridItem(), count: 2)
    let book: Book
    
    var body: some View {
        Text(book.title)
        
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(characters) { character in
                        CharacterCard(character: character)
                    }
                }
            }
            .sheet(isPresented: $showingAddCharacterSheet) { AddCharacterSheet() }
            .toolbar {
                if !characters.isEmpty {
//                    Button("Edit") {
//                        showingBooksListSheet.toggle()
//                    }
//                    .sheet(isPresented: $showingBooksListSheet) {
//                        BooksListView()
//                    }
                    Button("Add book", systemImage: "plus") {
                        showingAddCharacterSheet = true
                    }
                }
            }
            .overlay {
                if characters.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No characters added", systemImage: "list.bullet.rectangle.portrait")
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
