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
            RoundedRectangle(cornerRadius: 25)
                    .frame(height: 150)
                    .foregroundColor(Color.black.opacity(0.15))
                    .offset(x: 10, y: 10)
            
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
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding(.leading, 15)
                    Text(connection.isTo)
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
        .padding()
    }
    
    
}
