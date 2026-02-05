import SwiftUI

struct ContentView: View {
    @StateObject private var bookStore = BookStore()

    var body: some View {
        NavigationView {
            LibraryView(bookStore: bookStore)
        }
    }
}

#Preview {
    ContentView()
}
