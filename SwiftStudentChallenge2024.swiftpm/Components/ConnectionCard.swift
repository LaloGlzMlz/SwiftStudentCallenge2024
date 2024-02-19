//
//  ConnectionCard.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 19/02/24.
//

import SwiftUI
@available(iOS 17, *)

struct ConnectionCard: View {
    let book: Book
    let character: Character // character to send: connected character
    let connection: Connection
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 150)
                .foregroundColor(convertStringToColor(bookColorString: character.characterColor))
            HStack {
                Image(systemName: character.icon)
                    .font(.system(size: 62))
                    .opacity(0.7)
                    .foregroundColor(.white)
                VStack {
                    Text(character.name)
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding()
                    Text(connection.isTo)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
    }
    
    
}
