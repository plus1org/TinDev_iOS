//
//  TinDevApp.swift
//

import SwiftUI

@main
struct TinDevApp: App {
    
    static var chat = Chat(
        personImage: "person",
        personName: "Игорь Немцов",
        messageDate: "15 июн",
        messages: [
            Message(text: "Привет, как дела?", isUserMessage: false),
            Message(text: "Привет, все отлично!", isUserMessage: true),
            Message(text: "Договорились, тогда я буду рассчитывать на тебя", isUserMessage: false)
        ]
    )
    
    var body: some Scene {
        WindowGroup {
            ChatView(chat: TinDevApp.chat)
        }
    }
}
