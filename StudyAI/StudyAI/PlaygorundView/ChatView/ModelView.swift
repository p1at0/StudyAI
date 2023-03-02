//
//  ModelView.swift
//  StudyAI
//
//  Created by Abdulla on 11.02.2023.
//

import SwiftUI

struct Model: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
    let max_tokens: Int
}

struct ModelResponse: Decodable {
    let id: String
    let choices: [ModelChoice]
}

struct ModelChoice: Decodable {
    let text: String
}

struct MessageModel {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case user
    case chatAI
}
