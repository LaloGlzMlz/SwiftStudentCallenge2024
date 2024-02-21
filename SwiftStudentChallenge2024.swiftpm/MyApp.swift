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

/*
 To do:
 
 not let characters of same name be created to avoid problem with bidirecctional connections
 add context menus to edit and delete
 make names in color functions more general for any model
 make focused field change with tapping intro in forms
 add main character field to display main characters before others
 bidirectional connections with textfield to specify what thisCharacter is to relatedCharacter
 when parent name is changed, child are not deleted but trash is generated, leaving empty card
 
*/
