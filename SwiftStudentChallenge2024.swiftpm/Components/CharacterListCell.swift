//
//  CharacterListCell.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 15/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct CharacterListCell: View {
    let character: BookCharacter
    
    var body: some View {
        HStack {
            Text(character.name)
        }
    }
}

