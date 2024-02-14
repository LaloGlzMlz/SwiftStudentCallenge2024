//
//  CharacterCardView.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 07/02/24.
//

import SwiftUI


@available(iOS 17, *)
struct CharacterCard: View {
    let character: Character
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 150)
                .foregroundColor(Color.blue)
            HStack {
//                Image(systemName: book.icon)
//                    .font(.system(size: 62))
//                    .opacity(0.7)
//                    .foregroundColor(.white)
                VStack {
                    Text(character.name)
                        .foregroundColor(.white)
                        .font(.system(size: 28))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding()
                    Text(character.desc)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Text(character.book)
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
