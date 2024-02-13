//
//  ColorFunctions.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 09/02/24.
//

import Foundation
import SwiftUI
import UIKit

extension Color {
    
    // Function to convert from hex string to color type
    static func fromHex(_ hex: String) -> Color {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
    
    // Function to convert from color type to hex string
    func toHex() -> String {
            guard let components = UIColor(self).cgColor.components else { return "" }
            
            let red = components[0]
            let green = components[1]
            let blue = components[2]
            
            let hexString = String(format: "#%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255))
            
            return hexString
        }
}
