//
//  ChatScreenView.swift
//  TinDev
//
//  Created by mttm on 15.06.2023.
//

import SwiftUI

struct AllChatsScreenView: View {
    
    @State private var searchText = ""
    @State private var selectedChat: Chat?
    
    let chats: [Chat] = [
        Chat(isConfirmed: false, isMutted: false, personImage: "person1", personName: "Игорь Немцов", messageDate: "15 июн", messages: [
            Message(text: "Привет, как дела?", isUserMessage: false),
            Message(text: "Привет, все отлично!", isUserMessage: true),
            Message(text: "Договорились, тогда я буду рассчитывать на тебя", isUserMessage: false)
        ]),
        Chat(isConfirmed: false, isMutted: false, personImage: "person2", personName: "Юлия Симонова", messageDate: "14 июн", messages: [
            Message(text: "Встретимся завтра", isUserMessage: false),
            Message(text: "Хорошо, до встречи!", isUserMessage: true)
        ]),
        Chat(isConfirmed: true, isMutted: true, personImage: "person3", personName: "Илья Смирнов", messageDate: "13 июн", messages: [
            Message(text: "Привет, как дела?", isUserMessage: false),
            Message(text: "Привет, все хорошо, спасибо! А у тебя?", isUserMessage: true),
            Message(text: "Тоже все отлично, спасибо!", isUserMessage: false),
            Message(text: "Хорошо слышать. Что у тебя нового?", isUserMessage: true),
            Message(text: "Ничего особенного", isUserMessage: false),
            Message(text: "Работаем над новым приложением", isUserMessage: false),
            Message(text: "Звучит здорово! Удачи вам в этом", isUserMessage: true),
            Message(text: "Спасибо за поддержку!", isUserMessage: false),
            Message(text: "Не за что, всегда рад помочь!", isUserMessage: true)
        ])
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchText, placeholder: Localizable.AllChatsModule.search)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(chats.filter { chat in
                            self.searchText.isEmpty ? true : chat.personName.lowercased().contains(self.searchText.lowercased())
                        }, id: \.id) { chat in
                            NavigationLink(destination: ChatView(chat: chat)) {
                                ChatPreviewView(chat: chat)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding(.top, 20)
                Spacer()
                Divider()
            }
            .navigationBarTitle(Localizable.AllChatsModule.chats, displayMode: .inline)
        }
    }
}

struct AllChatsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AllChatsScreenView()
    }
}
