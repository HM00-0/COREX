import SwiftUI

struct MessageBubble: View {
    let message: ChatMessage

    var body: some View {
        
        HStack {
            if message.isFromUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(16)
                    .frame(maxWidth: 250, alignment: .trailing)
            } else {
                Text(message.text)
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
    }
}
