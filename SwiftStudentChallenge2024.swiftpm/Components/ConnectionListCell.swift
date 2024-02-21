//
//  ConnectionListCell.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 19/02/24.
//

import SwiftUI
import SwiftData


struct ConnectionListCell: View {
    let connection: Connection
    
    var body: some View {
        HStack {
            Text(connection.relatedCharacter)
        }
    }
}
