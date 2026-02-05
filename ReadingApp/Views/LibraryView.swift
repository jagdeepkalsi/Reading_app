import SwiftUI

struct LibraryView: View {
    @ObservedObject var bookStore: BookStore

    var body: some View {
        ZStack {
            // Playful background
            LinearGradient(
                colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(bookStore.books) { book in
                        NavigationLink(destination: BookReadingView(book: book)) {
                            HStack(spacing: 15) {
                                // Book icon
                                Image(systemName: "book.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.blue)

                                VStack(alignment: .leading, spacing: 8) {
                                    Text(book.title)
                                        .font(.system(size: 28, weight: .bold, design: .rounded))
                                        .foregroundColor(.primary)
                                    Text("Level \(book.level) • \(book.pages.count) pages")
                                        .font(.system(size: 16, weight: .medium, design: .rounded))
                                        .foregroundColor(.secondary)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding(20)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
        .navigationTitle("📚 My Books")
    }
}
