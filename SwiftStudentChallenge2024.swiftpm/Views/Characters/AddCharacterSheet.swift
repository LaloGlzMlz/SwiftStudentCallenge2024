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
                Section {
                    LabeledContent {
                      TextField("BookCharacter name", text: $name)
                            .textInputAutocapitalization(.words)
                    } label: {
                      Text("Name")
                            .padding(.trailing, 94)
                    }
                    
                    LabeledContent {
                      TextField("BookCharacter description", text: $desc)
                            .textInputAutocapitalization(.sentences)
                    } label: {
                      Text("Description")
                            .padding(.trailing, 50)
                    }
                }
                
                Section {
                    ColorPicker(
                        "Color (color cannot be changed later)",
                        selection: $characterColor,
                        supportsOpacity: false
                    )
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                }
                
                Section {
                    LabeledContent {
                        Button(action: {
                            isPresented.toggle()
                        }) {
                            Image(systemName: icon)
                                .font(.title)
                                .sheet(isPresented: $isPresented, content: {
                                    SymbolsPicker(selection: $icon, title: "Pick a symbol", autoDismiss: true)
                                })
                                .foregroundStyle(Color.black)
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    } label: {
                      Text("Icon")
                            .padding(.trailing)
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
                        let character = BookCharacter (
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

