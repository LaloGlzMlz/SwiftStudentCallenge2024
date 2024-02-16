//
//  CharacterModel.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 13/02/24.
//

import Foundation
import SwiftData
@available(iOS 17, *)


@Model
final class Character : Identifiable {
    var name: String = ""
    var desc: String = ""
    var book: String = ""
    var characterColor: String = ""
    var icon: String = ""
//    var dateCreated: Date
    
    init(name: String, desc: String, book: String, characterColor: String, icon: String) {
        self.name = name
        self.desc = desc
        self.book = book
        self.characterColor = characterColor
        self.icon = icon
    }
}
