//
//  ChatPreviewView.swift
//

import SwiftUI

struct ChatPreviewView: View {
    var chat: Chat

    var body: some View {
        HStack(spacing: 16) {
            Image(chat.personImage)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(chat.personName)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    Text(chat.messageDate)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text(chat.messages.last?.text ?? "")
                        .font(.body)
                        .foregroundColor(.secondary)
                 
                    Spacer()
                    
                    Text("\(chat.messages.count)")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .frame(width: 22, height: 22)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .opacity(chat.messages.isEmpty ? 0 : 1)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct ChatPreviewView_Previews: PreviewProvider {
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

    static var previews: some View {
        ChatPreviewView(chat: chat)
    }
}
