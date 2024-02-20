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
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 150)
                .foregroundStyle(.gray)
                .offset(x: 15, y: 15)
                .opacity(0.2)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 150)
                .foregroundStyle(.gray)
                .offset(x: 10, y: 10)
                .opacity(0.2)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 150)
                .foregroundStyle(.gray)
                .offset(x: 5, y: 5)
                .opacity(0.2)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 150)
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: convertStringToColor(bookColorString: book.bookColor), location: 0.0),
                        .init(color: Color.black, location: 7.0)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
            
            HStack {
                Image(systemName: book.icon)
                    .font(.system(size: 55))
                    .opacity(0.7)
                    .foregroundStyle(.white)
                
                VStack {
                    Text(book.title)
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding(.leading, 15)
                    Text(book.author)
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                }
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .padding(.trailing, 20)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
        .padding()
    }
    
    func convertStringToColor(bookColorString: String) -> Color {
        let bookColor = Color.fromHex(bookColorString)
        return bookColor
    }
}
