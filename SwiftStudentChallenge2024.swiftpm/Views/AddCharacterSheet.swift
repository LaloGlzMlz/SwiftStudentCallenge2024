//
//  AddCharacterSheet.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 14/02/24.
//


import SwiftUI
import SwiftData
import Foundation
@available(iOS 17, *)

struct AddCharacterSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var desc: String = ""
    @State private var characterColor = Color.blue
    @State private var characterColorString = ""
    @State private var icon = "person.fill"
    @State private var isPresented = false
    let book: Book
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Name", text: $name)
                        .textInputAutocapitalization(.words)
                    TextField("Description", text: $desc)
                        .textInputAutocapitalization(.sentences)
                }
                Section("Color") {
                    ColorPicker(
                        "Color",
                        selection: $characterColor,
                        supportsOpacity: false
                    )
                }
                Section("Icon") {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: icon)
                            .font(.title) // Adjust the font size if needed
                            .sheet(isPresented: $isPresented, content: {
                                SymbolsPicker(selection: $icon, title: "Pick a symbol", autoDismiss: true)
                            })
                            .foregroundStyle(Color.black)
                            .padding()
                    }
                }
            }
            .navigationTitle("New character")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        self.characterColorString = self.convertColorToString(bookColor:characterColor)
                        let character = Character (
                            name: name,
                            desc: desc,
                            book: book.title,
                            characterColor: characterColorString,
                            icon: icon
                        )
                        context.insert(character)
                        dismiss()
                    }
                }
            }
        }
    }
    
    func convertColorToString(bookColor: Color) -> String{
        let bookColorString = bookColor.toHex()
        return bookColorString
    }
}

