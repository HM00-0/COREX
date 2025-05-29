import SwiftUI

struct TypingMessageBubble: View {
    let fullText: String
    let isFromUser: Bool

    @State private var displayedText = ""
    @State private var currentIndex = 0
    let typingSpeed: TimeInterval = 0.01

    var body: some View {
        HStack {
            if isFromUser {
                Spacer()
                Text(displayedText)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(16)
                    .frame(maxWidth: 250, alignment: .trailing)
            } else {
                Text(displayedText)
                    .padding()
                    .background(Color.blue.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(16)
                    .frame(maxWidth: 250, alignment: .leading)
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 2)
        .onAppear {
            startTyping()
        }
    }

    func startTyping() {
        Timer.scheduledTimer(withTimeInterval: typingSpeed, repeats: true) { timer in
            if currentIndex < fullText.count {
                let index = fullText.index(fullText.startIndex, offsetBy: currentIndex + 1)
                displayedText = String(fullText[..<index])
                currentIndex += 1
            } else {
                timer.invalidate()
            }
        }
    }
}
