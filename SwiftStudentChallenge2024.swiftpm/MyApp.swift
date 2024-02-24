import SwiftUI
import SwiftData


@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            BooksView()
        }
        .modelContainer(for: [Book.self, BookCharacter.self, Connection.self])
    }
}
