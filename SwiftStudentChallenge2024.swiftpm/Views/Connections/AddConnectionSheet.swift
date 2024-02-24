//
//  AddConnectionSheet.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 18/02/24.
//

import SwiftUI
import SwiftData
import Foundation


struct AddConnectionSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Query(sort: \BookCharacter.name) var characters: [BookCharacter]
    
    @State private var relatedCharacter: String = ""
    @State private var isTo: String = ""
    @State private var selectedOption = ""
    @State private var filteredCharacters: [BookCharacter] = []
    
    @State private var bidireccionalConnectionToggle = true
    @State private var otherSideCharacter: [BookCharacter] = []
    @State private var otherWayConnectionType: String = ""
    
    let character: BookCharacter
    let book: Book
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    
                    Picker("Select a character that is related to \(character.name)", selection: $selectedOption) {
                        ForEach(filteredCharacters) { character in
                            Text(character.name).tag(character.name)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selectedOption) {
                        otherSideCharacter = filteredCharacters.filter{$0.name == selectedOption}
                        print(otherSideCharacter)
                    }
                    
                    Toggle("Two-way connection?", isOn: $bidireccionalConnectionToggle)
                    
                    LabeledContent {
                        TextField("Connection type", text: $isTo)
                            .textInputAutocapitalization(.sentences)
                    } label: {
                        Text("\(selectedOption) is \(character.name)'s")
                            .padding(.trailing, 50)
                    }
                    
                    if bidireccionalConnectionToggle {
                        
                        LabeledContent {
                            TextField("Other way", text: $otherWayConnectionType)
                                .textInputAutocapitalization(.sentences)
                        } label: {
                            Text("\(character.name) is \(selectedOption)'s")
                                .padding(.trailing, 50)
                        }
                    }
                }
                Section {
                    Text("\(character.name) ").bold() +
                    Text("is ") +
                    Text("\(selectedOption)").bold() +
                    Text("'s ") +
                    Text("\(otherWayConnectionType)").bold() +
                    Text(", and ") +
                    Text("\(selectedOption) ").bold() +
                    Text("is ") +
                    Text("\(character.name)").bold() +
                    Text("'s ") +
                    Text("\(isTo.lowercased())").bold()
                }
            }
            .onAppear {
                // Obtain only characters who's book equals the book tapped in the beginning
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
                        let connection = Connection (
                            relatedCharacter: selectedOption,
                            isTo: isTo,
                            thisCharacter: character.name
                        )
                        let otherWayConnection = Connection (
                            relatedCharacter: character.name,
                            isTo: otherWayConnectionType,
                            thisCharacter: otherSideCharacter[0].name
                        )
                        context.insert(connection)
                        context.insert(otherWayConnection)
                        dismiss()
                    }
                }
            }
        }
    }
}

