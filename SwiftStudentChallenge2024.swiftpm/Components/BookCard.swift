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
    
    //    @State private var color: Color?
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 150)
                .foregroundColor(convertStringToColor(bookColorString: book.bookColor))
            HStack {
                VStack {
                    Text(book.title)
                        .foregroundColor(.white)
                        .font(.system(size: 36))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .padding()
                    Text(book.author)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
        .contextMenu {
            Button("Delete!") {
                print("Deleting...")
            }
            Button(action: {
                // Perform action 1
            }) {
                Label("Delete", systemImage: "trash")
                    .foregroundStyle(.red)
            }
        }
    }
    
    func convertStringToColor(bookColorString: String) -> Color {
        let bookColor = Color.fromHex(bookColorString)
        return bookColor
    }
}
