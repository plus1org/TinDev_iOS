//
//  ChatScreenView.swift
//  TinDev
//
//  Created by mttm on 15.06.2023.
//

import SwiftUI

struct AllChatsScreenView: View {
    
    @State private var searchText = ""
    
    let chats: [Chat] = [
        Chat(personImage: "person1", personName: "Игорь Немцов", messageDate: "15 июн", messages: [
            Message(text: "Привет, как дела?", isUserMessage: false),
            Message(text: "Привет, все отлично!", isUserMessage: true),
            Message(text: "Договорились, тогда я буду рассчитывать на тебя", isUserMessage: false)
        ]),
        Chat(personImage: "person2", personName: "Юлия Симонова", messageDate: "14 июн", messages: [
            Message(text: "Встретимся завтра", isUserMessage: false),
            Message(text: "Хорошо, до встречи!", isUserMessage: true)
        ]),
        Chat(personImage: "person3", personName: "Илья Смирнов", messageDate: "13 июн", messages: [
            Message(text: "Спасибо за помощь", isUserMessage: false),
            Message(text: "Не за что, всегда рад помочь!", isUserMessage: true)
        ])
    ]

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
       }
}

struct AllChatsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AllChatsScreenView()
    }
}
