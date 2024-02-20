//
//  SwiftUIView.swift
//  
//
//  Created by Eduardo Gonzalez Melgoza on 20/02/24.
//

import SwiftUI
import SwiftData
import Foundation

struct UpdateConnectionView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isPresented = false
    
    @Bindable var connection: Connection
    
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    TextField("is a/an to this character", text: $connection.isTo)
                        .textInputAutocapitalization(.sentences)
                }
            }
            .navigationTitle("Editing connection with \(connection.relatedCharacter)")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
