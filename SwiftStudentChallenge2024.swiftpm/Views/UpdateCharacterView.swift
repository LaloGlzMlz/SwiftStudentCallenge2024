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
    
    @State private var isPresented = false
    
    @Bindable var character: Character
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Name", text: $character.name)
                        .textInputAutocapitalization(.words)
                    TextField("Description", text: $character.desc)
                        .textInputAutocapitalization(.sentences)
                }
                
                Section("Icon") {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: character.icon)
                            .font(.title) // Adjust the font size if needed
                            .sheet(isPresented: $isPresented, content: {
                                SymbolsPicker(selection: $character.icon, title: "Pick a symbol", autoDismiss: true)
                            })
                            .foregroundStyle(Color.black)
                            .padding()
                    }
                }
            }
            .navigationTitle("Editing \(character.name)")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
