//
//  ChatScreenView.swift
//  TinDev
//
//  Created by mttm on 15.06.2023.
//

import SwiftUI

struct ChatScreenView: View {
    
    @State private var searchText = ""
    
    let chats: [Chat] = [
        Chat(personImage: "person1", personName: "Игорь Немцов", messageDate: "15 июн", lastMessageText: "Договорились, тогда я буду рассчитывать на тебя", messageCount: "1"),
        Chat(personImage: "person2", personName: "Юлия Симонова", messageDate: "14 июн", lastMessageText: "Встретимся завтра", messageCount: "0"),
        Chat(personImage: "person3", personName: "Илья Смирнов", messageDate: "13 июн", lastMessageText: "Спасибо за помощь", messageCount: "5")
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
           .hideKeyboard()
       }
}

struct ChatScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreenView()
    }
}
