import SwiftUI
import AVFoundation

struct BookReadingView: View {
    let book: Book
    @State private var currentPageIndex = 0
    @State private var selectedWord: String?
    @State private var wordScale: [String: CGFloat] = [:]
    @State private var showCelebration = false
    private let speechSynthesizer = AVSpeechSynthesizer()

    var currentPage: Page {
        book.pages[currentPageIndex]
    }

    var body: some View {
        ZStack {
            // Background gradient for playful feel
            LinearGradient(
                colors: [Color.orange.opacity(0.1), Color.yellow.opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                // Page indicator
                Text("Page \(currentPageIndex + 1) of \(book.pages.count)")
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)

                Spacer()

                // Words display - large and tappable
                VStack(spacing: 20) {
                    ForEach(currentPage.words, id: \.self) { word in
                        Text(word)
                            .font(.system(size: 56, weight: .heavy, design: .rounded))
                            .foregroundColor(selectedWord == word ? .orange : .primary)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 20)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(selectedWord == word ?
                                          Color.orange.opacity(0.2) :
                                          Color.white.opacity(0.8))
                                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                            )
                            .scaleEffect(wordScale[word] ?? 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: wordScale[word])
                            .onTapGesture {
                                speakWord(word)
                            }
                    }
                }

                Spacer()

                // Navigation buttons
                HStack(spacing: 40) {
                    Button(action: previousPage) {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(currentPageIndex > 0 ? .blue : .gray)
                    }
                    .disabled(currentPageIndex == 0)

                    Button(action: readPage) {
                        Image(systemName: "speaker.wave.2.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.green)
                    }

                    Button(action: nextPage) {
                        Image(systemName: "chevron.right.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(currentPageIndex < book.pages.count - 1 ? .blue : .gray)
                    }
                    .disabled(currentPageIndex >= book.pages.count - 1)
                }
                .padding(.bottom, 40)
            }
            .padding()

            // Celebration overlay
            if showCelebration {
                CelebrationView()
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func nextPage() {
        if currentPageIndex < book.pages.count - 1 {
            currentPageIndex += 1
            selectedWord = nil
        } else {
            // Last page - show celebration
            withAnimation {
                showCelebration = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showCelebration = false
                }
            }
        }
    }

    private func previousPage() {
        if currentPageIndex > 0 {
            currentPageIndex -= 1
            selectedWord = nil
        }
    }

    private func speakWord(_ word: String) {
        selectedWord = word

        // Bounce animation
        wordScale[word] = 1.3
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            wordScale[word] = 1.0
        }

        let utterance = AVSpeechUtterance(string: word)
        utterance.rate = 0.4 // Slower for kids
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(utterance)

        // Clear selection after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            selectedWord = nil
        }
    }

    private func readPage() {
        let utterance = AVSpeechUtterance(string: currentPage.text)
        utterance.rate = 0.4
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(utterance)
    }
}

// Celebration view for completing a book
struct CelebrationView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("🎉")
                    .font(.system(size: 100))
                Text("Great Job!")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Text("You finished the book!")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding(40)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.green.gradient)
                    .shadow(radius: 20)
            )
        }
    }
}
