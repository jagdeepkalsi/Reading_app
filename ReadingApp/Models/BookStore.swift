import Foundation

class BookStore: ObservableObject {
    @Published var books: [Book] = []

    init() {
        loadBooks()
    }

    private func loadBooks() {
        // Load from JSON or use default books
        books = createStarterBooks()
    }

    private func createStarterBooks() -> [Book] {
        return [
            Book(
                id: "mat",
                title: "Mat",
                level: 1,
                pages: [
                    Page(id: "1", text: "Mat", words: ["Mat"]),
                    Page(id: "2", text: "Cat on mat", words: ["Cat", "on", "mat"]),
                    Page(id: "3", text: "Cat sat on mat", words: ["Cat", "sat", "on", "mat"])
                ]
            ),
            Book(
                id: "cat",
                title: "A Cat",
                level: 1,
                pages: [
                    Page(id: "1", text: "A cat", words: ["A", "cat"]),
                    Page(id: "2", text: "A fat cat", words: ["A", "fat", "cat"]),
                    Page(id: "3", text: "A fat cat sat", words: ["A", "fat", "cat", "sat"])
                ]
            ),
            Book(
                id: "rat",
                title: "Rat and Bat",
                level: 1,
                pages: [
                    Page(id: "1", text: "A rat", words: ["A", "rat"]),
                    Page(id: "2", text: "A bat", words: ["A", "bat"]),
                    Page(id: "3", text: "Rat and bat", words: ["Rat", "and", "bat"]),
                    Page(id: "4", text: "Rat and bat sat", words: ["Rat", "and", "bat", "sat"])
                ]
            )
        ]
    }
}
