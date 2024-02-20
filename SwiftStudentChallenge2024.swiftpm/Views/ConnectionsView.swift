//
//  ConnectionsView.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 18/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct ConnectionsView: View {
    @Environment(\.modelContext) private var context
    
    @State private var showingAddConnectionSheet = false
    @State private var showingConnectionListSheet = false
    
    @Query(sort: \Connection.thisCharacter) var connections: [Connection]
    @Query(sort: \Character.name) var allCharacters: [Character]
    
    let character: Character
    let book: Book
    
    var body: some View {
        let plusImage = Image(systemName: "plus").resizable()
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(connections) { connection in
                        if connection.thisCharacter == character.name {
                            HStack {
                                ForEach(allCharacters) { characterFromAll in
                                    if connection.relatedCharacter == characterFromAll.name {
                                        ConnectionCard(book: book, character: characterFromAll, connection: connection)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("\(character.name) - connections")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showingAddConnectionSheet) { AddConnectionSheet(character: character, book: book) }
            .toolbar {
                if !connections.isEmpty {
                    Button("Edit") {
                        showingConnectionListSheet.toggle()
                    }
                    .sheet(isPresented: $showingConnectionListSheet) {
                        ConnectionListView(character: character)
                    }
                    Button(action: {
                        showingAddConnectionSheet = true
                    }) {
                        plusImage
                            .frame(width: 18, height: 18)
                    }
                }
            }
            .overlay {
                if !connections.contains(where: { $0.thisCharacter == character.name }) {
                    ContentUnavailableView(label: {
                        Label("No connection to other characters added", systemImage: "person.line.dotted.person.fill")
                    }, description: {
                        Text("Add connections to this character to see them listed here.")
                    }, actions: {
                        Button("Add connection") { showingAddConnectionSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
    
    //    func filterConnections() {
    //
    //    }
}
