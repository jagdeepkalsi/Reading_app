import Foundation

struct Book: Identifiable, Codable {
    let id: String
    let title: String
    let level: Int
    let pages: [Page]
}

struct Page: Identifiable, Codable {
    let id: String
    let text: String
    let words: [String]
}
