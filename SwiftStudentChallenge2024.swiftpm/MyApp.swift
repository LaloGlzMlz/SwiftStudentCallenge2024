import SwiftUI
import SwiftData
@available(iOS 17, *)

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            BooksView()
        }
        .modelContainer(for: [Book.self, Character.self, Connection.self])
    }
}

/*
 To do:
 
 if all connections are not empty but only connections of one character are empty, show empty screen
 edit list show only list of that book
 make names in color functions more general for any model
 make focused field change with tapping intro
 
 
*/
