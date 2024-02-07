import SwiftUI

struct ContentView: View {
    let columnLayout = Array(repeating:
                                GridItem(), count: 2)
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    CharacterCardView()
                    CharacterCardView()
                    CharacterCardView()
                    CharacterCardView()
                }
            }
            .padding()
        }
        
    }
}
