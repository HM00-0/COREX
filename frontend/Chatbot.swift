//
//  Chatbot.swift
//  COREX
//
//  Created by snlcom on 5/8/25.
//

import Foundation

class Chatbot: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var userInput: String = ""

    func sendMessage() {
        let input = userInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !input.isEmpty else { return }

        let userMessage = ChatMessage(text: input, isFromUser: true, isAnimated: false)
        messages.append(userMessage)
        userInput = ""


        let url = URL(string: "http://192.168.0.3:8000/chat")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")


        let body: [String: Any] = [
            "question": input,
            "history": [],
            "top_k": 3
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ API 요청 실패:", error)
                    let errorMessage = ChatMessage(text: "Error: Unable to connect to server.", isFromUser: false, isAnimated: true)
                    self.messages.append(errorMessage)
                    return
                }

                guard let data = data else {
                    let errorMessage = ChatMessage(text: "Error: No data received.", isFromUser: false, isAnimated: true)
                    self.messages.append(errorMessage)
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode(ChatResponse.self, from: data)
                    let botReply = ChatMessage(text: decoded.answer, isFromUser: false, isAnimated: true)
                    self.messages.append(botReply)
                } catch {
                    print("❌ JSON 디코딩 실패:", error)
                    let errorMessage = ChatMessage(text: "Error: Invalid response format.", isFromUser: false, isAnimated: true)
                    self.messages.append(errorMessage)
                }
            }
        }

        task.resume()
    }
}

struct ChatResponse: Decodable {
    let answer: String
}

