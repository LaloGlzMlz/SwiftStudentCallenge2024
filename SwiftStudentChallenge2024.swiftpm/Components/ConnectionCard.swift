//
//  ConnectionCard.swift
//
//
//  Created by Eduardo Gonzalez Melgoza on 19/02/24.
//

import SwiftUI


struct ConnectionCard: View {
    let book: Book
    let character: BookCharacter // character to send: connected character
    let connection: Connection
    
    var body: some View {
        ZStack {
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(height: 150)
//                .foregroundStyle(LinearGradient(
//                    gradient: Gradient(stops: [
//                        .init(color: convertStringToColor(bookColorString: character.characterColor), location: 0.0),
//                        .init(color: Color.black, location: 1.0)
//                    ]),
//                    startPoint: .center,
//                    endPoint: .zero
//                ))
//                .offset(x: 5, y: 5)
//                .opacity(0.2)
            RoundedRectangle(cornerRadius: 25)
                    .frame(height: 150)
                    .foregroundColor(Color.black.opacity(0.15)) // Semi-transparent color
                    .offset(x: 10, y: 10) // Offset to create shadow effect
            
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 150)
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: convertStringToColor(bookColorString: character.characterColor), location: 0.0),
                        .init(color: Color.black, location: 3.0)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
            
            HStack {
                Image(systemName: character.icon)
                    .font(.system(size: 62))
                    .opacity(0.7)
                    .foregroundStyle(.white)
                VStack {
                    Text(character.name)
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .font(.system(size: 26))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding()
                    Text(connection.isTo)
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
        .padding()
    }
    
    
}
