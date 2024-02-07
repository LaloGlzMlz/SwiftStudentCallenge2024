//
//  CharacterCardView.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 07/02/24.
//

import SwiftUI

struct CharacterCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 150)
                .foregroundColor(.red)
            HStack {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 62))
                    .opacity(0.7)
                    .foregroundColor(.white)
                VStack {
                    Text("Hello, World!")
                        .foregroundColor(.white)
                        .padding()
                        .font(.system(size: 24))
                        .bold()
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
    }
}

#Preview {
    CharacterCardView()
}
