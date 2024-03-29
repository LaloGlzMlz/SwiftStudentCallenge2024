import SwiftUI

struct SymbolIcon: View {
    
    let icon: String
    @Binding var selection: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 25))
            .foregroundStyle(self.selection == icon ? Color.accentColor : Color.primary)
            .onTapGesture {
                
                // Assign binding value
                withAnimation {
                    self.selection = icon
                }
            }
    }
    
}

#Preview {
    SymbolIcon(icon: "beats.powerbeatspro", selection: .constant("star.bubble"))
}
