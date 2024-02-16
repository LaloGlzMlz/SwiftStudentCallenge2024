//
//  BookModel.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 08/02/24.
//

import Foundation
import SwiftData
@available(iOS 17, *)


@Model
final class Book : Identifiable {
    var title: String = ""
    var author: String = ""
    var bookColor: String = ""
    var icon: String = ""
    var dateCreated: Date
    
    init(title: String, author: String, bookColor: String, icon: String, dateCreated: Date) {
        self.title = title
        self.author = author
        self.bookColor = bookColor
        self.icon = icon
        self.dateCreated = dateCreated
    }
}
