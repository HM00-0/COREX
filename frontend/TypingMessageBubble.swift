import SwiftUI

struct TypingMessageBubble: View {
    let fullText: String
    let isFromUser: Bool

    @State private var displayedText = ""
    @State private var currentIndex = 0
    let typingSpeed: TimeInterval = 0.03 // 한 글자당 딜레이 (빠르기 조절 가능)

    var body: some View {
        HStack {
            if isFromUser {
                Spacer()
                Text(displayedText)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .frame(maxWidth: 250, alignment: .trailing)
            } else {
                Text(displayedText)
                    .padding()
                    .background(Color.pink)
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
