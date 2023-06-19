//
//  ChatScreenView.swift
//  TinDev
//
//  Created by mttm on 19.06.2023.
//

import SwiftUI

struct ChatView: View {
    
    var chat: Chat
    
    @State private var messageText = ""
    
    var body: some View {
           NavigationView {
               VStack {
                   SearchBarView(text: $searchText, placeholder: "Поиск по чатам")
                   
                   ScrollView {
                       LazyVStack(alignment: .leading, spacing: 20) {
                           ForEach(chats.filter { chat in
                               self.searchText.isEmpty ? true : chat.personName.lowercased().contains(self.searchText.lowercased())
                           }, id: \.personName) { chat in
                               ChatPreviewView(chat: chat)
                           }
                       }
                   }
                   .padding(.top, 20)
                   Spacer()
               }
               .navigationBarTitle("Чаты", displayMode: .inline)
           }
           .hideKeyboard()
       }
        NavigationView {
            VStack {
                ScrollView {
                    Text("19 июня 2023 г.")
                        .padding()
                        .font(Fonts.regular12)
                        .foregroundColor(Pallete.customDarkGray)
                    ForEach(chat.messages) { message in
                        HStack {
                            if message.isUserMessage {
                                Spacer()
                                Text(message.text)
                                    .padding()
                                    .background(Pallete.customGray)
                                    .foregroundColor(Pallete.customBlack)
                                    .cornerRadius(18)
                            } else {
                                Text(message.text)
                                    .padding()
                                    .background(Pallete.mainColor)
                                    .foregroundColor(Pallete.customWhite)
                                    .cornerRadius(18)
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                HStack {
                    VStack {
                        TextField("Сообщение", text: $messageText)
                            .frame(height: 40)
                            .padding(.horizontal, 12)
                            .background(Pallete.customGray)
                            .cornerRadius(20)
                    }
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Text("Отправить")
                                    .foregroundColor(Pallete.mainColor)
                            }
                            .padding(.trailing, 12)
                        }
                    )
                }
                .padding(10)
            }
            .navigationBarTitle(Text(chat.personName), displayMode: .inline)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
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
        ChatView(chat: chat)
    }
}
