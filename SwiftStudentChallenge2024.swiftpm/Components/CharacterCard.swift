//
//  CharacterCardView.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 07/02/24.
//

import SwiftUI


struct CharacterCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 150)
                .foregroundColor(.red)
            HStack {
//                Image(systemName: "sun.max.fill")
//                    .font(.system(size: 62))
//                    .opacity(0.7)
//                    .foregroundColor(.white)
                VStack {
                    Text("Robert Langdon")
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                        .bold()
                        .padding()
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.leading,30)
        }
    }
    
    
}
