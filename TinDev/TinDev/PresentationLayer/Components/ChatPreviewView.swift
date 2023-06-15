//
//  ChatPreviewView.swift
//  TinDev
//
//  Created by mttm on 15.06.2023.
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
                        .font(Fonts.regular13)
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text(chat.lastMessageText)
                        .font(Fonts.regular15)
                        .foregroundColor(.secondary)
                 
                    Spacer()
                    
                    Text(chat.messageCount)
                        .font(Fonts.regular12)
                        .foregroundColor(.white)
                        .frame(width: 22, height: 22)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .opacity(Int(chat.messageCount) == 0 ? 0 : 1)
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
        lastMessageText: "Договорились, тогда я буду рассчитывать на тебя",
        messageCount: "1"
    )

    static var previews: some View {
        ChatPreviewView(chat: chat)
    }
}
