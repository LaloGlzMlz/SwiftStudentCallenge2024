import SwiftUI
import SwiftData
@available(iOS 17, *)

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var isShowingItemSheet = false
    @State private var bookToEdit: Book?
    
    @Query(sort: \Book.title) var books: [Book]
    
    let columnLayout = Array(repeating:
                                GridItem(), count: 2)
    
    var body: some View {
        //        GeometryReader { geometry in
        //            ScrollView {
        //                LazyVGrid(columns: columnLayout) {
        //                    CharacterCardView()
        //                    CharacterCardView()
        //                    CharacterCardView()
        //                    CharacterCardView()
        //                    CharacterCardView()
        //                }
        //            }
        //            .padding()
        //        }
        
        NavigationStack {
            List {
                ForEach(books) { book in
                    BookCard(book: book)
                        .onTapGesture {
                            bookToEdit = book
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(books[index])
                    }
                }
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
