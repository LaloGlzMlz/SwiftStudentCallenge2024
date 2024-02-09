//
//  CharacterModel.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 08/02/24.
//

import Foundation
import SwiftData
@available(iOS 17, *)


@Model
class Book {
    var title: String = ""
    var mainCharacters: String = ""
    var bookColor: String = ""
    var dateCreated: Date = Date()
    
    init(title: String, mainCharacters: String, bookColor: String, dateCreated: Date) {
        self.title = title
        self.mainCharacters = mainCharacters
        self.bookColor = bookColor
        self.dateCreated = dateCreated
    }
}
