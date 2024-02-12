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
                    Text(book.bookColor)
                    Text(formatDate(book.dateCreated))
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,30)
        }
        .swipeActions {
            Text("Hi")
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
