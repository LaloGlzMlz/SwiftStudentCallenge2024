//
//  BookCardView.swift
//  SwiftStudentChallenge2024
//
//  Created by Eduardo Gonzalez Melgoza on 08/02/24.
//

import SwiftUI
import SwiftData
//@available(iOS 17, *)

struct BookCard: View {
    let book: Book
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 150)
                .foregroundColor(convertStringToColor(bookColorString: book.bookColor))
            
            HStack {
                Image(systemName: book.icon)
                    .font(.system(size: 60))
                    .opacity(0.7)
                    .foregroundColor(.white)
                
                VStack {
                    Text(book.title)
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding()
                    Text(book.author)
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                
                Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .padding(.trailing, 20)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
    }
    
    func convertStringToColor(bookColorString: String) -> Color {
        let bookColor = Color.fromHex(bookColorString)
        return bookColor
    }
}
