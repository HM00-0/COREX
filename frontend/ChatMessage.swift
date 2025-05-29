//
// Structs properties of ChatMessage
//
//  ChatMessage.swift
//  COREX
//
//  Created by snlcom on 5/8/25.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isFromUser: Bool
    let isAnimated: Bool
}
