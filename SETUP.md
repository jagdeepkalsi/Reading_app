# Reading App Setup Guide

## Quick Start - Super Simple!

This is a SwiftUI iOS app for teaching kids to read, inspired by Bob Books.

### Features
- 📚 Simple, progressive reading books (Level 1 CVC words)
- 🎯 Tap any word to hear it pronounced
- 🔊 Read-aloud mode for the whole page
- 🎉 Celebration animations when completing a book
- 🎨 Playful, kid-friendly interface with rounded fonts
- ✨ Bounce animations when tapping words

### How to Run (3 Easy Steps!)

1. **Double-click** `ReadingApp.xcodeproj` in Finder
2. **Select a simulator** at the top (like "iPhone 15" or "iPad Pro")
3. **Click the Play button** ▶️ (or press Cmd+R)

That's it! The app will launch in the simulator.

### Alternative: Command Line
```bash
# Open the project in Xcode
open ReadingApp.xcodeproj

# Or build and run from terminal
xcodebuild -project ReadingApp.xcodeproj -scheme ReadingApp -destination 'platform=iOS Simulator,name=iPhone 15'
```

### Project Structure
```
ReadingApp/
├── ReadingAppApp.swift          # App entry point
├── ContentView.swift             # Root view
├── Models/
│   ├── Book.swift               # Book and Page data models
│   └── BookStore.swift          # Book library manager
└── Views/
    ├── LibraryView.swift        # Book selection screen
    └── BookReadingView.swift    # Reading interface
```

### Starter Content

The app includes 3 starter books:
1. **Mat** - Introduction to simple words
2. **A Cat** - Building vocabulary
3. **Rat and Bat** - Simple sentences

All books use Level 1 phonics (CVC words with short 'a' sound).

### Adding More Books

Edit `ReadingApp/Models/BookStore.swift` and add new books to the `createStarterBooks()` function:

```swift
Book(
    id: "your-book-id",
    title: "Your Book Title",
    level: 1,
    pages: [
        Page(id: "1", text: "Your text", words: ["Your", "text"]),
        // Add more pages...
    ]
)
```

### Requirements
- iOS 15.0+
- Xcode 14.0+
- SwiftUI

### For Parents
- Tap the speaker icon to have the page read aloud
- Your child can tap individual words to hear them
- Words will bounce and change color when tapped
- A celebration appears when finishing a book
- Start with "Mat" for the easiest introduction

### Next Steps
- Add more books with different phonics patterns (short e, i, o, u)
- Add simple illustrations for each page
- Track progress across sessions
- Add sound effects for interactions
- Create a rewards/badge system
