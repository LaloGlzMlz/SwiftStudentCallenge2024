//
//  ConnectionModel.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 18/02/24.
//

import Foundation
import SwiftData
@available(iOS 17, *)

@Model
final class Connection : Identifiable {
    var relatedCharacter: String = ""
    var isTo: String = ""
    var thisCharacter: String = ""
    
    init(relatedCharacter: String, isTo: String, thisCharacter: String) {
        self.relatedCharacter = relatedCharacter
        self.isTo = isTo
        self.thisCharacter = thisCharacter
    }
}

