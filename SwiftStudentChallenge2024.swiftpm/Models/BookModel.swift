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
final class Book : Identifiable {
    var title: String
    var author: String
    var mainCharacters: String
    var bookColor: String
    var dateCreated: Date
    
    init(title: String, author: String, mainCharacters: String, bookColor: String, dateCreated: Date) {
        self.title = title
        self.author = author
        self.mainCharacters = mainCharacters
        self.bookColor = bookColor
        self.dateCreated = Date()
    }
}
