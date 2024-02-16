//
//  UtilityFunctions.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 09/02/24.
//

import Foundation
import SwiftUI

func convertStringToColor(bookColorString: String) -> Color {
    let bookColor = Color.fromHex(bookColorString)
    return bookColor
}

func convertColorToString(bookColor: Color) -> String{
    let bookColorString = bookColor.toHex()
    return bookColorString
}
