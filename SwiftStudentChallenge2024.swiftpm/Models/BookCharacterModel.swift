//
//  BookCharacterModel.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 13/02/24.
//

import Foundation
import SwiftData



@Model
final class BookCharacter : Identifiable {
    var name: String = ""
    var desc: String = ""
    var book: String = ""
    var characterColor: String = ""
    var icon: String = ""
    
    init(name: String, desc: String, book: String, characterColor: String, icon: String) {
        self.name = name
        self.desc = desc
        self.book = book
        self.characterColor = characterColor
        self.icon = icon
    }
}
