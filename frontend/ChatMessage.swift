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
    let id = UUID() // id to control them when needed? I guess?
    let text: String // text as string
    let isFromUser: Bool // true-userMessage, false-botMessage
    let isAnimated: Bool
    /// ADD MORE PROPERTIES IF NEEDED
}
