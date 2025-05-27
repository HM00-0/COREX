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

        // 사용자 메시지 추가
        let userMessage = ChatMessage(text: input, isFromUser: true)
        messages.append(userMessage)
        userInput = ""

        // ✅ API 요청 생성
        let url = URL(string: "http://192.168.0.3:8000/chat")!  // 로컬 서버 주소
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // body JSON 구성
        let body: [String: Any] = [
            "question": input,
            "history": [],
            "top_k": 3
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        // 네트워크 요청 수행
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ API 요청 실패:", error)
                    let errorMessage = ChatMessage(text: "Error: Unable to connect to server.", isFromUser: false)
                    self.messages.append(errorMessage)
                    return
                }

                guard let data = data else {
                    let errorMessage = ChatMessage(text: "Error: No data received.", isFromUser: false)
                    self.messages.append(errorMessage)
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode(ChatResponse.self, from: data)
                    let botReply = ChatMessage(text: decoded.answer, isFromUser: false)
                    self.messages.append(botReply)
                } catch {
                    print("❌ JSON 디코딩 실패:", error)
                    let errorMessage = ChatMessage(text: "Error: Invalid response format.", isFromUser: false)
                    self.messages.append(errorMessage)
                }
            }
        }

        task.resume()
    }
}

// ChatResponse 모델 정의
struct ChatResponse: Decodable {
    let answer: String
}

