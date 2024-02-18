import SwiftUI
import SwiftData
@available(iOS 17, *)

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var showingAddBookSheet = false
    @State private var showingBooksListSheet = false
    @State private var bookToEdit: Book?
    
    @Query(sort: \Book.dateCreated, order: .reverse) var books: [Book]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(books) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            BookCard(book: book)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Books")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showingAddBookSheet) { AddBookSheet() }
            .toolbar {
                if !books.isEmpty {
                    Button("Edit") {
                        showingBooksListSheet.toggle()
                    }
                    .sheet(isPresented: $showingBooksListSheet) {
                        BooksListView()
                    }
                    Button("Add book", systemImage: "plus") {
                        showingAddBookSheet = true
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
                        Button("Add book") { showingAddBookSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}
