import SwiftUI
import SwiftData
@available(iOS 17, *)

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var isShowingItemSheet = false
    @State private var bookToEdit: Book?
//    @Binding var color: Color
    
    @Query(sort: \Book.dateCreated, order: .reverse) var books: [Book]
    
    let columnLayout = Array(repeating:
                                GridItem(), count: 2)
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: columnLayout) {
                        ForEach(books) { book in
                            BookCard(book: book)
                                .onTapGesture {
                                    bookToEdit = book
                                }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Books")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) { AddBookSheet() }
            .sheet(item: $bookToEdit) { book in
                UpdateBookSheet(book: book)
            }
            .toolbar {
                if !books.isEmpty {
                    Button("Add book", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if books.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No books added", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Add some books to see them listed here.")
                    }, actions: {
                        Button("Add book") { isShowingItemSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}
