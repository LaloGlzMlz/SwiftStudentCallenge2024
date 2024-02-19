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
    
    var body: some View {
        List {
            Section("Swipe left to delete connections") {
                ForEach(connections) { connection in
                    ConnectionListCell(connection: connection)
                        .onTapGesture {
                            connectionToEdit = connection
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(connections[index])
                    }
                }
            }
        }
    }
}
