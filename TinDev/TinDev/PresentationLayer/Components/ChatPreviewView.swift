//
//  ChatPreviewView.swift
//

import SwiftUI

struct ChatPreviewView: View {
   
    var chat: Chat
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(chat.personImage)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(chat.personName)
                        .font(.headline)
                        .foregroundColor(.primary)
                    if chat.isMutted {
                        Image(systemName: Images.muteIcon)
                            .foregroundColor(Pallete.customDarkGray)
                    }
                    Spacer()
                    Text(chat.messageDate)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text(chat.messages.last?.text ?? "")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    
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
    static var previews: some View {
        ChatPreviewView(chat: MockChatData.chats[2])
    }
}
