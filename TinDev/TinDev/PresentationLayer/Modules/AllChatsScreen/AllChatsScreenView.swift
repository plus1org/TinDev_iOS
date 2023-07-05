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
    
    let chats = MockChatData.chats
    
    var filteredChats: [Chat] {
        return chats.filter { chat in
            self.searchText.isEmpty ? true : chat.personName.lowercased().contains(self.searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchText, placeholder: Localizable.AllChatsModule.search)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(filteredChats, id: \.id) { chat in
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
