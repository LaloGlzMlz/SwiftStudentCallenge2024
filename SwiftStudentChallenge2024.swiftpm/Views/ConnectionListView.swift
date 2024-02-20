//
//  ConnectionListView.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 19/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct ConnectionListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Connection.relatedCharacter) var connections: [Connection]
    @State private var connectionToEdit: Connection?
    @State private var isEditing = false
    
    let character: Character
    
    var body: some View {
        List {
            Section("Swipe left to delete connections") {
                ForEach(connections) { connection in
                    if character.name == connection.thisCharacter { // comment this condition to show all
                        ConnectionListCell(connection: connection)
                            .swipeActions {
                                Button("Delete", role: .destructive) {
                                    context.delete(connection)
                                }
                                
                                Button("Edit") {
                                    connectionToEdit = connection
                                    isEditing = true
                                }
                                .tint(.yellow)
                            }
                    }
                }
            }
        }
        .sheet(item: $connectionToEdit, onDismiss: {
            if isEditing {
                // Show update sheet when yellow edit button is tapped
                isEditing = false // Reset the flag
            }
        }) { connection in
            UpdateConnectionView(connection: connection)
        }
    }
}
