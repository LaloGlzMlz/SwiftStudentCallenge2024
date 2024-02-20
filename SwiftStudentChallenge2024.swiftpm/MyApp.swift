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
 
 add context menus to edit and delete
 maked labeledcontent every textfield
 make names in color functions more general for any model
 make focused field change with tapping intro
 add main character field to display main characters before others
 bidirectional connections with textfield to specify what thisCharacter is to relatedCharacter
 
*/
