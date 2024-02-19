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

// Switch between one and two columns view if iPad or otherwise is
// executing the app
var columnLayout: [GridItem] {
    if UIDevice.current.userInterfaceIdiom == .pad {
        return [GridItem(), GridItem()]
    } else {
        return [GridItem(.flexible())]
    }
}
