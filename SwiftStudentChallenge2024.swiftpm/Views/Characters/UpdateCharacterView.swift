//
//  UpdateCharacterView.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 20/02/24.
//

import SwiftUI
import SwiftData
import Foundation

struct UpdateCharacterView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Query(sort: \Connection.relatedCharacter) var connections: [Connection]
    
    @State private var isPresented = false
    @State private var thisCharFilteredConnections: [Connection] = []
    @State private var relatedCharsFilteredConnections: [Connection] = []
    
    @Bindable var character: BookCharacter
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    LabeledContent {
                        TextField("Character name", text: $character.name)
                            .textInputAutocapitalization(.words)
                    } label: {
                      Text("Name")
                            .padding(.trailing, 114)
                    }
                    
                    LabeledContent {
                        TextField("Character description", text: $character.desc)
                            .textInputAutocapitalization(.sentences)
                    } label: {
                      Text("Description")
                            .padding(.trailing, 70)
                    }
                }
                
                Section {
                    LabeledContent {
                        Button(action: {
                            isPresented.toggle()
                        }) {
                            Image(systemName: character.icon)
                                .font(.title)
                                .sheet(isPresented: $isPresented, content: {
                                    SymbolsPicker(selection: $character.icon, title: "Pick a symbol", autoDismiss: true)
                                })
                                .foregroundStyle(Color.black)
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    } label: {
                      Text("Icon")
                            .padding(.trailing)
                    }
//                    ForEach(filteredConnections) { filtered in
//                        Text(filtered.relatedCharacter)
//                    }
                }
            }
            .navigationTitle("Editing \(character.name)")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") { 
                        for thisCharFilteredConnection in thisCharFilteredConnections {
                            thisCharFilteredConnection.thisCharacter = character.name
                            
                        }
                        for relatedCharFilteredConnection in relatedCharsFilteredConnections {
                            relatedCharFilteredConnection.relatedCharacter = character.name
                        }
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            thisCharFilteredConnections = connections.filter{$0.thisCharacter == character.name}
            relatedCharsFilteredConnections = connections.filter{$0.relatedCharacter == character.name}
        }
    }
}
