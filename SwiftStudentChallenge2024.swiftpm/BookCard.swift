//
//  BookCardView.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 08/02/24.
//

import SwiftUI
import SwiftData
@available(iOS 17, *)

struct BookCard: View {
    let book: Book
    
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
                    Text(book.title)
                        .foregroundColor(.white)
                        .padding()
                        .font(.system(size: 26))
                        .bold()
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
    }
}
